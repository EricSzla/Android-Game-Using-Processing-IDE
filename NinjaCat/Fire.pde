class Fire extends BaseClass
{
  int counter;
  int i;

  Fire()
  {
    speed = height/10;
    this.counter = 0;
    this.i = 0;
  }

  void render()
  {
    pushMatrix();
    image(catFire[i], pos.x, pos.y);
    popMatrix();
  }

  void update()
  {
    if (i < catFire.length-1)
    {
      pos.x = pos.x + speed/2;
      i++;
    } else  if (i == catFire.length-1)
    {
      objectsArray.remove(this);
    
    } 
  }
}