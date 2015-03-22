// Global variables
int centerX, centerY;
int maxArmLength;
int padding = 10;

void setup() {
    size(150, 150);
    colorMode(HSB, 1);
    centerX = width / 2;
    centerY = height / 2;
    maxArmLength = min(centerX, centerY) - padding;
}

void draw() {
    // set transparent background
    background(0,0,0,0);

    // draw clock
    noStroke();
    for (int i = 0; i <= 11; i++) {
        drawPartClock(i);
    }

    stroke(0);
    drawClockArms();
}

// @param partNumber specify which part of the clock. zero-indexed: [0, 11]
function drawPartClock(partNumber) {
    int _second = second() - partNumber;
    int _minute = minute();
    int _hour = hour();

    if (_second < 0) {
        _second += 60;
        _minute--;

        if (_minute < 0) {
            _minute += 60;
            _hour--;

            if (_hour < 0) {
                _hour = 23;
            }
        }
    }

    // set hue to [0, 1]
    float hue = _second / 59;

    // set saturation to [0.5, 1]
    float saturation = _minute / 59 / 2 + 0.5;

    // set lightness to [0.25, 0.75]
    float lightness = _hour / 23 / 2 + 0.25;

    CColor clockColor = new CColor(hue, saturation, lightness);
    float[] hsv = clockColor.hsv();
    fill(hsv[0], hsv[1], hsv[2]);

    // - 7 * PI / 12 to move it back by one quarter and a half of twelfth
    arc(centerX, centerY, width, height, partNumber * PI / 6 - 7 * PI / 12, (partNumber + 1) * PI / 6 - 7 * PI / 12);
}

