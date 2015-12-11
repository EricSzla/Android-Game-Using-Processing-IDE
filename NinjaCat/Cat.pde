class Cat extends BaseClass
{
  PImage img;
  boolean isup;

  Cat(float x, float y, float y2)
  {
    super(x, y, y2);
    this.img = loadImage("Cat/cat_walk.gif");
    this.img.resize(width/5, height/3);
    this.isup = false;
  }

  void render()
  {
    image(img, x, y);
  }

  void shoot()
  {
    
  }
} // end class