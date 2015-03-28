// The main ball
class Ball extends Being {
  
  // The amount of movement
  static final int STEP = 5;
  
  // Directions
  boolean _up;
  boolean _down;
  boolean _left;
  boolean _right;
  
  Ball(PVector position, float radius) {
    super(new HCircle(position, radius));

    _up = false;
    _down = false;
    _left = false;
    _right = false;
    
    fill(20, 102, 0);
  }

  public void update() {
    if (_up) {
      _position.y -= STEP;
    } 
    if (_right) {
      _position.x += STEP;
    } 
    if (_down) {
      _position.y += STEP;
    } 
    if (_left) {
      _position.x -= STEP;
    }
    
    // For testing
    println(ball.getPosition().x);
    println(ball.getPosition().y);
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

