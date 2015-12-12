class Cat extends BaseClass
{
  Boolean goup;
  PImage cat;
  PImage lives;
  int livesLeft;
  int ammoLeft;

  Cat(float x, float y, float y2)
  {
    super(x, y, y2);

    this.cat = loadImage("Cat/cat_walk.gif");
    this.cat.resize(width/5, height/3);
    this.lives = loadImage("Cat/lives.png");
    this.lives.resize(width/15, height/15);
    this.livesLeft = 3;
    this.ammoLeft = 3;

    this.goup = false;
  }

  void render()
  {
    fill(0);
    rect(width- width/10, height - height/10, width/10, width/10);

    pushMatrix();
    // Draw Cat
    image(cat, pos.x, pos.y);

    // Draw lives
    imageMode(CORNER);
    for (int i = 0; i < livesLeft; i++)
    {
      image(lives, width/15 * i+1, height/25);
    }

    popMatrix();
    imageMode(CENTER);
  }

  void update()
  {
    if (goup == true)
    {
      pos.y = pos.y - speed;
      if (pos.y <= height - (height/2))
      {
        goup = !goup;
      }
    } else if (goup == false)
    {
      if (pos.y < height - (height/3))
      {
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
        if (pos.y == height - (height/3) && goup == false)
        {
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