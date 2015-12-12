abstract class BaseClass
{
  float x;
  float y;
  float y2;
  float speed = height/20;
  PVector pos;
  PVector right;
  PImage[] walk = new PImage[3];;


  BaseClass()
  {
    this(width/2- width/5, height - (height/3), height - (height/3) );
  }

  BaseClass(float x, float y, float y2)
  {
    this.x = x;
    this.y = y;
    this.y2 = y2;

    /*this.walk = new PImage[3];
    this.walk[0] = loadImage("Cat/walk/2.png"); 
    this.walk[1] = loadImage("Cat/walk/3.png"); 
    this.walk[2] = loadImage("Cat/walk/4.png");*/

   

    pos = new PVector(x, y);
    right = new PVector(x, y);
  }

  abstract void render();
  abstract void update();
}