function drawClockArms() {
    // Moving hours arm by small increments
    float hoursPosition = (hour() % 12 + minute() / 60) / 12;
    drawArm(hoursPosition, 0.5, 5);

    // Moving minutes arm by small increments
    float minutesPosition = (minute() + second() / 60) / 60;
    drawArm(minutesPosition, 0.80, 3);

    // Moving hour arm by second increments
    float secondsPosition = second() / 60;
    drawArm(secondsPosition, 0.90, 1);
}

function drawArm(position, lengthScale, weight) {
    strokeWeight(weight);
    line(centerX, centerY,
        centerX + sin(position * TWO_PI) * lengthScale * maxArmLength,
        centerY - cos(position * TWO_PI) * lengthScale * maxArmLength);
}