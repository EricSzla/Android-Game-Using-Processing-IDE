class Board
{ 
  float x, y;
  float rad;
  PShape circle;
  PImage img;
  
  Board(float x1, float y1,float r)
  {
    this.x = x1;
    this.y = y1;
    this.rad = r;
    this.circle = createShape(ELLIPSE,0,0,rad,rad);
    this.img = loadImage("Cat/fire.gif");
    this.img.resize(width/5,height/5);
  }

  void drawBg()
  {
    pushMatrix();
 
    tint(255,126);
    image(img,x,y);

    popMatrix();
  }
}