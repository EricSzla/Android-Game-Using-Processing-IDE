class Lives extends BaseClass implements PowerUp
{
  Lives()
  {
  }

  void applyTo(Cat cat)
  {
    cat.livesLeft ++;
  }

  void render()
  {
    pushMatrix();
    /* TO DO */
    // Declare PImage lives in main sketch (NinjaCat) instead of loading in Cat class
    // Draw lives
    //image(lives,RANDOM,RANDOM( in range to jump ) );
    popMatrix();
  }

  void update()
  {
    // image(lives,x,y) when enemy dies
  }

  void lostLive()
  {
  }
}