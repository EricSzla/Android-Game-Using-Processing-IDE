BaseClass cat;
BaseClass tower;
Board bg;
Board bg1;

void setup()
{
  size(displayWidth, displayHeight);
  
  cat = new Cat(width/2, height/2);
  tower = new Tower(width, height);
  bg = new Board(width/10,height - width/10, width/5);
  bg1 = new Board(width - width/10, height - width/10, width/5);

  frameRate(30);
}

void draw()
{
  background(255);
  bg.drawBg();
  bg1.drawBg();
  cat.render();
}


void mousePressed()
{
  cat.update();
}