class Lives extends BaseClass implements PowerUp
{
  /* TO DO */
  // Make live touch the player ! 

  float lx;
  float ly;

  Lives(float x, float y)
  {
    this.lx = x;
    this.ly = y;
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