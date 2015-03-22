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
    // set background
    background(24/360, 0.8, 0.8);

    // draw clock
    CColor clockColor = new CColor(second() / 59, minute() / 59, hour() / 23);
    float[] hsv = clockColor.hsv();
    fill(hsv[0], hsv[1], hsv[2]);
    rect(padding, padding, width - 2 * padding, height - 2 * padding);

    // set the color of the clock arm
    stroke(0, 0, clockColor.getOppositeBrightness());

    drawClockArms(getCountryTime('London'));
}

