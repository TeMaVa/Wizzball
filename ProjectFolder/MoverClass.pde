

class Mover {

  // The Mover tracks location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector acceleration;
  // The Mover's maximum speed
  float topspeed;
  boolean gravityflip;

  Mover() {
    // Start in the center
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    topspeed = 7;
    gravityflip = false;
  }

// Possible strings: NoKey, Up,Down,Right,Left , parameters could be tweaked

  void update(String direction) {

  PVector acceleration = new PVector(0,0);
    
  if (gravityflip == true)
  {
      acceleration.set(0,-height);
      acceleration.setMag(0.1);

      if (direction == "Up" && velocity.y > 0)
      {
        PVector UpButton = new PVector(0,-height);
        UpButton.setMag(0.6);
        acceleration.add(UpButton);
      }
  }
  else if (gravityflip == false)
 {
      acceleration.set(0,height);
      acceleration.setMag(0.1);
        
      if (direction == "Down" && velocity.y < 0)
      {
        PVector DownButton = new PVector(0,height);
        DownButton.setMag(0.6);
        acceleration.add(DownButton);
      }        
 }

    if (direction == "Right")
    {
      PVector RightButton = new PVector(width,0);
      RightButton.setMag(1);
      acceleration.add(RightButton);
    }

    if (direction == "Left")
    {
      PVector LeftButton = new PVector(-width,0);
      LeftButton.setMag(1);
      acceleration.add(LeftButton);
    }
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    
    if (velocity.x > 5)
    {
      velocity.x = 5;
    }
    if (velocity.x < -5)
    {
      velocity.x = -5;
    }
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
 void HitBorder(String vertical_or_horizontal)
{
  if (vertical_or_horizontal == "Horizontal")
  {
    if (location.x < 0)
    {
    location.x = width;
    }
    
    else if (location.x > width)
    {
    location.x = 0;
    }
  }
  else if (vertical_or_horizontal == "Vertical")
  {
    // define bounce elasticity
    
    float elasticity = 0.92;
    
    if (location.y < 0)
    {
    velocity.y = -elasticity * velocity.y;
    location.y = 0;
    }
    else if (location.y > height)
    {
    velocity.y = -elasticity * velocity.y;
    location.y = height;
    }
    
    
  }
 
} 

// Checks if the obstacle has been hit from sides or top/bottom, ball is handled as a "point" atm, could be changed for added value

  void HitEdge(int [][] borders,int ObstacleNumber)
  {
    for (int i=0; i < ObstacleNumber; i++)
    {  
      int UpL = borders[2][i];
      int LowL = borders[3][i];
      int LeftL = borders[0][i];
      int RightL = borders[1][i];

      if(location.y > UpL && location.y < LowL && location.x > LeftL && location.x < RightL)
      {
      float U = abs(location.y - UpL);
      float D = abs(location.y - LowL);
      float L = abs(location.x - LeftL);
      float R = abs(location.x - RightL);
      float y_distance = min(U,D);
      float x_distance = min(L,R);
      
      if (y_distance < x_distance)
      {
        velocity.y = -velocity.y;
      }
      else
      {
        velocity.x = -velocity.x;
      }

    }
    }
  }
  // Gravityflip changes the boolean
  
  void gravityflip()
  {
    if (gravityflip == true)
    {
      gravityflip = false;
    }
    else
    {
      gravityflip = true;
    }
    return;
  }

}



