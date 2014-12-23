var gradientPrefix = getCssValuePrefix('backgroundImage',
    'linear-gradient(left, #fff, #fff)');

function setColor() {
    var now = new Date();
    var resultFrom = getRgbFromDatetime(now);
    var rgbColorFrom = resultFrom[0];
    var textColor = resultFrom[1];

    console.log(rgbColorFrom[0] + ',' + rgbColorFrom[1] + ',' + rgbColorFrom[2]);
    var rgbStringFrom = 'rgba(' + rgbColorFrom[0] + ',' + rgbColorFrom[1] + ',' + rgbColorFrom[2] + ', 1.0)';

    var nowPlusOneSec = new Date(now + 1);
    var resultTo = getRgbFromDatetime(nowPlusOneSec);
    var rgbColorTo = resultTo[0];
    var rgbStringTo = 'rgba(' + rgbColorTo[0] + ',' + rgbColorTo[1] + ',' + rgbColorTo[2] + ', 0.5)';

    document.body.style.backgroundColor = rgbStringFrom;
    document.body.style.background = gradientPrefix + 'linear-gradient(' + rgbStringFrom + ', ' + rgbStringTo + ')';

    var currentTime = document.getElementById('current-time');
    currentTime.innerHTML = formatAMPM(now);
    currentTime.style.color = textColor;
}

// Detect which browser prefix to use for the specified CSS value
// (e.g., background-image: -moz-linear-gradient(...);
//        background-image:   -o-linear-gradient(...); etc).
//
function getCssValuePrefix(name, value) {
    var prefixes = ['', '-o-', '-ms-', '-moz-', '-webkit-'];

    // Create a temporary DOM object for testing
    var dom = document.createElement('div');

    for (var i = 0; i < prefixes.length; i++) {
        // Attempt to set the style
        dom.style[name] = prefixes[i] + value;

        // Detect if the style was successfully set
        if (dom.style[name]) {
            return prefixes[i];
        }
        dom.style[name] = '';   // Reset the style
    }
}

function getRgbFromDatetime(date) {
    var secondsIndex = Math.floor(date.getHours() * 3600 + date.getMinutes() * 60 + date.getSeconds());

    var colorH = secondsIndex % 32 * 8 / 255;
    secondsIndex = Math.floor(secondsIndex / 32);
    var colorV = secondsIndex % 32 * 8 / 255;
    secondsIndex = Math.floor(secondsIndex / 32);
    var colorS = secondsIndex % 32 * 8 / 255;

    return [hsvToRgb(colorH, colorS, colorV), colorV < 0.5 ? '#FFF' : '#000'];
}

function componentToHex(c) {
    var hex = c.toString(16);
    return hex.length == 1 ? "0" + hex : hex;
}

function rgbToHex(r, g, b) {
    return "#" + componentToHex(r) + componentToHex(g) + componentToHex(b);
}

function formatAMPM(date) {
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var seconds = date.getSeconds();
    var ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    minutes = minutes < 10 ? '0' + minutes : minutes;
    seconds = seconds < 10 ? '0' + seconds : seconds;
    var strTime = hours + ':' + minutes + ':' + seconds + ' ' + ampm;
    return strTime;
}

/**
 * Converts an HSV color value to RGB. Conversion formula
 * adapted from http://en.wikipedia.org/wiki/HSV_color_space.
 * Assumes h, s, and v are contained in the set [0, 1] and
 * returns r, g, and b in the set [0, 255].
 *
 * @param   Number  h       The hue
 * @param   Number  s       The saturation
 * @param   Number  v       The value
 * @return  Array           The RGB representation
 */
function hsvToRgb(h, s, v) {
    var r, g, b;

    var i = Math.floor(h * 6);
    var f = h * 6 - i;
    var p = v * (1 - s);
    var q = v * (1 - f * s);
    var t = v * (1 - (1 - f) * s);

    switch (i % 6) {
        case 0:
            r = v, g = t, b = p;
            break;
        case 1:
            r = q, g = v, b = p;
            break;
        case 2:
            r = p, g = v, b = t;
            break;
        case 3:
            r = p, g = q, b = v;
            break;
        case 4:
            r = t, g = p, b = v;
            break;
        case 5:
            r = v, g = p, b = q;
            break;
    }

    return [Math.floor(r * 255), Math.floor(g * 255), Math.floor(b * 255)];
}

window.onload = function() {

    setInterval(setColor, 1000);

    (function setHourColor() {
        var now = new Date();
        var times = document.querySelectorAll('.time');
        for (var i = 0; i < times.length; i++) {
            var time = times[i];
            var dataHour = time.getAttribute('data-time');
            if (dataHour) {
                var dateHour = new Date(now.getYear(), now.getMonth(), now.getDate(), dataHour, Math.random() * 60, Math.random() * 60, 0);
                var resultFrom = getRgbFromDatetime(dateHour);
                var rgbColorFrom = resultFrom[0];
                var textColor = resultFrom[1];

                time.style.backgroundColor = 'rgb(' + rgbColorFrom[0] + ',' + rgbColorFrom[1] + ',' + rgbColorFrom[2] + ')';
                time.style.background = gradientPrefix + 'linear-gradient(' +
                    'rgba(' + rgbColorFrom[0] + ',' + rgbColorFrom[1] + ',' + rgbColorFrom[2] + ', 1), ' +
                    'rgba(' + rgbColorFrom[0] + ',' + rgbColorFrom[1] + ',' + rgbColorFrom[2] + ', 0.5))';
                time.style.color = textColor;
            }
        }
    })();
}