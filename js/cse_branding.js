(function(){var f=document.getElementById("cse-search-box");f||(f=document.getElementById("searchbox_demo"));if(f&&f.q){var q=f.q,n=navigator,l=location,du=function(n,v){var u=document.createElement("input");return u.name=n,u.value=v,u.type="hidden",f.appendChild(u),u},su=function(n,t,v,l){if(!encodeURIComponent||!decodeURIComponent)return;var regexp=new RegExp("(?:[?&]"+n+"=)([^&#]*)"),existing=regexp.exec(t);existing&&(v=decodeURIComponent(existing[1]));var delimIndex=v.indexOf("://");delimIndex>=0&&(v=v.substring(delimIndex+"://".length,v.length));var v_sub=v.substring(0,l);while(encodeURIComponent(v_sub).length>l)v_sub=v_sub.substring(0,v_sub.length-1);du(n,v_sub)},pl=function(he){var ti=0,tsi=0,tk=0,pt;return function(){var ct=(new Date).getTime();if(pt){var i=ct-pt;ti+=i,tsi+=i*i}tk++,pt=ct,he.value=[ti,tsi,tk].join("j")}},append=!1;if(n.appName=="Microsoft Internet Explorer"){var s=f.parentNode.childNodes;for(var i=0;i<s.length;i++)if(s[i].nodeName=="SCRIPT"&&s[i].attributes.src&&s[i].attributes["src"].nodeValue==unescape("http://www.google.com/coop/cse/brand?form=cse-search-box&lang=it")){append=!0;break}}else append=!0;if(append){var loc=document.location.toString(),ref=document.referrer;su("siteurl",loc,loc,250),su("ref",loc,ref,750),q.addEventListener?q.addEventListener("keyup",pl(du("ss","")),!1):q.attachEvent&&q.attachEvent("onkeyup",pl(du("ss","")))}n.platform=="Win32"&&(q.style.cssText="border: 1px solid #7e9db9; padding: 2px;"),window.history.navigationMode&&(window.history.navigationMode="compatible");var b=function(){q.value==""&&(q.style.background="#FFFFFF url(http://www.google.com/cse/intl/it/images/google_custom_search_watermark.gif) 14px no-repeat")},f=function(){q.style.background="#ffffff"};q.onfocus=f,q.onblur=b,/[&?]q=[^&]/.test(l.search)||b()}})();