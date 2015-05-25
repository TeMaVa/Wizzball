// Camera following the main ball
class BallCamera extends HCamera {
  BallCamera() {
    super();
  }
  
  void draw() {   
    setPosition(ball.getPosition().x - WINDOW_WIDTH / 2, -100);
    
    super.draw();
  }
}
