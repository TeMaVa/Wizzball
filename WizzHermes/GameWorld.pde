// The World
class GameWorld extends World {
  PVector position = new PVector(200,200);
  float radius = 30;
  
  GameWorld(HCamera cam) {
    super(cam);
  }

  void setup() {
    ball = new Ball(position, radius);
    register(ball, true);
        
    // Subscribing the ball for user input
    subscribe(ball, POCodes.Key.UP);
    subscribe(ball, POCodes.Key.RIGHT);
    subscribe(ball, POCodes.Key.DOWN);
    subscribe(ball, POCodes.Key.LEFT);  
  }
}

