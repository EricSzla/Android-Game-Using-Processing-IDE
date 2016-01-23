class Coin extends BaseClass implements PowerUp
{
  int i;

  Coin()
  {
    this.i = 0;
  }


  void applyTo(Cat cat)
  {
    //cat.score++;
  }
  void render()
  {
    pushMatrix();
    image(coins[i], displayWidth/2, displayHeight/2);
    popMatrix();
  }
  void update()
  {
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