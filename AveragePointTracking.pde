class AveragePointTracking
{
  


  KinectTracker tracker;
  Kinect kinect;


  void setup() 
  {
    size(640, 520);

    tracker = new KinectTracker();
  }

  void draw() 
  {
    background(255);

    // Run the tracking analysis
    tracker.track();
    // Show the image
    tracker.display();

    // Let's draw the raw location
    PVector v1 = tracker.getPos();
    
    if (dist(v1.x, v1.y
  }
}