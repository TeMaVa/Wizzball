class CrawlerCollider extends GenericMassedCollider<Ball, Crawler> {
  
  CrawlerCollider() {

  }
  
   void handle(Ball ball, Crawler crawler) {
    
    if (ball.AM_I_GOD())
    {
      world.delete(crawler);
      return;
    }
    
    GameState = 2;
  } 
  
}
