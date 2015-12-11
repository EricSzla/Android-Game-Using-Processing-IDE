import processing.opengl.*;

BaseClass cat;
Levels level1;

Board bg;
Board bg1;

int levels = 1;

PImage[] img;
PImage ground;

void setup()
{
  size(displayWidth, displayHeight, JAVA2D,OPENGL);
  colorMode(RGB,255,255,255,100);
  orientation(LANDSCAPE);
  frameRate(30);
  smooth();
  
  img = new PImage[3];
  loadData();
  
  
}

void draw()
{
  if (levels == 1)
  {
    image(img[0],0,0);
    level1.drawlevel();
    image(ground,0,height);
  }
  bg.drawBg();
  bg1.drawBg();
  cat.render();
}


void mousePressed()
{
  cat.update();
}


void loadData()
{
  for (int i = 0; i < img.length; i++)
  {
    img[i] = loadImage((i+1) + ".jpg"); //"levels/" + 
    img[i].resize(width, height);
  }
  ground = loadImage("levels/ground.jpg");
  ground.resize(width,height/2);
  
  cat = new Cat(width/2, height - (height/5));
  level1 = new LevelOne(img[0], img[1], ground);

  bg = new Board(width/10, height - width/10, width/5);
  bg1 = new Board(width - width/10, height - width/10, width/5);
}