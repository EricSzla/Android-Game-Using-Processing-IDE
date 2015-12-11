/* Program developed by Eryk Szlachetka
 * Student number: C14386641
 */

/* Ketai Library is an android library
 * for working with sensors, cameras
 * multi-touch, networking, Bluetooth, 
 * WiFi Direct, Near Field Communication etc.
 */

import ketai.camera.*;
import ketai.cv.facedetector.*;
import ketai.data.*;
import ketai.net.*;
import ketai.net.bluetooth.*;
import ketai.net.nfc.*;
import ketai.net.nfc.record.*;
import ketai.net.wifidirect.*;
import ketai.sensors.*;
import ketai.ui.*;

BaseClass cat;
Levels level1;

Board bg;
Board bg1;

int levels = 1;
boolean update = false;
String direct;

PImage[] img;
PImage ground;
PImage obst;

void setup()
{
  // Full screen size
  size(displayWidth, displayHeight);
  colorMode(RGB, 255, 255, 255, 100);
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
  if (levels == 1)
  {
    image(img[0], 0, 0);
    level1.drawlevel();
  }

  bg.drawBg();
  bg1.drawBg();
  cat.update(direct);
  cat.render();
}


void mousePressed()
{
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


void loadData()
{
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