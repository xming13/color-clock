/* @pjs preload="img/pokeball.png,img/pikachu.png,img/charmander.png",img/squirtle.png,img/bulbasaur.png; */
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
    background(1);

    // draw clock
    noStroke();

    // yellow
    fill(0.167, 0.6, 0.9);
    triangle(0, 0, width, 0, centerX, centerY);

    // red
    fill(0, 0.6, 0.9);
    triangle(width, 0, width, height, centerX, centerY);

    // blue
    fill(0.66, 0.6, 0.9);
    triangle(0, height, width, height, centerX, centerY);

    // green
    fill(0.33, 0.6, 0.9);
    triangle(0, 0, 0, height, centerX, centerY);

    int sizeImage = 40;

    imgPokeball = loadImage('img/pokeball.png');
    imgPokeball.resize(0, 50);
    image(imgPokeball, width / 2, height / 2);

    imgPikachu = loadImage('img/pikachu.png');
    imgPikachu.resize(sizeImage, 0);

    imgCharmander = loadImage('img/charmander.png');
    imgCharmander.resize(sizeImage, 0);

    imgSquirtle = loadImage('img/squirtle.png');
    imgSquirtle.resize(sizeImage, 0);

    imgBulbasaur = loadImage('img/bulbasaur.png');
    imgBulbasaur.resize(sizeImage, 0);

    // draw the point
    int angle = TWO_PI / 12;
    float sinRes = abs(maxArmLength * sin(angle));
    float cosRes = abs(maxArmLength * cos(angle));

    // point 11
    float x = width / 2 - sinRes;
    float y = height / 2 - cosRes;
    fill(0.167, 1, 1);
    ellipse(x, y, 10, 10);

    // point 12
    x = width / 2;
    y = height / 2 - maxArmLength;
    image(imgPikachu, x, y);

    // point 1
    x = width / 2 + sinRes;
    y = height / 2 - cosRes;
    ellipse(x, y, 10, 10);

    // point 2
    x = width / 2 + cosRes;
    y = height / 2 - sinRes;
    fill(0, 1, 1);
    ellipse(x, y, 10, 10);

    // point 3
    x = width / 2 + maxArmLength;
    y = height / 2;
    image(imgCharmander, x, y);

    // point 4
    x = width / 2 + cosRes;
    y = height / 2 + sinRes;
    ellipse(x, y, 10, 10);

    // point 5
    x = width / 2 + sinRes;
    y = height / 2 + cosRes;
    fill(0.66, 1, 1);
    ellipse(x, y, 10, 10);

    // point 6
    x = width / 2;
    y = height / 2 + maxArmLength;
    image(imgSquirtle, x, y);

    // point 7
    x = width / 2 - sinRes;
    y = height / 2 + cosRes;
    ellipse(x, y, 10, 10);

    // point 8
    x = width / 2 - cosRes;
    y = height / 2 - sinRes;
    fill(0.33, 1, 1);
    ellipse(x, y, 10, 10);

    // point 9
    x = width / 2 - maxArmLength;
    y = height / 2;
    image(imgBulbasaur, x, y);

    // point 10
    x = width / 2 - cosRes;
    y = height / 2 + sinRes;
    ellipse(x, y, 10, 10);

    // set the color of the clock arm
    stroke(0);

    drawClockArms();
}

