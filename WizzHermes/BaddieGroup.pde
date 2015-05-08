
class BaddieGroup extends Group<MassedBeing> {
  
    BaddieGroup(World world) { 
    super(world);
    addBaddie(new PVector(200,200),50);
    addBaddie(new PVector(300,300),30);
    addBaddie(new PVector(2000,200),30);
  }
  
  
    private void addBaddie(PVector center, float radius) {
    Baddie bouncer = new Baddie(center,radius);
    world.register(bouncer, true);
    this.add(bouncer);
  }
  
}
