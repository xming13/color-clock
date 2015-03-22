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

    // draw the points
    for (int i = 2; i <= 13; i++) {
        int angle = TWO_PI / 12 * i;
        float x = width / 2 + maxArmLength * sin(angle);
        float y = height / 2 - maxArmLength * cos(angle);

        switch (i) {
            case 2: fill(0, 1, 1); break;
            case 3: image(imgCharmander, x, y); continue;
            case 5: fill(0.66, 1, 1); break;
            case 6: image(imgSquirtle, x, y); continue;
            case 8: fill(0.33, 1, 1); break;
            case 9: image(imgBulbasaur, x, y); continue;
            case 11: fill(0.167, 1, 1); break;
            case 12: image(imgPikachu, x, y); continue;
            default: break;
        }

        ellipse(x, y, 10, 10);
    }

    // set the color of the clock arm
    stroke(0);

    drawClockArms(getCountryTime('Japan'));
}

