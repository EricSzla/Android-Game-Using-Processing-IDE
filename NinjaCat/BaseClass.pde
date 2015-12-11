abstract class BaseClass
{
  float x;
  float y;
  float y2;
  float speed = height/20;
  PVector pos;
  PVector right;


  BaseClass()
  {
    this(width/2- width/5, height - (height/3), height - (height/3) );
  }
  
  BaseClass(float x, float y, float y2)
  {
    this.x = x;
    this.y = y;
    this.y2 = y2;
    pos = new PVector(x,y);
    right = new PVector(x,y);
    
  }

  abstract void render();
  abstract void update();

}