class CrawlerCollider extends GenericMassedCollider<Ball, Crawler> {
  
  CrawlerCollider() {

  }
  
   void handle(Ball ball, Crawler crawler) {
    
    crawler.hide();
    crawler = null;

    println("Handlattu"); // have GenericMassedCollider do the rest
  } 
  
}
