class Cat extends BaseClass
{
  PImage img;
  Boolean goup;

  Cat(float x, float y, float y2)
  {
    super(x, y, y2);
    this.img = loadImage("Cat/cat_walk.gif");
    this.img.resize(width/5, height/3);
    this.goup = false;
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
    if (goup == true)
    {
      pos.y = pos.y - speed;
      println("I should be up !");
      if (pos.y <= height - (height/2))
      {
        println("Changing to false!");
        goup = !goup;
      }
    } else if (goup == false)
    {
      if (pos.y < height - (height/3))
      {
        println("going down brruuummm");
        pos.y = pos.y + speed;
      }
    }


    if (mousePressed)
    {
      if (mouseX > pos.x)
      {
        pos.x = pos.x + speed/2;
        level1.x2 = level1.x2 - speed*2;
      } else if (mouseX < pos.x)
      {

        pos.x = pos.x - speed;
      }
      
      if (mouseY < height - (height/3))
      {
        println("im in");
        if (pos.y == height - (height/3) && goup == false)
        {
          println("going up");
          goup = !goup;
        }
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