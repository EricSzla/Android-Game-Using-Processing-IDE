abstract class BaseClass
{
  float x;
  float y;

  BaseClass(float x, float y)
  {
    this.x = x;
    this.y = y;
  }

  abstract void render();

  abstract void update();
}