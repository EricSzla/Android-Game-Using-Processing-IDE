class Board
{ 
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
    pushMatrix();
    fill(255);
    tint(255, 126);
    ellipse(x, y, radius, radius);
    popMatrix();
  }
  
  
}