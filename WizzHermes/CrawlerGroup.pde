class CrawlerGroup extends Group<MassedBeing> {
  
    CrawlerGroup(World world) { 
    super(world);
    addCrawler(30,30);
    addCrawler(60,60);
  }
  
  private void addCrawler(float x, float y)
  {
    Crawler crawler = new Crawler(x,y);
    world.register(crawler,true);
    this.add(crawler);
  }
  
}
