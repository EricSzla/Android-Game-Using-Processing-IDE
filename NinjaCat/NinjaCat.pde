/* Program developed by Eryk Szlachetka
 * Student number: C14386641
 */

/* Ketai Library is an android library
 * for working with sensors, cameras
 * multi-touch, UI , networking, Bluetooth, 
 * WiFi Direct, Near Field Communication etc.
 */

/* TO DO */
// drawBg() function ? 
// if enough time different levels and new enemies ? 
// powerUps 

import ketai.ui.*;

KetaiList menuList;
KetaiVibrate vibration;

BaseClass cat;
BaseClass enemy;
Levels level1;

float lx, ly;

int levels = 0;           // Used to choose between levels
int stage = 0;            // Used to diffrenciate between talk stages in menu
boolean drawLive = false; // Used to draw a powerUp after enemy dies
boolean keyboardToggled = false;
boolean add = true;

String name;
String localtion;
String answer;

PImage menuCat;
PImage menuTalk;
PImage[] catWalk;         // Used to store images for cat walk animation
PImage[] enemyWalk;       // Used to store images for enemy walk animation
PImage[] enemyFire;       // Used to store images for enemy fire
PImage[] catFire;         // Used to store images for cat to shoot
PImage[] img;             // Used to store background images
PImage ground;            // Used to store ground image
PImage obst;              // Used to store obstacle image
PImage lives;             // Used to store lives image

// ArrayList objectsArray is used to store class objects
ArrayList<BaseClass> objectsArray = new ArrayList<BaseClass>();
// menuChoice used for KetaiList ( used with Ketai Library )
ArrayList<String> menuChoice = new ArrayList<String>();


void setup()
{  
  size(displayWidth, displayHeight);    // Display in full screen mode
  colorMode(RGB, 255, 255, 255, 100);
  textSize(height/20);
  textAlign(CENTER);
  imageMode(CENTER);
  orientation(LANDSCAPE);               // Display in LANDSCAPE mode
  frameRate(60);                        // Change the frameRate to 60
  smooth();

  vibration = new KetaiVibrate(this);

  img = new PImage[3];                  // Initialize PImage arrays
  catWalk = new PImage[4];
  catFire = new PImage[10];
  enemyWalk = new PImage[4];
  enemyFire = new PImage[10];

  loadData();                           // Call load data function

  // Initialize classes
  cat = new Cat(width/2-width/5, height - (height/3), height - (height/3));
  objectsArray.add(cat);
  enemy = new Enemy();
  objectsArray.add(enemy);
  level1 = new LevelOne(img[0], obst, ground);
}

void draw()
{

  if (levels == 0)             // If level is 0 then draw menu
  {
    drawMenu();
  } else if (levels == 1)      // If users chooses level 1 then the game begins
  {
    level1.updatelevel();      // Updates the level one
    level1.drawlevel();        // Draws the level one
    drawBg();                  // Draws controls

    // For loop to manipulate the class objects
    for (int i = 0; i <= objectsArray.size()-1; i++)
    {
      BaseClass draw = objectsArray.get(i);
      if (draw.win)
      {
        drawLive = false; // Hide live if drawn ( after enemy is killed ) 
        background(255);
        fill(0);
        stroke(0);
        text("Level " + levels + " passed !", width/2, height/2);
        fill(255);
        rect(width/4, height/2+height/20, width/2, height/20);
        fill(0);
        text("Click to progress to next level!", width/2, height/2+height/10);
        if (mousePressed)
        {
          if (mouseX > width/4 && mouseX < width/2+width/4)
          {
            if (mouseY> height/2 && mouseY < height/20)
            {
              if (levels < 3)
              {
                //levels++;
                draw.win = false;
                draw.livesLeft = 3;
                draw.respawn = false;
                draw.pos.y = height-height/3;
                draw.godown = false;
                draw.goup = false;
                draw.win = !draw.win;
                levels = 1;
              }
            }
          }
        }
      } else
      {
        draw.update();
        draw.render();
        if (drawLive)
        {
          checkCollisions();
        }
      }
    }
  } // End of if(levels == 1)
} // End of draw()

void mousePressed()
{

  // If levels == 0, that means if the Menu is showed
  if (levels == 0 && mouseY > height-height/10)
  {
    if (mouseX < width/3)
    {
      vibration.vibrate(200);
      // Draws the list where user can choose levels
      menuList = new KetaiList(this, menuChoice);
    } else if (mouseX > width/3 && mouseX < (width/3)*2)
    {
      // Turns on the keyboard
      vibration.vibrate(200);
      KetaiKeyboard.toggle(this);
      keyboardToggled = true;
    }
  }
}

