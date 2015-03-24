/* @pjs preload="img/pokeball.png,img/pikachu.png,img/charmander.png,img/squirtle.png,img/bulbasaur.png"; */
PImage imgPokeball, imgPikachu, imgCharmander, imgSquirtle, imgBulbasaur;
int centerX, centerY;
int maxArmLength;
int padding = 10;

void setup() {
    size(150, 150);
    colorMode(HSB, 1);
    imageMode(CENTER);
    centerX = width / 2;
    centerY = height / 2;
    maxArmLength = min(centerX, centerY) - padding;
}

void draw() {
    // set background
    background(24/360, 0.8, 0.8);

    // draw clock
    CColor clockColor = new CColor(1, 1, 1);
    float[] hsv = clockColor.hsv();
    fill(hsv[0], hsv[1], hsv[2]);
    rect(padding, padding, width - 2 * padding, height - 2 * padding);

    // draw flag
    fill(0, 1, 1);
    ellipse(centerX, centerY, width / 3, height / 3);

    // set the color of the clock arm
    stroke(0, 0, clockColor.getOppositeBrightness());

    drawClockArms(getCountryTime('Japan'));
}

