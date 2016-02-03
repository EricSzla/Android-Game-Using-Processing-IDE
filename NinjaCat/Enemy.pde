class Enemy extends BaseClass
{
  int i;
  boolean jump;

  Enemy()
  {
    super(width, height - (height/5), height - (height/5));
    this.i = 0;
    this.jump = true;
    this.livesLeft = 5;
  }

  void render()
  {
    pushMatrix();
    // Draw Enemy
    if (cat.livesLeft != 0 && !cat.win)
    {
      if (pos.x < -width/2 || respawn)
      {
        pos.x = width;
        respawn = !respawn;
      }

      image(enemyWalk[i], pos.x, pos.y);
    }
    popMatrix();
  }

  void update()
  {
    // If statement to check if enemy has to jump
    if (level1.x*2 +level1.x2 <= pos.x && level1.x*2.5 + level1.x2 >= pos.x && pos.y == (height - (height/5)))
    {
      // If it is change goup to true
      goup = true;
    } 

    // Code for jumping up, if goup is equal to true then dicrement the enemy's pos.y 
    if (goup == true)
    {
      pos.y = pos.y - speed;
      // If reaches height-(height/3) then change the goup to false
      if (pos.y <= height - (height/3))
      {
        goup = !goup;
      }
    } else if (goup == false) 
    {
      // Start falling back down to the platform 
      if (pos.y < height - (height/5))
      {
        pos.y = pos.y + speed;
      }
    }
    // Keep moving left by dicrementing pos.x
    pos.x = pos.x - speed;
    if (i > 0)
    {
      i--;
    } else
    {
      i = 2;
    }

    // If statement for shooting
    // If user is in range, new Fire object is made and added to
    // the objectsArray

    if (cat.pos.x < pos.x)
    {

      if (cat.pos.x > pos.x - width/3 && cat.livesLeft != 0)
      {
        if (enemyCanShoot)
        {
          Fire fire = new Fire("left");
          fire.pos.x = pos.x;
          fire.pos.y = pos.y;
          fire.pos.x = fire.pos.x + speed;
          objectsArray.add(fire);
          enemyCanShoot = false;
        }
      }
    }
  } // end of update()

  void lostLife()
  {
    respawn = !respawn;
  }
} // End of class