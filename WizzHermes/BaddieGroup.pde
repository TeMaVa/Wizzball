
class BaddieGroup extends Group<MassedBeing> {
  
    BaddieGroup(World world) { 
    super(world);
    
    for(int i = 1; i <= 20000; i+= 2000)
    {
    addBaddie(new PVector(i,200),50);
    addBaddie(new PVector(i+1000,200),30);
    }
//    addBaddie(new PVector(500,200),50);
//    addBaddie(new PVector(1000,200),50);
      addBaddie(new PVector(2000,200),50);    
  }
  
    private void addBaddie(PVector center, float radius) {
      Baddie bouncer = new Baddie(center,radius);
    
      world.register(bouncer, true);
      this.add(bouncer);
  }  
}
