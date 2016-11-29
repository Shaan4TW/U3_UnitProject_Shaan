class Cactus
{
  private float _x;
  private float _y;
  private PImage _cactusImg;
  private boolean _isBlocking;

  Cactus(float x, float y, PImage cactusImg, boolean isBlocking)
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
    _x = _x - 6;

    if (_x < width*-0.2)
    {
      _x = random(width*1.2, width*2.8);
    }
  }
}