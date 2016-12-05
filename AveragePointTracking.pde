class AveragePointTracking
{
import org.openkinect.freenect.*;
import org.openkinect.processing.*;


KinectTracker tracker;
Kinect kinect;


void setup() {
  size(640, 520);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
}

void draw() {
  background(255);

  // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();

  // Let's draw the raw location
  PVector v1 = tracker.getPos();
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}