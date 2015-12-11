abstract class BaseClass
{
  float x;
  float y;
  float y2;

  BaseClass(float x, float y, float y2)
  {
    this.x = x;
    this.y = y;
    this.y2 = y2;
  }

  abstract void render();
  abstract void update();
  abstract void shoot();
}