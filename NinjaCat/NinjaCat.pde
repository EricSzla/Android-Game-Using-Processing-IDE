BaseClass cat;
Levels level1;

Board bg;
Board bg1;

int levels = 1;

PImage[] img;
PImage ground;
PImage obst;

void setup()
{
  size(displayWidth, displayHeight, JAVA2D);
  colorMode(RGB, 255, 255, 255, 100);
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
    image(img[0], 0, 0);
    level1.drawlevel();
  }
  bg.drawBg();
  bg1.drawBg();
  cat.render();
}


void mousePressed()
{
  if (mouseX < width/5 && mouseY > height- width/5)
  {
    cat.update();
  } else if (mouseX > width - (width/10) && mouseY > height-width/5)
  {
    cat.update();
  }
}


void loadData()
{
  for (int i = 0; i < img.length; i++)
  {
    img[i] = loadImage((i+1) + ".jpg"); //"levels/" + 
    img[i].resize(width, height);
  }

  ground = loadImage("ground.jpg");
  ground.resize(width, height/5);
  obst = loadImage("tower.png");
  obst.resize(width/10,height/10);

  cat = new Cat(width/2-width/5, height - (height/3));
  level1 = new LevelOne(img[0], obst, ground);

  bg = new Board(width/10, height - width/10, width/5);
  bg1 = new Board(width - width/10, height - width/10, width/5);
}