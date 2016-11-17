PImage dinosaurImg;
PImage cloudImg;
float xSpeed;
float ySpeed;
int score;



void setup()
{
  fullScreen();
  background(255);
  
  dinosaurImg = loadImage("dinosaur.png");
  dinosaurImg.resize(100,100);


}

void draw()
{
  image(dinosaurImg, width*1/8, height/1.96);
  
  line(0, height/1.6, width, height/1.6);
  
  
}