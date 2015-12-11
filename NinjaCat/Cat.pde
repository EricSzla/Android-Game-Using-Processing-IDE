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

  void update(String direction)
  {
    println(direction);
    if (direction == "up")
    {
      if (y > height/2 - height/3 && !isup)
      {
        y = y - height/30;
        if (y <= height/2 - height/3 && isup == false)
        {
          isup = true;
          println(isup);
        }
      } else if (isup == true)
      {
        y = y + height/30;
        if (y >= height - height/3)
        {
          isup = false;
          direction = "";
        }
      }
    } else if (direction == "right" && x < width - (width/5))
    {
      x = x + height/20;
    } else if (direction == "left" && x > width/10)
    {
      x = x - (height/20);
      direction = "";
    } else
    {
    }
  }
}