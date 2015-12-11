class Cat extends BaseClass
{
  PImage img;

  Cat(float x, float y, float y2)
  {
    super(x, y, y2);
    this.img = loadImage("Cat/cat_walk.gif");
    this.img.resize(width/5, height/3);
  }

  void render()
  {
    fill(0);
    rect(width- width/10, height - height/10, width/10, width/10);

    pushMatrix();
    image(img, pos.x, pos.y);
    popMatrix();
  }

  void update()
  {

    if (mousePressed)
    {
      if (mouseX > pos.x)
      {
        pos.x = pos.x + speed;
      } else if (mouseX < pos.x)
      {

        pos.x = pos.x - speed;
      }

      // Shoot

      if (mouseX > width- width/10 && mouseX < width)
      {
        if (mouseY > height-height/10 && mouseY < height)
        {
          println("Fire in the hole !");
          Fire fire = new Fire();
          fire.pos.x = pos.x;
          fire.pos.y = pos.y;
          fire.pos.x = fire.pos.x + speed;
          objectsArray.add(fire);
        }
      }
    }
  }
} // end class