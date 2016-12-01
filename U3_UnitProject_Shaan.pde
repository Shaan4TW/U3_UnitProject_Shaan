PImage dinosaurImg;
PImage cloudImg;
PImage cactusImg;
int score;
int screen;
float buttonX;
float buttonY;
float buttonW;
float buttonH;
float timeDelta;
int gravity = 20;
float groundY;
int yForce;


Dinosaur dino;
Dinosaur dinosaw;

Cloud cloudy;
Cloud[] clouds;

Cactus[] cactii;



void setup()
{
  fullScreen();
  background(255);
  groundY = height/1.95;

  dinosaurImg = loadImage("dinosaur.png");
  cloudImg = loadImage("cloud.png");
  cactusImg = loadImage("cactus.png");

  dinosaurImg.resize(width/13, width/13);
  cactusImg.resize(height/13, height/11);

  cactii = new Cactus[7];

  timeDelta = 1.0/frameRate;

  for (int i = 0; i < 7; i++)
  {
    cactii[i] = new Cactus(random(width*1.2, width*2.8), height/1.85, cactusImg, true);
  }

  clouds = new Cloud[5];

  for (int i = 0; i < 5; i++)
  {
    clouds[i] = new Cloud(random(width*0.05, width*0.95), height*0.1, cloudImg, true);
  }


  dino = new Dinosaur(width/2.3, height/1.95, dinosaurImg, true);
  dinosaw = new Dinosaur(width/15, height/2.9, dinosaurImg, true);

  cloudy = new Cloud(width/1.5, height/3.2, cloudImg, true);

  buttonX = width/2.69;
  buttonY = height/2.4;
  buttonW = width/4;
  buttonH = height/5;
}

void draw()
{
  if (screen == 0)
  {
    background(255);
    fill(0, 255, 255);
    rect(buttonX, buttonY, buttonW, buttonH);

    fill(0);
    textSize(50);
    text("Play!", width/2.2, height/1.87);

    fill(0);
    textSize(50);
    text("Made by Shaan :)", width/2.95, height/1.2);

    fill(0);
    textSize(75);
    text("Desert Dino", width/3, height/4);

    dinosaurImg.resize(300, 300);
    cloudImg.resize(400, 400);

    dinosaw.Draw();
    cloudy.Draw();

    if (mousePressed && screen == 0 && mouseX>buttonX && mouseX<buttonW+buttonX && mouseY>buttonY && mouseY<buttonH+buttonY)
    {
      screen = 1;
    }
  }

  if (screen == 1)
  {
    background(255);
    dinosaurImg.resize(100, 100);
    dino.Draw();
    dino.Update();
    line(0, height/1.6, width, height/1.6);
    
  }

  if (screen == 1)
  {
    for (int i = 0; i < 7; i++)
    {
      cactii[i].Draw();
      cactii[i].Move();
    }

    for (int i = 0; i < 5; i++)
    {
      clouds[i].Draw();
      cloudImg.resize(150, 150);
    }
    
    
    if (screen == 2)
    {
      background(255);

      fill(0);
      textSize(40);
      text("YOU LOSE!", width/2, height/2);

      rect(buttonX, buttonY, buttonW, buttonH);

      if (mousePressed && screen == 2 && mouseX>buttonX && mouseX<buttonW+buttonX && mouseY>buttonY && mouseY<buttonH+buttonY)
      {
        screen = 1;
      }
    }
  }
}


boolean isColliding(float dimgX, float dimgY, float dimgW, float dimgH, 
    float otherX, float otherY, float otherW, float otherH)
    {
      float rightSideX = dimgX + dimgW;
      float leftSideX = dimgX;
      float topSideY = dimgY;
      float bottomSideY = dimgY + dimgH;
      
      if ( (rightSideX > otherX && rightSideX < otherX + otherW) || (leftSideX < otherX + otherW && leftSideX > otherX) )
      {
        screen = 3;
      }
    }
 