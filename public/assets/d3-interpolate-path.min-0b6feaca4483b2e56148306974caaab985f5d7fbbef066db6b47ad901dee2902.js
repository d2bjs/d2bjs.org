!function(t,e){"object"==typeof exports&&"undefined"!=typeof module?e(exports,require("d3-interpolate")):"function"==typeof define&&define.amd?define(["exports","d3-interpolate"],e):e(t.d3=t.d3||{},t.d3)}(this,function(t,e){"use strict";function n(t,e){function n(t,e){if(1===t.length)r.push(t[0]),u.push(t[0]);else{for(var i=Array(t.length-1),o=0;o<i.length;o++)0===o&&r.push(t[0]),o===i.length-1&&u.push(t[o+1]),i[o]=[(1-e)*t[o][0]+e*t[o+1][0],(1-e)*t[o][1]+e*t[o+1][1]];n(i,e)}}var r=[],u=[];return t.length&&n(t,e),{left:r,right:u.reverse()}}function r(t){var e={};return 4===t.length&&(e.x2=t[2][0],e.y2=t[2][1]),t.length>=3&&(e.x1=t[1][0],e.y1=t[1][1]),e.x=t[t.length-1][0],e.y=t[t.length-1][1],4===t.length?e.type="C":3===t.length?e.type="Q":e.type="L",e}function u(t,e){e=e||2;for(var r=[],u=t,i=1/e,o=0;o<e-1;o++){var a=i/(1-i*o),l=n(u,a);r.push(l.left),u=l.right}return r.push(u),r}function i(t,e,n){var i=[[t.x,t.y]];return null!=e.x1&&i.push([e.x1,e.y1]),null!=e.x2&&i.push([e.x2,e.y2]),i.push([e.x,e.y]),u(i,n).map(r)}function o(t,e){for(var n=Array(t),r=0;r<t;r++)n[r]=e;return n}function a(t){t=t.trim().replace(/ /g,",");var e=t[0],n=t.substring(1).split(",");return s[e.toUpperCase()].reduce(function(t,e,r){return t[e]=+n[r],t},{type:e})}function l(t){var e=t.type,n=s[e.toUpperCase()];return""+e+n.map(function(e){return t[e]}).join(",")}function p(t,e){var n={x1:"x",y1:"y",x2:"x",y2:"y"},r=["xAxisRotation","largeArcFlag","sweepFlag"];return t.type!==e.type&&"M"!==e.type.toUpperCase()&&!function(){var u={};Object.keys(e).forEach(function(i){var o=e[i],a=t[i];void 0===a&&(r.includes(i)?a=o:(void 0===a&&n[i]&&(a=t[n[i]]),void 0===a&&(a=0))),u[i]=a}),u.type=e.type,t=u}(),t}function c(t,e,n){var r=[];return"L"===e.type||"Q"===e.type||"C"===e.type?r=r.concat(i(t,e,n)):!function(){var u=g({},t);"M"===u.type&&(u.type="L"),r=r.concat(o(n-1).map(function(){return u})),r.push(e)}(),r}function h(t,e,n){var r=t.length-1,u=e.length-1,i=r/u,a=o(u).reduce(function(e,r,u){var o=Math.floor(i*u);if(n&&o<t.length-1&&n(t[o],t[o+1])){var a=i*u%1<.5;e[o]&&(a?o>0?o-=1:o<t.length-1&&(o+=1):o<t.length-1?o+=1:o>0&&(o-=1))}return e[o]=(e[o]||0)+1,e},[]),l=a.reduce(function(e,n,r){if(r===t.length-1){var u=o(n,g({},t[t.length-1]));return"M"===u[0].type&&u.forEach(function(t){t.type="L"}),e.concat(u)}return e.concat(c(t[r],t[r+1],n))},[]);return l.unshift(t[0]),l}function f(t){return null==t?"":t.trim().replace(/[Z]/gi,"").replace(/\s+/," ").replace(/([MLCSTQAHV])\s*/gi,"$1")}function y(t,n,r){var u=f(t),i=f(n),o=""===u?[]:u.split(/(?=[MLCSTQAHV])/gi),c=""===i?[]:i.split(/(?=[MLCSTQAHV])/gi);if(!o.length&&!c.length)return function(){return""};o.length?c.length||c.push(o[0]):o.push(c[0]);var y=o.map(a),g=c.map(a),s=Math.abs(c.length-o.length);0!==s&&(g.length>y.length?y=h(y,g,r):g.length<y.length&&(g=h(g,y,r))),y=y.map(function(t,e){return p(t,g[e])});var x=y.map(l).join(""),v=g.map(l).join("");null!=t&&"Z"!==t[t.length-1]||null!=n&&"Z"!==n[n.length-1]||(x+="Z",v+="Z");var d=e.interpolateString(x,v);return function(t){return 1===t?null==n?"":n:d(t)}}var g=Object.assign||function(t){for(var e=1;e<arguments.length;e++){var n=arguments[e];for(var r in n)Object.prototype.hasOwnProperty.call(n,r)&&(t[r]=n[r])}return t},s={M:["x","y"],L:["x","y"],H:["x"],V:["y"],C:["x1","y1","x2","y2","x","y"],S:["x2","y2","x","y"],Q:["x1","y1","x","y"],T:["x","y"],A:["rx","ry","xAxisRotation","largeArcFlag","sweepFlag","x","y"]};t.interpolatePath=y,Object.defineProperty(t,"__esModule",{value:!0})});