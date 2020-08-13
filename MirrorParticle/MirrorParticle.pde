import gohai.glvideo.*;
GLCapture video;

int num = 1000;
float mts = PI/24;
int r = 100;
int rdtr = 5;
int rdu = 1;
PVector v[] = new PVector[num];
boolean mv = true;
color c[] = new color[num];
float theta[] = new float[num];
float mtheta[] = new float[num];
float dtheta[] = new float[num];
float easing[] = new float[num];
int rdt[] = new int[num];

void setup() {
  colorMode(RGB,255,255,255);
  size(displayWidth, displayHeight, P2D);
  for(int i =0;i<num-1;i++) {
    c[i] = color(random(100,200),random(100,200),random(100,200));
    v[i] = new PVector(random(width),random(height));
    theta[i] = round(random(360));
    dtheta[i] = random(mts);
    mtheta[i] = theta[i]/180*PI;
    rdt[i] = round(random(-rdtr,rdtr));
    easing[i] = random(0.02,0.3);
  }
  video = new GLCapture(this);
  video.start();
  frameRate(60);
}

void draw() {
  fill(25, 25, 25, 25);
  rect(0,0,width,height);
  pushMatrix();
  noStroke();
  if(mv) {
    for(int i = 0;i<num-1;i++) {
      mtheta[i] += dtheta[i];
      v[i].lerp(mouseX+cos(mtheta[i])*(rdt[i]+r), mouseY+sin(mtheta[i])*(rdt[i]+r),0,easing[i]);
      fill(c[i]);
      ellipse(v[i].x, v[i].y, rdu,rdu);
    }
  }
  if(!mv) {
    background(0);
    if (video.available()) {
      video.read();
    }
    image(video, 0, 0, width, height);
  
    color center;
    center = video.get(video.width/2, video.height/2);
    fill(center);
    ellipse(width/2+width, height/2, 1200, 2500);
    ellipse(width/2-width, height/2, 1200, 2500);
  }
  
  
  popMatrix();
  fill(0);
  rect(0,0,width,15);
  fill(255);
  textAlign(LEFT,TOP);
  text("r = "+r,0,0);
  text("fps = "+round(frameRate),40,0);
  
  if(mv) {
    fill(255,0,0);
    text("Running",100,0);
  }
  if(!mv) {
    text("Mirror",100,0);
  }
  fill(255,0,0);
  text("motion",150,0);
}

void mousePressed() {
  mv = !mv;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if(e == -1) 
    r+=10;
  if(e == 1) 
    r-=10;
}