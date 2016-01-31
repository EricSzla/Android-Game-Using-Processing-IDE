class Levels
{
  PImage img;
  PImage obstacle;
  PImage platform;
  float x, y;
  float x2;
  
  Levels(PImage image, PImage obstacle, PImage plat)
  {
    this.img = image;
    this.obstacle = obst;
    this.platform = plat;
    this.x = width/2;
    this.y = height;

    cat.enemiesLeft = 10;
    cat.timeleft = 60;
  }

  void drawlevel()
  {
    // This method draws the platform

    image(img, width/2, height/2);
    image(platform, x + x2, y);
    image(platform, (x * 3.5) + x2, y);
    text((int)cat.timeleft, width/2, height/2);
  }

  void updatelevel()
  {
    if (x* 3.5 + x2 <= width-width/2)
    {
      x2 = 0;
    }

    if (frameCount == 2)
    {
      cat.timeleft--;
    }

    if (cat.time)
    {
      cat.timeleft = 30;
      cat.time = false;
    }
    
    if (cat.timeleft <= 0 && cat.time == false)
    {
      cat.livesLeft = 0;
    }
  }
}