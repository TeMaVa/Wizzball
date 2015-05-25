
class Baddie extends MassedBeing {
  
  float _topspeed = 200;
  float _colourr;
  float _colourg;
  float _colourb;
  
  // Type tells us what type of monster ("Bouncer", "Crawler")
  Baddie(PVector position, float radius) {
    
      super(new HCircle(position, radius),HermesMath.zeroVector(), 2.0f, 1.0f);

      _colourr = random(100,255);
      _colourg = random(100,255);
      _colourb = random(100,255);
  }
  
  public void update() {
    
    addForce(new PVector(random(100,1000), -GRAVITY * getMass(), 0));
    addForce(new PVector(-random(100,1000),0,0));
    
    if (_velocity.x > _topspeed)
    {
      _velocity.x = _topspeed;
      return;
    }
    if (_velocity.x < -_topspeed)
    {
      _velocity.x = -_topspeed;
      return;
    }
    
    if(_velocity.y >= _topspeed*2)
    {
      _velocity.y = _topspeed*2;
    }      
}

  public void draw() {   

     fill(_colourr, _colourg, _colourb);
    _shape.draw();
  }
}
