class LevelOne extends Levels
{
  LevelOne(PImage image, PImage obstacle, PImage plat)
  {
    super(image, obstacle, plat);
  }

  void drawlevel()
  {
    image(img, width/2, height/2);
    image(platform, width/2, height);
  }

  void updatelevel()
  {
  }
}