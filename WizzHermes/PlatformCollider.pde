// Handles player-platform collisions
class PlatformCollider extends GenericMassedCollider<MassedBeing, Platform> {
  
  PlatformCollider(float elasticity) {
    super(elasticity);
  }
  
  // reset the player's jump when he hits a platform, then do the normal projection/impulse collision stuff
  void handle(Ball ball, Platform platform) {
    
    super.handle(ball, platform); // have GenericMassedCollider do the rest
  }
  
  void handle(Baddie baddie, Platform platform) {
    super.handle(baddie, platform);
  }
  
  void handle(Crawler crawler, Platform platform) {

//    super.handle(crawler, platform);
    crawler.stopfall();

  }
  
}
