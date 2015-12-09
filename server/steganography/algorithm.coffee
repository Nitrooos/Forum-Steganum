module.exports "algorithm", content: """stegano=function(){function t(){return"function"!=typeof window.FileReader?(_write("The file API isn't supported on this browser yet."),!1):!0}function e(){if(!t())throw"Your browser cannot support stegano module! Update or install a modern browser!";n.integration=stegano.integration(),n.algorithm=stegano.algorithm(),n.events=stegano.events()}function i(t){return n[t]}var n={};return{run:e,module:i}}(),stegano.algorithm=function(){var n={hiding:{},retrieving:{}};return function(){n.hiding=stegano.algorithm.hiding(),n.retrieving=stegano.algorithm.retrieving()}(),{hiding:n.hiding.run,retrieving:n.retrieving.run}},stegano.algorithm.hiding=function(){function n(){console.log("Hiding")}return{run:n}},stegano.algorithm.retrieving=function(){function n(){console.log("Retrieving")}return{run:n}},stegano.events=function(){function t(){"normal"===n?n="secret":"secret"===n&&(n="normal")}function e(){stegano.module("algorithm").hiding()}var n="normal";return{switchView:t,sendMessage:e}},stegano.image.access=function(){function n(n,i,o){if(i>n.width||o>n.height)throw"Arguments out of image dimensions";var t=n.data,e=n.width*o+i,a={r:t[e+0],g:t[e+1],b:t[e+2],a:t[e+3]};return a}function t(i,o,a,n){if(!n)throw"None color to set specified";var t=i.data,e=i.width*a+o;t[e+0]=n.r,t[e+1]=n.g,t[e+2]=n.b,t[e+3]=n.a}return{getPixel:n,setPixel:t}},stegano.image=function(){var n={};!function(){n.loader=stegano.image.loader(),n.access=stegano.image.access()}()},stegano.image.loader=function(){function o(){n=new Image,n.onload=a,n.src=e.result}function a(){t.width=n.naturalWidth,t.height=n.naturalHeight;var e=t.getContext("2d");e.drawImage(n,0,0),i=e.getImageData(0,0,t.width,t.height)}function r(n){t=stegano.module("integration").getCanvas(),e=new FileReader,e.onload=o,e.readAsDataURL(n)}function g(){return i}var e,n,i,t;return{loadImage:r,getImageData:g}},stegano.integration.canvas=function(){function t(){n=document.createElement("canvas"),n.setAttribute("style","display:none"),n.width=0,n.height=0,document.getElementById(stegano.module("integration").getElementsIds().formId).appendChild(n)}function e(){return n}var n;return function(){t()}(),{get:e}},stegano.integration=function(){function t(){n.canvas=stegano.integration.canvas(),n.input=stegano.integration.input(),n["switch"]=stegano.integration["switch"]()}function e(){return void 0!==n.canvas?n.canvas.getImageData():void 0}function i(){return a}function o(){return void 0!==n.canvas?n.canvas.get():void 0}var n={},a={fileInputId:"image-file",postInputId:"post-message-id",formId:"image-form"};return{run:t,getImageData:e,getElementsIds:i,getCanvas:o}},stegano.integration.input=function(){function e(t,n){n.parentNode.insertBefore(t,n.nextSibling)}function i(){if(void 0!==t){var i=document.getElementById(t);n=document.createElement("input"),n.type="text",e(n,i)}}function o(){return n.value}var t,n;return function(){t=stegano.module("integration").getElementsIds().postInputId,i()}(),{secretText:o}},stegano.integration["switch"]=function(){function e(){if(void 0!==t){var e=document.getElementById(t);n=document.createElement("input"),n.type="checkbox",e.appendChild(n)}}var n,t;!function(){t=stegano.module("integration").getElementsIds().formId,e()}()};"""