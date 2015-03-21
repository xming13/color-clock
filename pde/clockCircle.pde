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

    // draw circle base
    fill(24/360, 0.8, 0.8);
    noStroke();
    ellipse(centerX, centerY, width, height);

    // draw clock
    CColor clockColor = new CColor(second() / 59, minute() / 59, hour() / 23);
    float[] hsv = clockColor.hsv();
    fill(hsv[0], hsv[1], hsv[2]);
    stroke(0, 0, clockColor.getOppositeBrightness());
    ellipse(centerX, centerY, width - 2 * padding, height - 2 * padding);

    drawClockArms();
}

