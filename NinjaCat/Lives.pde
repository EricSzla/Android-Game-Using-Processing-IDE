class Lives extends BaseClass implements PowerUp
{
<<<<<<< HEAD
  /* TO DO */
  // Make live touch the player ! 

  float lx;
  float ly;

  Lives(float x, float y)
  {
    this.lx = x;
    this.ly = y;
=======
  Lives()
  {
>>>>>>> ee16b5e3dfda99ef33a750dfacb76a37c713b5f3
  }

  void applyTo(Cat cat)
  {
    cat.livesLeft ++;
  }

  void render()
  {
    pushMatrix();
<<<<<<< HEAD
    image(lives, lx, ly);
=======
    /* TO DO */
    // Declare PImage lives in main sketch (NinjaCat) instead of loading in Cat class
    // Draw lives
    //image(lives,RANDOM,RANDOM( in range to jump ) );
>>>>>>> ee16b5e3dfda99ef33a750dfacb76a37c713b5f3
    popMatrix();
  }

  void update()
  {
<<<<<<< HEAD
=======
    // image(lives,x,y) when enemy dies
>>>>>>> ee16b5e3dfda99ef33a750dfacb76a37c713b5f3
  }

  void lostLive()
  {
  }
}