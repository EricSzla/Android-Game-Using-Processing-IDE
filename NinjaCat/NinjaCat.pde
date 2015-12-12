/* Program developed by Eryk Szlachetka
 * Student number: C14386641
 */

/* Ketai Library is an android library
 * for working with sensors, cameras
 * multi-touch, networking, Bluetooth, 
 * WiFi Direct, Near Field Communication etc.
 */

import ketai.sensors.*;
import ketai.ui.*;

KetaiList menuList;

BaseClass cat;
Levels level1;

int levels = 0;
int x, y = 0;
int frames = 4;
int thisFrame = 0;
PImage[] catWalk;
PImage[] catFire;

PImage[] img;

PImage ground;
PImage obst;
PImage fire;
PImage fire2;

ArrayList<BaseClass> objectsArray = new ArrayList<BaseClass>();
ArrayList<String> menuChoice = new ArrayList<String>();


void setup()
{
  // Full screen size
  size(displayWidth, displayHeight);
  colorMode(RGB, 255, 255, 255, 100);
  textSize(height/20);
  textAlign(CENTER);
  imageMode(CENTER);

  // Display game in Landscape view
  orientation(LANDSCAPE);
  frameRate(60);
  smooth();

  img = new PImage[3];
  catWalk = new PImage[4];
  catFire = new PImage[10];

  x = width - width/10;
  y = height - width/10;

  // Call load data function
  loadData();

  // Initialize classes
  cat = new Cat(width/2-width/5, height - (height/3), height - (height/3));
  objectsArray.add(cat);
  level1 = new LevelOne(img[0], obst, ground);
}

void draw()
{
  if (levels == 0)
  {
    drawMenu();
  } else if (levels == 1)
  {
    level1.updatelevel();
    level1.drawlevel();
    drawBg();

    for (int i = 0; i <= objectsArray.size()-1; i++)
    {
      BaseClass draw = objectsArray.get(i);
      draw.update();
      draw.render();
    }
  }
}


void mousePressed()
{

  if (levels == 0 && mouseY > height-height/10)
  {
    if (mouseX < width/3)
    {
      menuList = new KetaiList(this, menuChoice);
    } else if (mouseX > width/3 && mouseX < (width/3)*2)
    {
      KetaiKeyboard.toggle(this);
    }
  }
}


void loadData()
{
  menuChoice.add("Level 1");
  menuChoice.add("Level 2");
  menuChoice.add("Level 3");

  // Load background for all 3 levels
  for (int i = 0; i < img.length; i++)
  {
    img[i] = loadImage("levels/" + (i+1) + ".jpg");
    img[i].resize(width, height);
  }

  // Load images for cat walk
  for (int i=0; i < catWalk.length; i++)
  {
    catWalk[i] = loadImage("Cat/walk/" + (i+1) + ".png"); 
    catWalk[i].resize(width/5, height/3);
  }

  //Load images for cat fire
  for (int i = 0; i < catFire.length; i++)
  {
    catFire[i] = loadImage("Cat/fire/" + i + ".png");
    catFire[i].resize(width/4, height/4);
  }

  // Load images
  ground = loadImage("levels/ground.png");
  ground.resize(width, height/2);
  obst = loadImage("levels/tower.png");
  obst.resize(width/10, height/10);
  //fire = loadImage("Cat/fire.gif");
  fire2 = loadImage("Cat/fire.gif");
  //fire.resize(width/4, height/4);
}

void drawMenu()
{
  pushStyle();
  stroke(0);
  image(img[0], width/2, height/2);
  fill(255);

  rect(0, height, width/3, -height/10);
  rect(width/3, height, width/3, -height/10);
  rect((width/3)*2, height, width/3, -height/10);

  fill(0);
  text("Menu", width/6, height-height/20);
  text("Keyboard", (width/6)*3, height -height/20);
  text("Exit", (width/6)*5, height-height/20);
}

void onKetaiListSelection(KetaiList list)
{
  String levelChoice = list.getSelection();

  if (levelChoice == "Level 1")
  {
    levels = 1;
  } else if (levelChoice == "Level 2")
  {
    levels = 0;
  } else if (levelChoice == "Level 3")
  {
    levels = 0;
  } else
  {
    levels = 0;
  }
}

void drawBg()
{
  pushMatrix();

  tint(255, 126);
  image(fire2, x, y);

  popMatrix();
}