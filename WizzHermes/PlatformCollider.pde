// Handles player-platform collisions
class PlatformCollider extends GenericMassedCollider<Ball, Platform> {
  
  PlatformCollider(float elasticity) {
    super(elasticity);
  }
  
  // reset the player's jump when he hits a platform, then do the normal projection/impulse collision stuff
  void handle(Ball ball, Platform platform) {
    
    super.handle(ball, platform); // have GenericMassedCollider do the rest
  }
  
}
