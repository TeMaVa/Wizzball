

class PowerUp extends MassedBeing {
  
  float _topspeed = 350;
  float _colourr;
  float _colourg;
  float _colourb;
  boolean hidden = false;
  PowerUp(PVector position, ArrayList<PVector> shapepoints) {
      super(new HPolygon(position,shapepoints),HermesMath.zeroVector(), 2.0f, 1.0f);

  _colourr = random(100,255);
  _colourg = random(100,255);
  _colourb = random(100,255);

  }
  
  public void update() {
    
    addForce(new PVector(random(500/2,5000/2), random(500/2,5000/2),0));
    addForce(new PVector(-random(500/2,5000/2),-random(500/2,5000/2),0));
    
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
    if (_position.y >= WINDOW_HEIGHT - 200)
    {
      addForce(new PVector(-random(-5000/2,5000/2),-random(2000/2,5000/2),0));
    }
    if (_position.y <= 200)
    {
      addForce(new PVector(-random(-5000/2,5000/2),random(2000/2,5000/2),0));
    }     
}

  public void draw() {   
     fill(_colourr, _colourg, _colourb);
    _shape.draw();
  }    
}

