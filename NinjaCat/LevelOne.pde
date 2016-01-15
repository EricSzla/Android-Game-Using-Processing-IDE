class LevelOne extends Levels
{
  LevelOne(PImage image, PImage obstacle, PImage plat)
  {
    super(image, obstacle, plat);
<<<<<<< HEAD
    cat.enemiesLeft = 3;
=======
>>>>>>> ee16b5e3dfda99ef33a750dfacb76a37c713b5f3
  }

  void drawlevel()
  {
    // This method draws the platform
    if (x* 3.5 + x2 <= width-width/2)
    {
      x2 = 0;
    }
    image(img, width/2, height/2);
    image(platform, x + x2, y);
    image(platform, (x * 3.5) + x2, y);
  }

  void updatelevel()
  {
  }
}