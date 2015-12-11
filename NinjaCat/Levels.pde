abstract class Levels
{
  PImage img;
  PImage obstacle;
  PImage platform;

  Levels(PImage image, PImage obst, PImage plat)
  {
    this.img = image;
    this.obstacle = obst;
    this.platform = plat;
  }

  abstract void drawlevel();
  abstract void updatelevel();
}