class CrawlerGroup extends Group<MassedBeing> {
  
    CrawlerGroup(World world) { 
    super(world);
    addCrawler(300,30);
    addCrawler(-200,60);
  }
  
  private void addCrawler(float x, float y)
  {
    Crawler crawler = new Crawler(x,y);
    world.register(crawler,true);
    this.add(crawler);
  }
  
}
