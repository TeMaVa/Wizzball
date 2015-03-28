// Camera following the main ball
class BallCamera extends HCamera {
  BallCamera() {
    super();
  }
  
  void draw() {   
    setPosition(ball.getPosition().x - WINDOW_WIDTH / 2,
                ball.getPosition().y - WINDOW_HEIGHT / 2);
    super.draw();
  }
}
