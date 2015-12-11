class Board
{
  //PImage img;
  // or movie ? 
  float x, y;
  float radius;


  Board(float x1, float y1, float r)
  {
    //img = loadImage("");
    this.x = x1;
    this.y = y1;
    this.radius = r;
  }

  void drawBg()
  {
    //background(255); // (img)
    fill(255);
    tint(255, 127);
    ellipse(x, y, radius, radius);
  }
  
  
}