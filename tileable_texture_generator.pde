Texture t = new Texture(10, 4, 0.005);
void setup() {
    size(800, 800);
    noiseDetail(10, 0.5);
}

void draw() {
    t.createTexture();
}

void keyPressed() {
    if(key == ' ') {
        noiseSeed(int(random(10000)));
        t.createTexture();
    }
    if(key == 's') {
        saveFrame();
    }
}