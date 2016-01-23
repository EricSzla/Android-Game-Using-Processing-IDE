class Coin extends BaseClass implements PowerUp
{
  int i;
  float cx, cy;

  Coin(float x, float y)
  {
    this.i = 0;
    this.cx = x;
    this.cy = y;
    this.livesx = x;
    this.livesy = y;
  }


  void applyTo(Cat cat)
  {
    cat.score+= 100;
  }
  
  void render()
  {
    pushMatrix();
    image(coins[i], cx, cy);
    popMatrix();
  }
  
  void update()
  {
    if (mousePressed)
    {
      if (mouseX > cat.pos.x)
      {
        livesx = livesx - (cat.speed);
      }
    }

    this.cx = livesx;
    this.cy = livesy;
    
    if (i >= 5)
    {
      i = 0;
    } else 
    {
      i++;
    }
  }
  
  void lostLife()
  {
  }
}