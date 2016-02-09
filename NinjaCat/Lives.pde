class Lives extends BaseClass implements PowerUp
{
  float llx, lly;

  Lives(float x, float y)
  {
    this.llx = x;
    this.lly = y;
    this.livesx = llx;
    this.livesy = lly;
  }

  void applyTo(Cat cat)
  {
    cat.livesLeft ++;
  }

  void render()
  {
    pushMatrix();
    image(lives, llx, lly);
    popMatrix();
  }

  void update()
  {
    llx = livesx;
    lly = livesy;
  }

  void lostLife()
  {
  }
}