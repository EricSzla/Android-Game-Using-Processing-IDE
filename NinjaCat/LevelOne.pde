class LevelOne extends Levels
{
  LevelOne(PImage image, PImage obstacle, PImage plat)
  {
    super(image, obstacle, plat);
  }

  void drawlevel()
  {
    image(img, width/2, height/2);
    image(platform, x + x2, y);
    image(platform, (x * 3.5) + x2, y);
  }

  void updatelevel()
  {
  }
}