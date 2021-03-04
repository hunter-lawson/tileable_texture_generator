class Texture {
    PVector pos;
    float w, h, inc;
    Texture(float w, float h, float inc) {
        pos = new PVector(w, h);
        this.w = w;
        this.h = h;
        this.inc = inc;
    }

    void createTexture() {
        //outer circumpherence = width, inner = height, r = c/(2pi)
        //inner width = r, outer = R-r
        
        float r1 = w/TWO_PI;
        float r2 = h/TWO_PI;
        //create looping horizontal texture
        //move in circle through z plane, and move down for each y value
        int yCount = 0;
        int xCount = 0;
        for(float theta=0;theta<=TWO_PI;theta+=inc) {
            for(float phi=0;phi<=TWO_PI;phi+=inc) {
                float x = 2*pos.x+cos(phi)*(r1+r2*cos(theta));
                float y = 2*pos.y+sin(phi)*(r1+r2*cos(theta));
                float z = 2*pos.y+r2*sin(theta);

                float noiseValue = map(noise(x, y, z), 0, 1, 0, 255);
                set(xCount, yCount, color(noiseValue));
                yCount = int(map(phi, 0, TWO_PI, 0, height));
            }
            xCount = int(map(theta, 0, TWO_PI, 0, width));
        }
    }

    void update(PVector n) {
        pos = n;
    }
}