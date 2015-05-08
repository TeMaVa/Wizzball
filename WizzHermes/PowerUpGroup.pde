

class PowerUpGroup extends Group<MassedBeing> {
  
    PowerUpGroup(World world) { 
    super(world);
    addPowerUp(new PVector(200,200));
    addPowerUp(new PVector(2000,200));
  }
  
  
    private void addPowerUp(PVector center) {
    ArrayList<PVector> shapepoints = new ArrayList<PVector>();
    shapepoints.add(new PVector(0,0,0));
    shapepoints.add(new PVector(50,50,0));
    shapepoints.add(new PVector(-50,50,0));
    PowerUp invisibility = new PowerUp(center,shapepoints);
    world.register(invisibility, true);
    this.add(invisibility);
  }
  
}


