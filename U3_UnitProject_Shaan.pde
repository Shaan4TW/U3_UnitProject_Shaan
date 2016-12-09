/*
Hello, this is a game called Desert Dino. It is inspired by the offline
Google Chrome game where a dinosaur is going through a desert. The goal 
is to avoid cactii, and as time progresses, your score will increase. 
You must use a kinect for this project to work. With the kinect, you 
can either let it track your hand or body. Once it does, move
(your hands) upwards.
Enjoy! 

- Made by Shaan_4TW

*/


import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;


PImage dinosaurImg;
PImage dinosaurImg2;
PImage cloudImg;
PImage cloudImg2;
PImage cactusImg;
int score;
int screen;
float buttonX;
float buttonY;
float buttonW;
float buttonH;
float timeDelta;
int gravity = 10;
float groundY;
int yForce;
int startY;
float yPos;

Dinosaur dino;

Cloud[] clouds;

Cactus[] cactii;

Kinect kinect;
KinectTracker tracker;

void setup()
{
  fullScreen();
  background(255);
  groundY = height/1.95;

  kinect = new Kinect(this);
  tracker = new KinectTracker();

  

  dinosaurImg = loadImage("dinosaur.png");
  dinosaurImg.resize(100, 100);
  dinosaurImg2 = loadImage("dinosaur.png");
  dinosaurImg2.resize(300, 300);
  cloudImg = loadImage("cloud.png");
  cloudImg2 = loadImage("cloud.png");
  cloudImg2.resize(400, 400);
  cactusImg = loadImage("cactus.png");
  dinosaurImg2.resize(width/13, width/13);
  cactusImg.resize(height/13, height/11);
  cactii = new Cactus[4];

  timeDelta = 1.0/frameRate;

  for (int i = 0; i < 4; i++)
  {
    cactii[i] = new Cactus(random(width*1, width*4), height/1.85, cactusImg, true);
  }

  clouds = new Cloud[5];

  for (int i = 0; i < 5; i++)
  {
    clouds[i] = new Cloud(random(width*0.05, width*0.95), height*0.1, cloudImg, true);
  }

  dino = new Dinosaur(width/2.3, height/1.95, dinosaurImg, true);



  buttonX = width/2.69;
  buttonY = height/2.4;
  buttonW = width/4;
  buttonH = height/5;
}

void draw()
{
  tracker.track();
  
  if (screen == 0)
  {
    background(255);
    fill(0, 255, 255);
    rect(buttonX, buttonY, buttonW, buttonH);
    dinosaurImg2.resize(300, 300);
    
    PVector v1 = tracker.getPos();
  
    startY = (int) v1.y;
    
    fill(0);
    textSize(50);
    text("Play!", width/2.2, height/1.87);

    fill(0);
    textSize(50);
    text("Made by Shaan :)", width/2.95, height/1.2);

    fill(0);
    textSize(75);
    text("Desert Dino", width/3, height/4);

    image(dinosaurImg2, width/15, height/2.9);

    image(cloudImg2, width/1.5, height/3.2);

    if (mousePressed && screen == 0 && mouseX>buttonX && mouseX<buttonW+buttonX && mouseY>buttonY && mouseY<buttonH+buttonY)
    {
      screen = 1;
    }
  }

  if (screen == 1)
  {
    background(255);
    dino.Draw();
    dino.Update();
    line(0, height/1.6, width, height/1.6);

    PVector v1 = tracker.getPos();
  
    yPos = (int) v1.y;
    
    score++;
    
    
    fill(255,0,0);
    ellipse(width/2, yPos, 30, 30);
    
    fill(255,0,0);
    ellipse(width/2, startY, 30, 30);
    
    fill(0, 0, 255);
    textSize(20);
    text("Score:", width/1.3, height/20);

    fill(0, 0, 255);
    textSize(20);
    text(score, width/1.2, height/20);

    for (int i = 0; i < 4; i++)
    {
      cactii[i].Draw();
      cactii[i].Move();

      if (isColliding(dino._x, dino._y, dino._w, dino._h, 
        cactii[i]._x, cactii[i]._y, cactii[i]._w, cactii[i]._h) )
      {
        screen = 2;
      }
    }

    for (int i = 0; i < 5; i++)
    {
      clouds[i].Draw();
      cloudImg.resize(150, 150);
    }


    if (screen == 2)
    {
      score = 0;

      for (int i = 0; i < 4; i++)
      {
        cactii[i] = new Cactus(random(width*0.8, width*5), height/1.85, cactusImg, true);
      }

      cloudImg.resize(400, 400);

      background(255);

      fill(0);
      rect(buttonX, buttonY, buttonW, buttonH);

      fill(0, 255, 0);
      textSize(30);
      text("Back to Home Page", width/2.55, height/1.95);

      fill(0, 255, 0);
      textSize(17);
      text("P.S. You suck", width/2.5, height/1.75);
    }
  }
}    
void mouseReleased()
{
  if (screen == 2 && mouseX>buttonX && mouseX<buttonW+buttonX 
    && mouseY>buttonY && mouseY<buttonH+buttonY)
  {
    screen = 0;
  }
}


boolean isColliding(float boxX, float boxY, float boxW, float boxH, 
  float otherX, float otherY, float otherW, float otherH)
{
  float rightSideX  = boxX + boxW;
  float leftSideX   = boxX;
  float topSideY    = boxY;
  float bottomSideY = boxY + boxH;


  if ( ( rightSideX > otherX  &&         
    rightSideX < otherX + otherW ) || 
    (leftSideX  < otherX + otherW &&
    leftSideX  > otherX) )
  {
    if ( ( topSideY <= otherY + otherH &&
      topSideY >= otherY) ||
      ( bottomSideY >= otherY &&
      bottomSideY <= otherY + otherH) )
    {
      return true;
    }
  }
  return false;
}