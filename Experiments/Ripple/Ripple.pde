float r=0,r2=0;
float c=0,c2=0;
void setup()
{
size(600,600);
background(255);
}
void draw()
{
  noStroke();
  frameRate(70);
  
    fill(c);
    ellipse(width/2,height/2,r+10,r+10);
    fill(255);
    ellipse(width/2,height/2,r,r);
    c=c+1;
    r=r+1;
    //while(r>50)
    //{
      if(r>50)
      {fill(c2);
      ellipse(width/2,height/2,r2+10,r2+10);
      fill(255);
      ellipse(width/2,height/2,r2,r2);
      c2=c2+0.7;
      r2=r2+1;
    }
}
