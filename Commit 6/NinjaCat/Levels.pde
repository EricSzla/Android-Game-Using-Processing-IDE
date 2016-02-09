class Levels
{
  PImage img;
  PImage platform;
  float x, y;
  float x2;
  int i = 0;
  int theta;
  int radius;
  float centerx, centery;
  float circlex, circley;

  Levels(PImage image, PImage plat)
  {
    this.img = image;
    this.platform = plat;
    this.x = width/2;
    this.y = height;
    this.i = 0;
    this.centerx = width - width/15;
    this.centery = height - height/10;
    this.theta = 0;
    this.radius = width/10;

    cat.enemiesLeft = 10;
    cat.timeleft = 600;  // FOR DEBUGGING, TO BE CHANGED!
  }

  void drawlevel()
  {
    fill(0);
    image(img, width/2, height/2); // Background
    image(platform, x + x2, y);    // Platforms
    image(platform, (x * 3.5) + x2, y);
    text((int)cat.timeleft, width/2, height/2);

    // Red circle (controll) to shoot
    circlex = cos(theta) * radius;
    circley = sin(theta) * radius;
    fill(255, 0, 0, 50);
    ellipse(centerx, centery, radius, radius);
    theta++;

    // Controlls for going left, right and to jump right
    pushMatrix();
    fill(255, 0, 0, 50);
    triangle(0+width/20, height-height/8,0+width/8, height-height/5,0+width/8, height-height/15);
    triangle(0+width/5, height-height/5,0+width/3.70, height-height/8,0+width/5, height-height/15);
    triangle(width * 0.87890625,height * 0.6945 ,width * 0.9375, height * 0.7638, width * 0.97, height * 0.60);
    triangle(0+width/20,height * 0.60,0+width/15,height * 0.7638,width/8,height * 0.6945);
    popMatrix();
    
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
    
    if (frameCount % rate == 0)
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