class Cat extends BaseClass
{
  PImage img;

  Cat(float x, float y)
  {
    super(x, y);
    this.img = loadImage("Cat/cat_walk.gif");
    this.img.resize(width/5, height/5);
  }

  void render()
  {
    image(img, x, y);
  }

  void update()
  {
    y = y - height/20;
  }
}