class Dinosaur
{
  private float _x;
  private float _y;
  private PImage _dinosaurImg;
  private boolean _isJumping;

  Dinosaur(float x, float y, PImage dinosaurImg, boolean isJumping)
  {
    _x = x;
    _y = y;
    _dinosaurImg = dinosaurImg;
    _isJumping = isJumping;
    
  }

  public void Jump()
  {
    _y = _y - 10;
    
    if (_y < height/1.95)
    {
      force+= gravity * timeDelta
      
    }
    
    if (_y > height/1.95)
    {
      _y = _y - 5;
    }
    
    if (_y == _y - 20)
    {
      _y = _y + 20;
    }

  }
    
  

  public void Draw()
  {
    if (_isJumping)
    {
      image(_dinosaurImg, _x, _y);
    }
  }
  
  
  
  
}



  