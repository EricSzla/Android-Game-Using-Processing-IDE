class Cat extends BaseClass
{
  PImage img;

  Cat(float x, float y)
  {
    super(x, y);
    this.img = loadImage("Cat/cat_walk.gif");
    this.img.resize(width/5, height/3);
  }

  void render()
  {
    image(img, x, y);
  }

  void update()
  {
    x = x + height/20;
  }
}