void keyPressed()
{
  if (keyboardToggled)
  {
    if (stage == 0)
    {
      if (name == null)
      {
        name = "" + key;
        vibration.vibrate(200);
      } else 
      {
        name = name + key;
        vibration.vibrate(200);
      }

      println(name);
    }
    if (int(key) == 10)  // If key pressed == ENTER in ASCII value
    {
      if (stage == 0 && name != null)
      {
        stage = 1;
      }
      KetaiKeyboard.toggle(this); // Hide the keyboard
      keyboardToggled = false;
    }
  }
}

void loadData()
{
  // Add choices to arrayList
  menuChoice.add("Level 1");
  menuChoice.add("Level 2");
  menuChoice.add("Level 3");

  // Load background for all 3 levels
  for (int i = 0; i < img.length; i++)
  {
    img[i] = loadImage("levels/" + (i+1) + ".jpg");
    img[i].resize(displayWidth, displayHeight);
  }

  // Load images for cat walk && enemy walk
  for (int i=0; i < catWalk.length; i++)
  {
    catWalk[i] = loadImage("Cat/walk/" + (i+1) + ".png"); 
    catWalk[i].resize(displayWidth/5, displayHeight/3);

    enemyWalk[i] = loadImage("Cat/enemyWalk/" + (i+1) + ".png");
    enemyWalk[i].resize(displayWidth/5, displayHeight/3);
  }

  //Load images for cat fire
  for (int i = 0; i < catFire.length; i++)
  {
    catFire[i] = loadImage("Cat/fire/" + i + ".png");
    catFire[i].resize(displayWidth/4, displayHeight/4);

    enemyFire[i] = loadImage("Cat/enemyFire/" + i + ".png");
    enemyFire[i].resize(displayWidth/3, displayHeight/4);
  }

  // Load rest of the images
  ground = loadImage("levels/ground.png");
  ground.resize(width, height/2);
  obst = loadImage("levels/tower.png");
  obst.resize(width/10, height/10);
  lives = loadImage("Cat/lives.png");
  lives.resize(width/15, height/15);
  menuCat = loadImage("Menu/cat.png");
  menuCat.resize(width/3, height);
  menuTalk = loadImage("Menu/talk.png");
  menuTalk.resize(width/3, height/2);
}

void drawMenu()
{
  pushStyle();
  stroke(0);
  // image used instead of background(img) as android mode didnt allow to use background method
  image(img[0], displayWidth/2, displayHeight/2);
  image(menuCat, displayWidth-displayWidth/3, displayHeight/2);
  image(menuTalk, displayWidth/3, displayHeight/3);
  fill(255);

  // Draw rects for the bottom menu
  rect(0, height, width/3, -height/10);
  rect(width/3, height, width/3, -height/10);
  rect((width/3)*2, height, width/3, -height/10);

  // Fill the rectangles with text
  fill(0);
  text("Menu", width/6, height-height/20);
  text("Keyboard", (width/6)*3, height -height/20);
  text("Exit", (width/6)*5, height-height/20);
  popStyle();

  fill(0);
  if (stage == 0)
  {
    text("I'm the ninja cat !", displayWidth/3, displayHeight/4);
    text("What's your name?", displayWidth/3, displayHeight/3);
  } else if (stage == 1)
  {
    text("Hello " + name, displayWidth/3, displayHeight/4);
    text("Help me on my journey!", displayWidth/3, displayHeight/3);
  }
}
// Start of ketaiList
void onKetaiListSelection(KetaiList list)
{
  String levelChoice = list.getSelection();
  // If statements to change levels
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
// drawBg() used to draw the controls
void drawBg()
{
  pushMatrix();
  // ....
  // To be done ....
  popMatrix();
}

void checkCollisions()
{
  for (int i = objectsArray.size() - 1; i >= 0; i --)
  {
    BaseClass theCat = objectsArray.get(i);
    if (theCat instanceof Cat)
    {
      for (int j = objectsArray.size() - 1; j >= 0; j --)
      {
        BaseClass life = objectsArray.get(j);
        if (life instanceof Lives) // Check the type of an object
        {
          life.update();
          life.render();
          println(life.livesx);

          if (theCat.pos.x >= (life.livesx - width/15) && theCat.pos.x <= (life.livesx + width/15))
          {
            drawLive = false;
            ((Lives) life). applyTo((Cat)theCat);
            objectsArray.remove(life);
          } else
          {
            continue;
          }
        }
      }
    }
  }
}