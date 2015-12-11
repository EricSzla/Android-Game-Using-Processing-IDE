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
    if (mousePressed)
    {
      if (mouseX > cat.x)
      {
        cat.x = cat.x + height/20;
      } else if (mouseX < cat.x)
      {
        cat.x = cat.x - height/20;
      }
    }
    
    image(img, x, y);
  }

  void update()
  {
  }
  void shoot()
  {
  }
} // end class