/**
 * Acceleration with Vectors 
 * by Daniel Shiffman.  
 * 
 * Demonstration of the basics of motion with vector.
 * A "Mover" object stores location, velocity, and acceleration as vectors
 * The motion is controlled by affecting the acceleration (in this case towards the mouse)
 */


class Mover {

  // The Mover tracks location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector acceleration;
  // The Mover's maximum speed
  float topspeed;

  Mover() {
    // Start in the center
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    topspeed = 5;
  }

// Possible strings: NoKey, Up,Down,Right,Left

  void update(String direction) {
    PVector acceleration = new PVector(0,0);
    if (direction == "NoKey")
    {
        print("Gravity");
        acceleration = new PVector(0,height);
        acceleration.setMag(0.1);
    }
    if (direction == "Up")
    {
      acceleration = new PVector(0,-height);
      acceleration.setMag(0.4);
    }
    if (direction == "Down")
    {
      acceleration = new PVector(0,height);
      acceleration.setMag(0.4);
    }
    // Set magnitude of acceleration

    
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    // Location changes by velocity
    location.add(velocity);
  }

  void display() {
    stroke(255);
    strokeWeight(2);
    fill(127);
    ellipse(location.x,location.y,48,48);
  }
 
 
 // Possible strings: Horizontal, Vertical
 void HitEdge(String vertical_or_horizontal)
{
  if (vertical_or_horizontal == "Horizontal")
  {
    velocity.x = -2*velocity.x;
    location.add(velocity);
  }
  else if (vertical_or_horizontal == "Vertical")
  {
    if (location.y < 0)
    {
      acceleration = new PVector(0,-2*height);
    }
    else if (location.y > height)
    {
      acceleration = new PVector(0,2*height);
    }      
    acceleration.setMag(1.2);
    velocity.sub(acceleration);
    location.add(velocity);
    
  }
 
} 

}



