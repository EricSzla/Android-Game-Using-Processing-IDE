class LevelOne extends Levels
{
  float timeleft;

  LevelOne(PImage image, PImage obstacle, PImage plat)
  {
    super(image, obstacle, plat);
    cat.enemiesLeft = 3;
    this.timeleft = 10;
  }

  void drawlevel()
  {
    // This method draws the platform

    image(img, width/2, height/2);
    image(platform, x + x2, y);
    image(platform, (x * 3.5) + x2, y);
    text((int)timeleft, width/2, height/2);
  }

  void updatelevel()
  {
    if (x* 3.5 + x2 <= width-width/2)
    {
      x2 = 0;
    }

    if (frameCount == 2)
    {
      timeleft--;
    }

    if (timeleft <= 0)
    {
      cat.livesLeft = 0;
      fill(255);
      text("TIME IS UP !" , width/2, height/2-height/20);
    }
  }
}