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

    /*this.walk[1] = loadImage("2.png"); 
     this.walk[2] = loadImage("3.png"); 
     this.walk[3] = loadImage("4.png");*/

    /*for (int i=0; i <= img.length; i++)
     {
     
     println("Cat/walk/" + (i+1) + ".png");
     this.walk[i] = loadImage("Cat/walk/" + (i+1) + ".png"); 
     //this.walk[i].resize(width/5, height/3);
     
     }*/

    pos = new PVector(x, y);
    right = new PVector(x, y);
  }

  abstract void render();
  abstract void update();
}