class Cactus
{
class Cloud
{
  private float _x;
  private float _y;
  private PImage _cactusImg;
  private boolean _isBlocking;

  Cloud(float x, float y, PImage cactusImg, boolean isBlocking)
  {
    _x = x;
    _y = y;
    _cactusImg = cactusImg;
    _isBlocking = isBlocking;
  }

  public void Draw()
  {
    if (_isBlocking)
    {
      image(_cactusImg, _x, _y);
    }
  }
  
  public void Move()
  {
    _x = _x + 20;
  }
  
  
}
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}