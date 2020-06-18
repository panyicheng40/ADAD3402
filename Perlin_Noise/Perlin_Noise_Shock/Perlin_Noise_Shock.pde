float v = 0.0;
float inc = 0.1;

void setup() {
  size(200, 200);
  noiseSeed(0);
  frameRate(25);
}

void draw() {
  background(255);
  strokeWeight(5);
  ellipse(100, 100, noise(v+inc)*100, noise(v+inc)*100);
  v = v + inc;
  inc++;
}
