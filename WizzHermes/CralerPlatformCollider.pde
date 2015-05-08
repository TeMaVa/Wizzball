class CrawlerPlatformCollider extends GenericMassedCollider<Crawler, Platform> {
  
  CrawlerPlatformCollider(float elasticity) {
    super(elasticity);
  }
  
  // reset the player's jump when he hits a platform, then do the normal projection/impulse collision stuff
  void handle(Crawler crawler, Platform platform) {
    
    super.handle(crawler, platform); // have GenericMassedCollider do the rest
  }
  
}
