/**
 * Generates and stores the platforms in the game
 */
class PlatformGroup extends Group<Platform> {
  
  boolean once = true;
  float multiplier = -900;
  
  PlatformGroup(World world) { 
    super(world);
    
  }
  
  /**
   * adds a platform at given center and width
   */
  void addPlatform(PVector center, float width) {
    Platform platform = new Platform(center, width);
    world.register(platform, false);
    this.add(platform);
  }
  
  /**
   * fills an area with randomly-placed platforms
   */
  void generatePlatforms(HRectangle area, float verticalStep, float density) {

    float boxWidth = area.getWidth();
    float boxHeight = area.getHeight();
    float maxPlatWidth = boxWidth / 2;
    float minPlatWidth = Platform.HEIGHT * 2;
    // iterate through rows
    for(float y = area.getAbsMin().y + verticalStep; y <= area.getAbsMax().y - verticalStep; y += verticalStep) {
      

      float x = area.getAbsMin().x; // start at the left end of the rect
//      println("x on " + x);
      float platWidth = random(minPlatWidth, maxPlatWidth); // width of the new platform
      float baseDist = random(minPlatWidth, maxPlatWidth);  // distance before the new platform
      x += platWidth / 2 + baseDist / density;              // move to the midpoint of the new platform
      while(x < area.getAbsMax().x - platWidth / 2) {       // keep going right until a platform would leave the rect

        addPlatform(new PVector(x, y, 0), platWidth);
        x += platWidth / 2;
        platWidth = random(minPlatWidth, maxPlatWidth);
        baseDist = random(minPlatWidth, maxPlatWidth);
        x += platWidth / 2 + baseDist / density;
      }
    }

  if(area.getAbsMin().x > multiplier)
  {
    once = true;
  }
  if (!once)
  {
    return;
  }

  addPlatform(new PVector(area.getAbsMin().x + 900,area.getAbsMin().y/8-50,0),1800);
  addPlatform(new PVector(area.getAbsMin().x + 900,area.getAbsMax().y*2-100,0),1800);
  multiplier = multiplier + 1800 + random(500,1000);
  once = false;  
  }
  
  
}
