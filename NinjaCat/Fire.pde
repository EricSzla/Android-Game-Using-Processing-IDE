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
    image(catFire[i], pos.x, pos.y);
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
          enemy.livesLeft --;
          enemy.lostLive();
          cat.enemiesKilled ++;
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