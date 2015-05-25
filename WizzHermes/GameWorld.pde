// The World
class GameWorld extends World {
  PVector position = new PVector(100,100);
  float radius = 30; 

  GameWorld(HCamera cam) {
    super(cam);
  }

  void setup() {
    // Set up the platforms
    platforms = new PlatformGroup(world);
    Sector first = new Sector(0, 0, platforms, 0.8);
    SectorGrid grid = new SectorGrid(first, platforms);
  
    // Set up platform generation
    world.register(grid, cam, new PlatformGenerator());
    
    ball = new Ball(position, radius);
    register(ball, true);
    baddies = new BaddieGroup(world);
    crawlers = new CrawlerGroup(world);
    powerups = new PowerUpGroup(world);
    
    // Subscribing the ball for user input
    subscribe(ball, POCodes.Key.UP);
    subscribe(ball, POCodes.Key.RIGHT);
    subscribe(ball, POCodes.Key.DOWN);
    subscribe(ball, POCodes.Key.LEFT);
    subscribe(ball, POCodes.Key.TAB);
    
    // Register all objects to the world
    world.register(ball, platforms, new PlatformCollider(0.97));
    world.register(baddies,platforms, new PlatformCollider(0.97));
    world.register(ball,baddies,new BaddieCollider());
    world.register(crawlers,platforms,new CrawlerPlatformCollider(0));
    world.register(ball,crawlers,new CrawlerCollider());
    world.register(ball,powerups,new PowerUpCollider());
  }
}

