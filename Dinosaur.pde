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
    _y = _y - 50;
    
    if (_y < height/1.95)
    {
      _y = _y + 5;
    }
    
    if (_y > height/1.95)
    {
      _y = _y - 5;
    }
/*    
    if (_y == _y - 20)
    {
      _y = _y + 20;
    }
*/
  }
    
  

  public void Draw()
  {
    if (_isMoving)
    {
      image(_dinosaurImg, _x, _y);
    }
  }
  
  
  
  
}



  