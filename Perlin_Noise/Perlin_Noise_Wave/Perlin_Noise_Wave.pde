float v = 0.0;
float inc = 0.1;

void setup() {
  size(700, 150);
  noStroke();
  fill(0);
  noiseSeed(0);
  // noLoop();
  frameRate(15);
}

void draw() {
  background(255);
  for (int i = 0; i < width; i = i+5) {
    float n = noise(v) * 100.0;
    rect(i, 10 + n, 10, 20);
    v = v + inc;
  }
}
