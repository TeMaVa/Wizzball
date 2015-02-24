



import java.util.*;

// A Mover object

Mover mover;

// PShape object for creating obstacles
PShape square;



// These are the obstacle borders for one obstacle, we should make a data structure to store more of these and change the HitEdge function (Mover interface)

float ObstacleUpL = 100;
float ObstacleLowL = 180;
float ObstacleLeftL = 100;
float ObstacleRightL = 180;

//float[][] borders = new float[4][];

// This is for control purposes, there must be a certain time interval between button presses
int lastPressed = 0;

void setup() {
  size(720,440,P2D);
  mover = new Mover();
}

void draw() {
  background(0);
  square = createShape(RECT,ObstacleLeftL,ObstacleUpL,ObstacleRightL-ObstacleLeftL,ObstacleLowL-ObstacleUpL);
  shape(square);
  
    // Bounce off edges, alhalla "height", oikealla "width"
  if ((mover.location.x > width) || (mover.location.x < 0))
  {
  mover.HitBorder("Horizontal");
  }
  
  if ((mover.location.y > height) || (mover.location.y < 0))
  {
    mover.HitBorder("Vertical");
  }
  // Check if obstacles are hit
  mover.HitEdge(ObstacleUpL,ObstacleLowL,ObstacleLeftL,ObstacleRightL);

  mover.update("NoKey");
  // Display the Mover
  mover.display(); 
}

// Check button presses

 void keyPressed() {
   
if(millis() - lastPressed < 150)
{
  return;
}
   if (keyCode == UP) {
      mover.update("Up");
    }
     if (keyCode == DOWN) {
      mover.update("Down");
    }
       if (keyCode == RIGHT) {
      mover.update("Right");
    }    
       if (keyCode == LEFT) {
      mover.update("Left");
    }
    if (keyCode == TAB)
    {
      print("G");
      mover.gravityflip();
    }
    lastPressed = millis();
  }


  
