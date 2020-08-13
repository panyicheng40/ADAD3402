import gohai.glvideo.*;
GLCapture video;

PImage myImage;
PImage myImage2;
PImage[] Image30 = new PImage[30];
int num;
int num2;
int pixelCount;
int xsstart;

void setup() {
  frameRate(30);
  size(640, 480, P2D);
  video=new GLCapture(this);
  video.start();
  num=0;
  num2=0;
  pixelCount = width*height;
  xsstart=0;
}
void draw() {
  if(video.available()) {
    video.read();
    video.loadPixels(); 
    myImage=loadImage("row.png");
    myImage.loadPixels();
    for (int i = 0; i < pixelCount; i++) {
      myImage.pixels[i] = video.pixels[i];
    }
  myImage.updatePixels();
  if(num<30) {
    Image30[num]=myImage;
    num=num+1;
    }
    else {
      xsstart=1;
      num=0;
    }
    if(xsstart==1) {
      if(num2<30) {
        myImage2=Image30[num2];
        image(myImage2, 0, 0, width, height);
        num2=num2+1;
      }
      else {
        num2=0;
      }
    }
  }
}
