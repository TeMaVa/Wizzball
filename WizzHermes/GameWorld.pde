// The World
class GameWorld extends World {
  PVector position = new PVector(100,100);
  float radius = 30;
  

  GameWorld(HCamera cam) {
    super(cam);
  }

  void setup() {
    // set up the platforms
    platforms = new PlatformGroup(world);
    Sector first = new Sector(0, 0, platforms, 0.8);
    SectorGrid grid = new SectorGrid(first, platforms);
  
    // set up platform generation
    world.register(grid, cam, new PlatformGenerator());
    
    ball = new Ball(position, radius);
    register(ball, true);
        
    // Subscribing the ball for user input
    subscribe(ball, POCodes.Key.UP);
    subscribe(ball, POCodes.Key.RIGHT);
    subscribe(ball, POCodes.Key.DOWN);
    subscribe(ball, POCodes.Key.LEFT);
    subscribe(ball, POCodes.Key.TAB);
    world.register(ball, platforms, new PlatformCollider(0.97));
  }
}

