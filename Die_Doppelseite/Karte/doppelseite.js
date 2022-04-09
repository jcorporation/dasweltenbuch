"use strict";

karte.factor = 16204;
karte.width = 1417.3229;
karte.height = 1052.3622;

karte.calc = function(x, y) {
    var km = (Math.round(Math.sqrt(x * x + y * y) * karte.factor / karte.width) / 10);
    var tr = (Math.round(km / 55 * 10) / 10);
    return km + ' km, ' + tr + ' Tagesritte';
}

//init
window.addEventListener('load', function() {
    karte.init();
}, false);
