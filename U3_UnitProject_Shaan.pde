PImage dinosaurImg;
PImage dinosaurImg2;
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

Cloud cloudy;
Cloud[] clouds;

Cactus[] cactii;



void setup()
{
  fullScreen();
  background(255);
  groundY = height/1.95;

  dinosaurImg = loadImage("dinosaur.png");
  dinosaurImg2 = loadImage("dinosaur.png");
  dinosaurImg.resize(100,100);
  cloudImg = loadImage("cloud.png");
  cactusImg = loadImage("cactus.png");
  dinosaurImg2.resize(width/13, width/13);
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

    image(dinosaurImg, width/15, height/2.9);
    
    cloudy.Draw();

    if (mousePressed && screen == 0 && mouseX>buttonX && mouseX<buttonW+buttonX && mouseY>buttonY && mouseY<buttonH+buttonY)
    {
      screen = 1;
    }
  }

  if (screen == 1)
  {
    background(255);
    dinosaurImg.resize(100,100);
    dino.Draw();
    dino.Update();
    line(0, height/1.6, width, height/1.6);

    score++;

    fill(0, 0, 255);
    textSize(20);
    text("Score:", width/1.3, height/20);

    fill(0, 0, 255);
    textSize(20);
    text(score, width/1.2, height/20);

    for (int i = 0; i < 7; i++)
    {
      cactii[i].Draw();
      cactii[i].Move();

      if (isColliding(dino._x, dino._y, dino._dinosaurImg.width, 
        dino._dinosaurImg.height, cactii[i]._x, cactii[i]._y, 
        cactii[i]._cactusImg.width, cactii[i]._cactusImg.height) )
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
      background(255);

      fill(0);
      rect(buttonX, buttonY, buttonW, buttonH);

      fill(0, 255, 0);
      textSize(30);
      text("Back to Home Page", width/2.55, height/1.95);

      fill(0, 255, 0);
      textSize(17);
      text("P.S. You suck", width/2.5, height/1.75);

      if (mousePressed && screen == 2 && mouseX>buttonX && mouseX<buttonW+buttonX 
        && mouseY>buttonY && mouseY<buttonH+buttonY)
      {
        screen = 0;
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

  if ( (rightSideX > otherX && rightSideX < otherX + otherW) || 
    (leftSideX < otherX + otherW && leftSideX > otherX) || 
    (topSideY <= otherY + otherH && topSideY >= otherY) || 
    (bottomSideY >= otherY && bottomSideY <= otherY + otherH)  )
  {
    return true;
  } 
  else
  {
    return false;
  }
}