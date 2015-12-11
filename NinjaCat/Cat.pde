class Cat extends BaseClass
{
  PImage img;

  Cat(float x, float y)
  {
    super(x, y);
    this.img = loadImage("Cat/cat_walk.gif");
    this.img.resize(width/10, height/10);
  }

  void render()
  {
    image(img, x, y);
    y+= 10;
  }

  void update()
  {
    y = y - height/20;
  }
}