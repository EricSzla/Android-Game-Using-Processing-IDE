class Fire extends BaseClass
{
  int counter;

  Fire()
  {
    speed = height/10;
    this.counter = 0;
  }

  void render()
  {
    pushMatrix();
    println("Fire at: x: " + pos.x + " y: " + pos.y);
    image(fire, pos.x, pos.y);
    popMatrix();
  }

  void update()
  {
    if (counter < 5)
    {
      pos.x = pos.x + speed;
      counter++;
    } else if (counter == 5)
    {
      counter = 0;
      objectsArray.remove(this);
    }
  }
}