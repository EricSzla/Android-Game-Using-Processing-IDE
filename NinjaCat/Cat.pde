class Cat extends BaseClass
{
  int i;


  Cat(float x, float y, float y2)
  {
    super(x, y, y2);
    this.i = 0;
  }

  Cat()
  {
    this(width/2-width/5, height - (height/3), height - (height/3));
  }

  void render()
  {
    fill(0);
    // rectange in right hand corner for shooting
    rect(width- width/10, height - height/10, width/10, width/10);

    // Display enemies killed
    text("Enemies killed: " + enemiesKilled, width - width/10, height/25);

    pushMatrix();

    // Checking if cat lost life and needs to respawn, can only respawn if there are lives left
    if (respawn == true && livesLeft > 0)
    {
      lostLive();
      respawn = !respawn;
    } else if (livesLeft == 0)
    {
      fill(0);
      rect(0, 0, width, height);
      fill(255);
      text("GAME OVER", width/2, height/2);
      text("Enemies killed: " + enemiesKilled, width/2, height/2+height/20);
      text("Enemies left  : " + enemiesLeft, width/2, height/2+height/10);
    }

    // Draw Cat
    if (livesLeft != 0 && !win)
    {
      image(catWalk[i], pos.x, pos.y);
    }

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
    // If statement to check if cat is in the hole
    if (level1.x*2 +level1.x2 <= pos.x && level1.x*2.5 + level1.x2 >= pos.x && pos.y == (height - (height/3)))
    {
      // If it is change godown to true
      godown = true;
      goup = false;
    } 

    // If godown is true then make the falling down into hole animation
    if (godown)
    {
      pos.y = pos.y + height/20;
      if (pos.y >= height)
      {
        godown = false;
        livesLeft = livesLeft - 1;
        respawn = true;
      }
    }

    // Code for jumping up, if goup is equal to true then dicrement the cat's pos.y 
    if (goup == true)
    {
      pos.y = pos.y - speed;
      // If reaches height-(height/2) then change the goup to false
      if (pos.y <= height - (height/2))
      {
        goup = !goup;
      }
    } else if (goup == false) 
    {
      // Start falling back down to the platform 
      if (pos.y < height - (height/3))
      {
        pos.y = pos.y + speed;
      }
    }


    if (mousePressed)
    {
      // If statement to check if user clicked on the right hand side of the cat
      // If so then inrement cat's position x
      // And decrement the platform x position
      if (mouseX > pos.x)
      {
        pos.x = pos.x + (speed/2);
        level1.x2 = level1.x2 - (speed*2);
        livesx = livesx - (speed*2);
        // variable 'i' is used to draw appropriate image in render() method
        if (i < 3)
        {
          i++;
        } else
        {
          i = 0;
        }
      } else if (mouseX < pos.x)
      {

        pos.x = pos.x - speed;
        if (i > 0)
        {
          i--;
        } else
        {
          i = 2;
        }
      }

      // If statement to check if user clicked 'above' the cat if so boolean goup is changed
      // which will lead to cat jumping
      if (mouseY < height - (height/3))
      {
        if (pos.y == height - (height/3) && goup == false)
        {
          goup = !goup;
        }
      }

      // If statement for shooting
      // If user clicks in right bottom corner, new Fire object is made and added to
      // the objectsArray
      if (mouseX > width- width/10 && mouseX < width)
      {
        if (mouseY > height-height/10 && mouseY < height && livesLeft !=0)
        {
          if (frameCount >= 7)
          {
            Fire fire = new Fire("right");
            fire.pos.x = pos.x;
            fire.pos.y = pos.y;
            fire.pos.x = fire.pos.x + speed;
            objectsArray.add(fire);
            frameCount = 0;
          }
        }
      }
    } // end of if mouse pressed
  } // end of update

  void lostLive()
  {
    // Reset cat position, enemy position and the platform position
    pos.x = width/2-width/5;
    pos.y = height - (height/3);
    level1.x = width/2;
    level1.x2 = 0;
    enemy.pos.x = width + width/2;
  }
} // end class