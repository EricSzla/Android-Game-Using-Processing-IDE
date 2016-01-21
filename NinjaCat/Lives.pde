class Lives extends BaseClass implements PowerUp
{
  /* TO DO */
  // Make live touch the player ! 
  float lx,ly;
  
  Lives(float x, float y)
  {
    this.lx = x;
    this.ly = y;
    livesx = lx;
    livesy = ly;
  }

  void applyTo(Cat cat)
  {
    cat.livesLeft ++;
  }

  void render()
  {
    pushMatrix();
    image(lives, lx, ly);
    popMatrix();
  }

  void update()
  {
  }

  void lostLive()
  {
  }
}