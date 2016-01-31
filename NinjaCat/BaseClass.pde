abstract class BaseClass
{
  float x, y;
  float livesx, livesy;

  float y2;
  float speed;
  PVector pos;
  PVector right;
  PImage[] walk = new PImage[3];
  int livesLeft;

  boolean godown;
  Boolean goup;
  boolean respawn;
  boolean time;
  boolean reset;
  boolean win = false;

  int enemiesKilled;
  int enemiesLeft;
  int score;
  int timeleft;


  BaseClass()
  {
    this(width/2- width/5, height - (height/3), height - (height/3) );
  }

  BaseClass(float x, float y, float y2)
  {
    this.x = x;
    this.y = y;
    this.y2 = y2;
    this.speed = height/50;
    
    this.livesLeft = 3;
    this.enemiesLeft = 5;
    this.enemiesKilled = 0;
    this.score = 0;
    this.timeleft = 0;

    this.respawn = false;
    this.win = false;
    this.reset = false;
    this.godown = false;
    this.goup = false;
    this.time = false;

    pos = new PVector(x, y);
    right = new PVector(x, y);
  }

  abstract void render();
  abstract void update();
  abstract void lostLife();
}