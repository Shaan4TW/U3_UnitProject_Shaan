class Dinosaur
{

  private float _x;
  private float _y;
  private PImage _dinosaurImg;
  private Boolean _isRunning;

  Dinosaur(float x, float y, PImage dinosaurImg, boolean isRunning)
  {
    _x = x;
    _y = y;
    _dinosaurImg = dinosaurImg;
    _isRunning = isRunning;
  }

  private void Move()
  {
    _x = _x + 5;
  }

  public void Update()
  {
    if (_isRunning)
    {
      Move();
    }
  }
  
  public void Draw()
  {
    if (_isRunning)
    {
      image(_dinosaurImg, _x, _y);
    }
  }
}