PImage dinosaurImg;
PImage cloudImg;
int score;
int xDirection = 1;
float xSpeed = 2;
int screen;

Dinosaur dino;
Dinosaur dinosaw;

Cloud cloudy;
Cloud[] cloud;

void setup()
{
  fullScreen();
  background(255);

  dinosaurImg = loadImage("dinosaur.png");
  dinosaurImg.resize(100, 100);
  
  cloudImg = loadImage("cloud.png");
  
  dino = new Dinosaur(width/8, height/1.95, dinosaurImg, true);
  dinosaw = new Dinosaur(width/15, height/2.9, dinosaurImg, true);
  
  cloudy = new Cloud(width/1.5, height/3.2, cloudImg, true);
}

void draw()
{
  if (screen == 0)
  {
    background(255);
    fill(0, 255, 255);
    rect(width/2.69, height/2.4, width/4, height/5);
    
    fill(0);
    textSize(50);
    text("Play!", width/2.2, height/1.87);
    
    fill(0);
    textSize(50);
    text("Made by Shaan :)", width/2.95, height/1.2);
    
    fill(0);
    textSize(75);
    text("Desert Dino", width/3, height/4);
    
    dinosaurImg.resize(300,300);
    cloudImg.resize(400,400);
    
    dinosaw.Draw();
    cloudy.Draw();
    
   /* if(mousePressed && screen == 0 && mouseX>width/2.69 && mouseX<width/2 && mouseY>height/2.4 && mouseY<height/3.1);
    {
      screen++;
    }
    */
  }

  if (screen == 1)
  {
    background(255);
    dino.Draw();
    dino.Update();
    line(0, height/1.6, width, height/1.6);
    
    
  }
}