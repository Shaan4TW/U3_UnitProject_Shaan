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
  
  private void Move()
  {
    _x = _x + 5;
  }
  
  public void Update()
  {
    if (_isMoving)
    {
      Move();
    }
  }
  
  public void Draw()
  {
    if (_isMoving)
    {
      image(_dinosaurImg, _x, _y);
    }
  }
  
  
  

  
}