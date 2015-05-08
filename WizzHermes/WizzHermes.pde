import processing.opengl.*;
import java.util.Hashtable;

// Importing Hermes libraries
import hermes.*;
import hermes.hshape.*;
import hermes.animation.*;
import hermes.physics.*;
import hermes.postoffice.*;

///////////////////////////////////////////////////
// CONSTANTS
///////////////////////////////////////////////////

static final int WINDOW_WIDTH = 1500;
static final int WINDOW_HEIGHT = 900;

static final float GRAVITY = -200;

GameWorld world;
BallCamera cam;
Ball ball;
PlatformGroup platforms;
BaddieGroup baddies;
CrawlerGroup crawlers;
PowerUpGroup powerups;
int GameState = 1;
///////////////////////////////////////////////////
// PAPPLET
///////////////////////////////////////////////////

void setup() {
  size(WINDOW_WIDTH, WINDOW_HEIGHT, JAVA2D); 
  Hermes.setPApplet(this);
  
  rectMode(CENTER);
  frameRate(60);
  

  
  cam = new BallCamera();
  world = new GameWorld(cam);

  world.start();
  world.suspend();
  if (GameState == 0)
  {
  world.resume();
  }
}

void draw() {
  if (GameState == 1)
  {
    background(100);
    textSize(40);
    text("WIZZBALL", 5, 500);
    textSize(18);
    text("Press ENTER to start an adventure", 5, 530);
    textSize(20);
    text("Once upon a time there was Mickey Mouse ball. He was a true tiny guy with no chance but to avoid other balls and rectangles.",1,25);
    text("Then his father told him:",1,50);
    textSize(60);
    text("\"Boy, eat your fucking medicine.",1,150);
    text("You will fucking turn red and angry\"", 1,250);
  }
  
  if (GameState == 2)
  {
    background(100);
    textSize(40);
    text("WHY DID YOU HIT HIM GAME OVER", 5, 170);
    textSize(18);
    text("Press ENTER to start an adventure", 5, 190);
  }
  if (GameState == 0)
{  
  background(0);
  
  world.draw();
}
}

void keyPressed() {
  if (keyCode == ENTER) {

    GameState = 0;
    setup();
  }
 }

