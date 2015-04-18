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

static final int WINDOW_WIDTH = 720;
static final int WINDOW_HEIGHT = 600;

static final float GRAVITY = -200;

GameWorld world;
BallCamera cam;
Ball ball;
PlatformGroup platforms;
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
}

void draw() {
  background(0);
  
  world.draw();
}


