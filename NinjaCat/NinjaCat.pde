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
Board bg;
Board bg1;

int levels = 0;
boolean update = false;
String direct;

PImage[] img;
PImage ground;
PImage obst;
ArrayList<String> menuChoice = new ArrayList<String>();


void setup()
{
  // Full screen size
  size(displayWidth, displayHeight);
  colorMode(RGB, 255, 255, 255, 100);
  textSize(height/20);
  textAlign(CENTER);

  // Display game in Landscape view
  orientation(LANDSCAPE);
  frameRate(60);
  smooth();
  direct = "";
  img = new PImage[3];

  // Call load data function
  loadData();
}

void draw()
{
  if (levels == 0)
  {
    drawMenu();
  } else if (levels == 1)
  {
    image(img[0], 0, 0);
    level1.drawlevel();
    bg.drawBg();
    bg1.drawBg();
    cat.update(direct);
    cat.render();
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
  } else {
    // If mouse is pressed on the left sphere
    if (mouseX < width/5 && mouseY > height- width/5)
    {
      direct = "left";
    } // If mouse is pressed on the right sphere 
    else if (mouseX > width - (width/10) && mouseY > height-width/5)
    {
      direct = "up";
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
    img[i] = loadImage((i+1) + ".jpg"); //"levels/" + 
    img[i].resize(width, height);
  }

  // Load images
  ground = loadImage("ground.jpg");
  ground.resize(width, height/5);
  obst = loadImage("tower.png");
  obst.resize(width/10, height/10);

  // Initialize classes
  cat = new Cat(width/2-width/5, height - (height/3), height - (height/3));
  level1 = new LevelOne(img[0], obst, ground);

  bg = new Board(width/10, height - width/10, width/5);
  bg1 = new Board(width - width/10, height - width/10, width/5);
}

void drawMenu()
{
  pushStyle();
  stroke(0);
  image(img[0], 0, 0);
  fill(255);

  rect(0, height, width/3, -height/10);
  rect(width/3, height, width/3, -height/10);
  rect((width/3)*2, height, width/3, -height/10);

  fill(0);
  text("Menu", width/6, height-height/20);
  text("Keyboard", (width/6)*3, height -height/20);
  text("Exit", (width/6)*5, height-height/20);
}

int i = 1;

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