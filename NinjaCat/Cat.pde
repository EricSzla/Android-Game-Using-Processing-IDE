class Cat extends BaseClass
{
  Cat(float x, float y, float y2)
  {
    super(x, y, y2);
    this.time = false;
  }

  Cat()
  {
    this(width/2-width/5, height - (height/5), height - (height/5));
  }

  void render()
  {
    fill(0);
    pushMatrix();

    // Checking if cat lost life and needs to respawn, can only respawn if there are lives left
    if (respawn == true && livesLeft > 0)
    {
      lostLife();
      respawn = !respawn;
    } else if (livesLeft == 0)
    {
      gameOverfx();
    }

    if (time)
    {
      time = false;
    }
    // Draw Cat
    if (livesLeft != 0 && !win)
    {
      image(catWalk[i], pos.x, pos.y);
    }
    popMatrix();
  }

  void update()
  {
    // If statement to check if cat is in the hole
    if (level1.x*2 +level1.x2 <= pos.x && level1.x*2.5 + level1.x2 >= pos.x && pos.y == (height - (height/5)))
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

    if (mousePressed)
    {
      // If statement for shooting
      // If user clicks in right bottom corner, new Fire object is made and added to
      // the objectsArray
      //if (mouseX > width- width/10 && mouseX < width)
      //  - level1.radius
      /*if (mouseX > level1.circlex && mouseX < level1.circlex + level1.radius && livesLeft >= 1 && !win)
      {
        //if (mouseY > height-height/10 && mouseY < height && livesLeft !=0)
        if (mouseY > level1.circley && mouseY < level1.circley + level1.radius)
        {
          if (frameCount >= 7)
          {
            soundPlay(shootMusic);
            Fire fire = new Fire("right");
            fire.pos.x = pos.x;
            fire.pos.y = pos.y;
            fire.pos.x = fire.pos.x + speed;
            objectsArray.add(fire);
            frameCount = 0;
          }
        }
      }*/
    } // end of if mouse pressed
  } // end of update

  void lostLife()
  {
    // Reset cat position, enemy position and the platform position
    pos.x = width/2-width/5;
    pos.y = height - (height/5);
    level1.x = width/2;
    level1.x2 = 0;
    enemy.pos.x = width + width/2;
  }

  void gameOverfx()
  {
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    text("GAME OVER", width/2, height/2);
    text("Enemies killed: " + enemiesKilled, width/2, height/2+height/20);
    text("Enemies left  : " + enemiesLeft, width/2, height/2+height/10);
    text("Score         : " + score, width/2, height/2 + height/7);
  }
} // end class