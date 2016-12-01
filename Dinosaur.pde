class Dinosaur
{
  private float _x;
  private float _y;
  private PImage _dinosaurImg;
  private boolean _canJump;

  Dinosaur(float x, float y, PImage dinosaurImg, boolean canJump)
  {
    _x = x;
    _y = y;
    _dinosaurImg = dinosaurImg;
    _canJump = canJump;
  }
  
  public void Update()
  {
    if (_canJump && keyPressed && key == ' ' && screen == 1)
    {
      dino.Jump();
    }
    
    if (_y < groundY)
    {
      _y += yForce * timeDelta;
      yForce += gravity * timeDelta;
    } 
    else 
    {
      _y = groundY;
      _canJump = true;
    }
  }
 
  
  public void Jump()
  {
    yForce = -60;
    _y+= yForce * timeDelta;
    _canJump = false;
  }


  public void Draw()
  {
      image(_dinosaurImg, _x, _y);
  }
}