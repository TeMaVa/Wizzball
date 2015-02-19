/**
 * Acceleration with Vectors 
 * by Daniel Shiffman.  
 * 
 * Demonstration of the basics of motion with vector.
 * A "Mover" object stores location, velocity, and acceleration as vectors
 * The motion is controlled by affecting the acceleration (in this case towards the mouse)
 *
 * For more examples of simulating motion and physics with vectors, see 
 * Simulate/ForcesWithVectors, Simulate/GravitationalAttraction3D
 */

// A Mover object


Mover mover;

void setup() {
  size(640,360);
  mover = new Mover(); 
}

void draw() {
  background(0);
  
    // Bounce off edges, alhalla "height", oikealla "width"
  if ((mover.location.x > width) || (mover.location.x < 0))
  {
  mover.HitEdge("Horizontal");
  }
  
  if ((mover.location.y > height) || (mover.location.y < 0))
  {
    mover.HitEdge("Vertical");
  }
  
  // Update the location
  mover.update("NoKey");
    
  // Display the Mover
  mover.display(); 
}

 //jatkuu tästä 
 void keyPressed() {
   if (keyCode == UP) {
       print("Pressed Up");
      mover.update("Up");
    }
     if (keyCode == DOWN) {
       print("Pressed Down");
      mover.update("Down");
    }
  }


  
