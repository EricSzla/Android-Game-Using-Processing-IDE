class Levels
{
  PImage img;
  PImage platform;
  float x, y;
  float x2;
  int i = 0;

  Levels(PImage image, PImage plat)
  {
    this.img = image;
    this.platform = plat;
    this.x = width/2;
    this.y = height;
    this.i = 0;

    cat.enemiesLeft = 10;
    cat.timeleft = 60;
  }

  void drawlevel()
  {
    fill(0);
    image(img, width/2, height/2); // Background
    image(platform, x + x2, y);    // Platforms
    image(platform, (x * 3.5) + x2, y);
    text((int)cat.timeleft, width/2, height/2);

    // rectange in right hand corner for shooting
    rect(width- width/10, height - height/10, width/10, width/10);

    // Display enemies killed
    text("Enemies killed: " + cat.enemiesKilled, width - width/8, height/25);

    // Draw lives
    imageMode(CORNER);
    for (int i = 0; i < cat.livesLeft; i++)
    {
      image(lives, displayWidth/15 * i+1, displayHeight/25);
    }

    // Draw coins

    image(coins[i], 0, displayHeight /9);
    text("x " + cat.score, displayWidth/12, displayHeight/5.5);
    
    imageMode(CENTER);
  }

  void updatelevel()
  {
    if (x* 3.5 + x2 <= width-width/2)
    {
      x2 = 0;
    }

    if (frameCount == 2)
    {
      cat.timeleft--;
    }

    if (cat.time)
    {
      cat.timeleft = 30;
      cat.time = false;
    }

    if (cat.timeleft <= 0 && cat.time == false)
    {
      cat.livesLeft = 0;
    }

    if (i >= 5)
    {
      i = 0;
    } else 
    {
      i++;
    }
  }
}