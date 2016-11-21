class Cloud
{
  private float _x;
  private float _y;
  private PImage _cloudImg;
  private boolean _isFlying;
  
  Cloud(float x, float y, PImage cloudImg, boolean isFlying)
  {
    _x = x;
    _y = y;
    _cloudImg = cloudImg;
    _isFlying = isFlying; 
  }
  
  public void Draw()
  {
    if (_isFlying)
    {
      image(_cloudImg, _x, _y);
    }
  }
    
}