class Fire extends BaseClass
{
  int counter;
  int i;
  String direction;

  Fire(String direction)
  {
    this.speed = height/10;
    this.counter = 0;
    this.i = 0;
    this.direction = direction;
  }

  void render()
  {
    // Draw the fire
    pushMatrix();
    if (direction == "right")
    {
      image(catFire[i], pos.x, pos.y);
    } else if (direction == "left")
    {
      image(enemyFire[i], pos.x, pos.y);
    }
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

          drawCoin = true;  // Draw the coin after enemy dies
          lx = enemy.pos.x;
          ly = enemy.pos.y;
          Coin coin = new Coin((lx * 1.5), ly);
          objectsArray.add(coin);

          if (cat.livesLeft < 3)
          {
            drawLive = true;  // Draw live after enemy dies
            Lives life = new Lives(lx, ly);
            objectsArray.add(life);
          }



          enemy.livesLeft --;
          enemy.lostLife();
          cat.enemiesKilled ++;
          if (cat.enemiesLeft > 0)
          {
            cat.enemiesLeft--;
          } else if (cat.enemiesLeft == 0)
          {
            cat.win = true;
          }
          canShoot = true;
          lostLife();
        }
      } else if (direction == "left")
      {
        pos.x = pos.x - speed/2;
        if (pos.x <= cat.pos.x)      // Removes the fire if hits the cat
        {
          soundPlay(lostLiveMusic, 0);
          vibration.vibrate(200);
          cat.livesLeft --;
          cat.respawn = true;
          enemyCanShoot = true;
          lostLife();
          
        }
      }
      i++;
    } else  if (i == catFire.length-1)
    {
      canShoot = true;
      enemyCanShoot = true;
      // Removes the fire
      lostLife();
    }
  } // end of update()

  void lostLife()
  {
    objectsArray.remove(this);
  }
}