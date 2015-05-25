class CrawlerCollider extends GenericMassedCollider<Ball, Crawler> {
  
  CrawlerCollider() {
  }
  
   void handle(Ball ball, Crawler crawler) {
    
    if (ball.AM_I_GOD())
    {
      score++;
      world.delete(crawler);
      return;
    }
    
    lives--;
  }   
}
