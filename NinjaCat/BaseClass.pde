abstract class BaseClass
{
  float x;
  float y;
  float y2;
  float speed = height/20;
  PVector pos;
  PVector right;
  PImage[] walk = new PImage[3];
  int livesLeft;
  boolean godown;
  Boolean goup;

  BaseClass()
  {
    this(width/2- width/5, height - (height/3), height - (height/3) );
  }

  BaseClass(float x, float y, float y2)
  {
    this.x = x;
    this.y = y;
    this.y2 = y2;
    this.livesLeft = 3;
    this.godown = false;
    this.goup = false;
    this.speed = height/50;
    
    pos = new PVector(x, y);
    right = new PVector(x, y);
  }

  abstract void render();
  abstract void update();
}