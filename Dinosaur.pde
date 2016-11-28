class Dinosaur
{
  private float _x;
  private float _y;
  private PImage _dinosaurImg;
  private boolean _isMoving;

  Dinosaur(float x, float y, PImage dinosaurImg, boolean isMoving)
  {
    _x = x;
    _y = y;
    _dinosaurImg = dinosaurImg;
    _isMoving = isMoving;
    
  }

  public void Jump()
  {
    _y = _y - 30;
    
  }
    
  

  public void Draw()
  {
    if (_isMoving)
    {
      image(_dinosaurImg, _x, _y);
    }
  }
  
  
  
  
}



  