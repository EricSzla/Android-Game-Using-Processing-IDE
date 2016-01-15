class Fire extends BaseClass
{
  int counter;
  int i;
  String direction;

  Fire(String direction)
  {
    speed = height/10;
    this.counter = 0;
    this.i = 0;
    this.direction = direction;
  }

  void render()
  {
    // Draw the fire
    pushMatrix();
<<<<<<< HEAD
    if (direction == "right")
    {
      image(catFire[i], pos.x, pos.y);
    } else if (direction == "left")
    {
      image(enemyFire[i], pos.x, pos.y);
    }
=======
    image(catFire[i], pos.x, pos.y);
>>>>>>> ee16b5e3dfda99ef33a750dfacb76a37c713b5f3
    popMatrix();
  }

  void update()
  {
    // Increment the fires X position and increment variable 'i' which will
    // change the image in render() method
    if (i < catFire.length-1)
    {
      if (direction == "right")
      {
        pos.x = pos.x + speed/2;
        if (pos.x >= enemy.pos.x && enemy.pos.x >= cat.pos.x)    // Removes the fire if hits the enemy
        {
<<<<<<< HEAD
          drawLive = ! drawLive;  // Draw live after enemy dies
          lx = enemy.pos.x;
          ly = enemy.pos.y;

          enemy.livesLeft --;
          enemy.lostLive();
          cat.enemiesKilled ++;
          if (cat.enemiesLeft > 0)
          {
            cat.enemiesLeft--;
          } else if (cat.enemiesLeft == 0)
          {
            cat.win = true;
          }
=======
          enemy.livesLeft --;
          enemy.lostLive();
          cat.enemiesKilled ++;
>>>>>>> ee16b5e3dfda99ef33a750dfacb76a37c713b5f3
          lostLive();
        }
      } else if (direction == "left")
      {
        pos.x = pos.x - speed/2;
        if (pos.x <= cat.pos.x)      // Removes the fire if hits the cat
        {
          cat.livesLeft --;
          cat.respawn = true;
          lostLive();
        }
      }
      i++;
    } else  if (i == catFire.length-1)
    {
      // Removes the fire
      lostLive();
    }
  } // end of update()

  void lostLive()
  {
    objectsArray.remove(this);
  }
}