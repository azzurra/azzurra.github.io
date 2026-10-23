#!/usr/bin/env bash
# Validate static/pgp/*.asc and, given an output dir, build the WKD
# direct-method tree (<out>/.well-known/openpgpkey/hu/<hash>) from them.
#
#   scripts/wkd.sh            # validate only (PR gate)
#   scripts/wkd.sh public     # validate, then write public/.well-known/...
#
# The .asc files are the only source of truth: the binary hu/ files are
# never committed, they are regenerated on every build.
set -euo pipefail

domain=azzurra.chat
src=static/pgp
out=${1:-}

GNUPGHOME=$(mktemp -d)
export GNUPGHOME
trap 'rm -rf "$GNUPGHOME"' EXIT

# gpg-wks-client lives outside $PATH on Debian/Ubuntu.
wks=$(command -v gpg-wks-client || echo /usr/lib/gnupg/gpg-wks-client)

fail=0
err() { echo "✗ $*" >&2; fail=1; }

shopt -s nullglob
files=("$src"/*.asc)
[[ ${#files[@]} -gt 0 ]] || { echo "✗ no keys in $src" >&2; exit 1; }

for f in "${files[@]}"; do
  name=$(basename "$f" .asc)
  mbox="$name@$domain"

  if grep -q 'PRIVATE KEY' "$f"; then
    err "$f: contains a secret key"; continue
  fi

  colons=$(gpg --batch --with-colons --show-keys "$f" 2>/dev/null) \
    || { err "$f: not a valid OpenPGP key"; continue; }

  npub=$(grep -c '^pub:' <<<"$colons" || true)
  [[ $npub -eq 1 ]] || { err "$f: expected 1 key, found $npub"; continue; }

  # Field 2 is validity: e = expired, r = revoked.
  case $(awk -F: '/^pub:/ {print $2}' <<<"$colons") in
    e) err "$f: key is expired"; continue ;;
    r) err "$f: key is revoked"; continue ;;
  esac

  grep -q "^uid:[^:]*:.*<$mbox>" <<<"$colons" \
    || { err "$f: no uid <$mbox> (file name must match the mailbox)"; continue; }

  fpr=$(awk -F: '/^fpr:/ {print $10; exit}' <<<"$colons")
  echo "✓ $f → $mbox ($fpr)"

  [[ -n $out ]] || continue

  gpg --batch --quiet --import "$f"
  hash=$("$wks" --print-wkd-hash "$mbox" | awk '{print $1}')
  [[ -n $hash ]] || { err "$f: could not compute WKD hash"; continue; }

  mkdir -p "$out/.well-known/openpgpkey/hu"
  gpg --batch --export --export-options export-minimal \
    --export-filter keep-uid="mbox = $mbox" "$fpr" \
    > "$out/.well-known/openpgpkey/hu/$hash"
  echo "  wrote $out/.well-known/openpgpkey/hu/$hash"
done

exit $fail
