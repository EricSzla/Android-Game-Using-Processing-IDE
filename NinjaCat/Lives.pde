class Lives extends BaseClass implements PowerUp
{
  /* TO DO */
  // Make live touch the player ! 
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
    if (mousePressed)
    {
      if (mouseX > cat.pos.x && !((mouseX > width- width/10 && mouseX < width) && (mouseY > height-height/10 && mouseY < height && livesLeft !=0)))
      {
        livesx = livesx - (cat.speed);
      }
    }

    llx = livesx;
    lly = livesy;
  }

  void lostLife()
  {
  }
}