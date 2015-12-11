class LevelOne extends Levels
{
  LevelOne(PImage image, PImage obstacle, PImage plat)
  {
    super(image, obstacle, plat);
  }

  void drawlevel()
  {
    image(platform,0,height);
  }
  
  void updatelevel()
  {
  }
  
}