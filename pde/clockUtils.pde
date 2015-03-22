function drawClockArms(time) {
    if (typeof time === 'undefined') {
        time = new Date();
    }

    // Moving hours arm by small increments
    float hoursPosition = (time.getHours() % 12 + time.getMinutes() / 60) / 12;
    drawArm(hoursPosition, 0.5, 5);

    // Moving minutes arm by small increments
    float minutesPosition = (time.getMinutes() + time.getSeconds() / 60) / 60;
    drawArm(minutesPosition, 0.80, 3);

    // Moving hour arm by second increments
    float secondsPosition = time.getSeconds() / 60;
    drawArm(secondsPosition, 0.90, 1);
}

function drawArm(position, lengthScale, weight) {
    strokeWeight(weight);
    line(centerX, centerY,
        centerX + sin(position * TWO_PI) * lengthScale * maxArmLength,
        centerY - cos(position * TWO_PI) * lengthScale * maxArmLength);
}

function getCountryTime(country) {
    var now = new Date();
    if (typeof countryTimezone[country] !== 'undefined') {
        var currentGMT = now.getTimezoneOffset() / -60;
        var millisecondsCountry = now.getTime() + (countryTimezone[country] - currentGMT) * 60 * 60 * 1000;
        return new Date(millisecondsCountry);
    }
    return now;
}

var countryTimezone = {
    'New York': -4,
    'London': 0,
    'Singapore': 8,
    'Japan': 9,
    'Sydney': 11
};