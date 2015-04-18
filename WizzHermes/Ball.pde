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
  
  Ball(PVector position, float radius) {
    super(new HCircle(position, radius),HermesMath.zeroVector(), 2.0f, 1.0f);

    _up = false;
    _down = false;
    _left = false;
    _right = false;
    
    fill(20, 102, 0);
  }

  public void update() {
    if (_up) {
      _position.y -= STEP;
      _velocity.y -= 0.5* STEP;
    } 
    if (_right) {
      _position.x += STEP;
      _velocity.x += 2 * STEP;
    } 
    if (_down) {
      _position.y += STEP;
      _velocity.y += 0.5 * STEP;
    } 
    if (_left) {
      _position.x -= STEP;
      _velocity.x -= 2 * STEP;
    }
    
    // For testing
    println(ball.getPosition().x);
    println(ball.getPosition().y);
    addForce(new PVector(0, -GRAVITY * getMass(), 0));
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

