class Enemy extends BaseClass
{
  /* TO DO */
  // Change enemy image
  // Regulate the fire rate
  // Either give super powers e.g. fly or regulate jump
  // Block going outside the screen
  // Make it die ! 


  int i;
  Enemy()
  {
    super(width, height - (height/3), height - (height/3));
    this.i = 0;
  }


  void render()
  {
    pushMatrix();
    // Draw Enemy
    if (cat.livesLeft != 0)
    {
      image(catWalk[i], pos.x, pos.y);
    }
    popMatrix();
  }

  void update()
  {
    // If statement to check if enemy has to jump
    if (level1.x*2 +level1.x2 <= pos.x && level1.x*2.5 + level1.x2 >= pos.x && pos.y == (height - (height/3)))
    {
      // If it is change goup to true
      goup = true;
    } 

    // Code for jumping up, if goup is equal to true then dicrement the enemy's pos.y 
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

    if (cat.pos.x >= pos.x - width/3)
    {
      pos.x = pos.x + (speed/2);
      // variable 'i' is used to draw appropriate image in render() method
      if (i < 3)
      {
        i++;
      } else
      {
        i = 0;
      }
    } else if (cat.pos.x < pos.x - width/3)
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

    // If statement for shooting
    // If user is in range, new Fire object is made and added to
    // the objectsArray
    
    if (cat.pos.x > pos.x - width/3 && cat.livesLeft != 0)
    {
      Fire fire = new Fire("left");
      fire.pos.x = pos.x;
      fire.pos.y = pos.y;
      fire.pos.x = fire.pos.x + speed;
      objectsArray.add(fire);
    }
  } // end of update()
} // End of class