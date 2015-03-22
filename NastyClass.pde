class Nasty {
 PVector location;
 PVector velocity;
 PVector acceleration;
 float topspeed;
 
 Nasty() {
  // Start in the edge
  location = new PVector(width-60,height-60);
  velocity = new PVector(0,0);
  topspeed = 7;
} 
  
  void display() {
    stroke(255);
    strokeWeight(2);
    fill(50);
    ellipse(location.x,location.y,64,64);
  }  

  void update(int acceleration_x, int acceleration_y)
  {
    acceleration = new PVector(acceleration_x,acceleration_y);
    acceleration.setMag(0.1);
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
    
  void HitEdge(Shape shape)
  {
    int contact = shape.HitBorders(location.x,location.y);
    
    if (contact == 0)
      {
        return;
      }
      
    else if (contact == 1)
    {
      velocity.y = -velocity.y;
      return;
    }
    
    else
    {
      velocity.x = -velocity.x;
      return;
    }
      
  }
  
   void HitBorder()
  {
  
    if (location.x < 0)
    {
    location.x = width;
    }
    
    else if (location.x > width)
    {
    location.x = 0;
    }
  
  {
    // define bounce elasticity   
    float elasticity = 0.99;
    
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
  
  PVector RequestLocation()
  {
    return location;
  }  
}
