abstract class Levels
{
  PImage img;
  PImage obstacle;
  PImage platform;
  float x, y;
  float x2;

  Levels(PImage image, PImage obst, PImage plat)
  {
    this.img = image;
    this.obstacle = obst;
    this.platform = plat;
    this.x = width/2;
    this.y = height;
    
  }

  abstract void drawlevel();
  abstract void updatelevel();
}