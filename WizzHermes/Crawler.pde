class Crawler extends MassedBeing {

  
  float _topspeed = 300;
  float _colourr;
  float _colourg;
  float _colourb;
  boolean hidden = false;
   // Type tells us what type of monster ("Bouncer", "Crawler")
  Crawler(float x, float y) {
    
    super(new HRectangle(HermesMath.makeVector(x, y), 50, 50), HermesMath.zeroVector(), 1.0f, 1.0f);
    
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
  
  public void stopfall() {
    _velocity.y = 0;
  }
  
  public void hide() {
    hidden = true;
  }
    

}
