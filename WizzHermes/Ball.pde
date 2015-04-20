// The main ball
class Ball extends MassedBeing {
  
  // The amount of movement
  static final int STEP = 3;
  
  // Directions
  boolean _up;
  boolean _down;
  boolean _left;
  boolean _right;
  boolean _gravityflip;
  float _topspeed = 200;
  
  Ball(PVector position, float radius) {
    super(new HCircle(position, radius),HermesMath.zeroVector(), 2.0f, 1.0f);

    _up = false;
    _down = false;
    _left = false;
    _right = false;
    _gravityflip = false;
    
    fill(20, 102, 0);
  }

  public void update() {
    
//    println(ball.getVelocity().y);
    if (_up) {
      if (_velocity.y > 0)
      {
      _position.y -= STEP;
      _velocity.y -= 0.5* STEP;
      }
    }     
    if (_down) {
      if (_velocity.y < 0)
      {
      _position.y += STEP;
      _velocity.y += 0.5 * STEP;
      }
    } 
    
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
    
    if (_right) {
      _position.x += STEP;
      _velocity.x += 3 * STEP;
    } 
    if (_left) {
      _position.x -= STEP;
      _velocity.x -= 3 * STEP;
    }
    
    
    
    // For testing
//    println(ball.getPosition().x);
//    println(ball.getPosition().y);
    if (_gravityflip)
    {
      addForce(new PVector(0, GRAVITY * getMass(), 0));
    }
    else
    {
      addForce(new PVector(0, -GRAVITY * getMass(), 0));
    }

  }

  public void draw() {   
    _shape.draw();
  }
  
  // Receiving user input
  public void receive(KeyMessage m) {
  int code = m.getKeyCode();

  
  if (m.isPressed()) {   
    if (code == POCodes.Key.UP) {
      _up = true;
    } 
    else if (code == POCodes.Key.RIGHT) {
      _right = true;
    } 
    else if (code == POCodes.Key.DOWN) {
      _down = true;
    } 
    else if (code == POCodes.Key.LEFT) {
      _left = true;
    }
      
    else if (code == POCodes.Key.TAB)
    {
        println("FLIP");
      _gravityflip = !_gravityflip;
    }
  } 
  
  else {
    if (code == POCodes.Key.UP) {
      _up = false;
    } 
    else if (code == POCodes.Key.RIGHT) {
      _right = false;
    } 
    else if (code == POCodes.Key.DOWN) {
      _down = false;
    } 
    else if (code == POCodes.Key.LEFT) {
      _left = false;
    }
  }
 }
 
 
}

