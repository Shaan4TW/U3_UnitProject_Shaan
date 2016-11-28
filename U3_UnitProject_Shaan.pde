PImage dinosaurImg;
PImage cloudImg;
PImage cactusImg;
int score;
int xDirection = 1;
float xSpeed = 2;
int screen;
float buttonX;
float buttonY;
float buttonW;
float buttonH;

Dinosaur dino;
Dinosaur dinosaw;

Cloud cloudy;
Cloud[] cloud;

Cactus[] cactus;

void setup()
{
  fullScreen();
  background(255);

  dinosaurImg = loadImage("dinosaur.png");
  cloudImg = loadImage("cloud.png");
  cactusImg = loadImage("cactus.png");

  dinosaurImg.resize(100, 100);
  cactusImg.resize(100,100);
  
  cactus = new Cactus[20];
  
  for (int i = 0; i < 20; i++)
  {
    cactus[i] = new Cactus(random(width*1.2,width*1.4), height/1.95, cactusImg, true);
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
    line(0, height/1.6, width, height/1.6);
  }
}

void keyPressed()
{
  if (key == ' ' && screen == 1)
  {
    dino.Jump();
  }
}