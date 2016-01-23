class Lives extends BaseClass implements PowerUp
{
  /* TO DO */
  // Make live touch the player ! 
  float llx, lly;

  Lives(float x, float y)
  {
    this.llx = x;
    this.lly = y;
    livesx = llx;
    livesy = lly;
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
    if (mousePressed)
    {
      if (mouseX > cat.pos.x)
      {
        livesx = livesx - (cat.speed/2);
      }
    }

    llx = livesx;
    lly = livesy;
  }

  void lostLive()
  {
  }
}