// RAGEBALL game for TIE-21100
// Group 22, Pekko Ojanen & Teemu Vartiainen
// 05/2015

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

static final float GRAVITY = -240;

GameWorld world;
BallCamera cam;
Ball ball;
PlatformGroup platforms;
BaddieGroup baddies;
CrawlerGroup crawlers;
PowerUpGroup powerups;

int GameState = 1;
int time;
int wait = 1000;
int gameTime;
int score = 0;
int highScore = 0;
int lives = 1;

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
  
  time = millis();
  
  if (GameState == 0)
  {
  world.resume();
  }
}

void draw() {
  
  // Starting screen
  if (GameState == 1)
  {
    highScore = max(score, highScore); 

    background(100);
    gameTime = 25;
    score = 0;
    lives = 1;
       
    // Printing all the texts for the starting screen
    textSize(100);
    fill(200, 0, 0);
    text("RAGE", 480, 700);
    fill(255, 255, 255);
    text("BALL", 740, 700);
    textSize(18);   
    text("Press ENTER to start the adventure", 488, 730);
    textSize(20);
    text("Once upon a time there was a Mickey Mouse ball. He was a true tiny guy with no chance but to avoid other balls and rectangles.", 5, 25);
    text("Then his father told him:", 5, 50);
    textSize(60);
    text("\"Boy, eat your f****** medicine.", 5, 150);
    text("You will turn red and angry.\"", 5, 250);
    textSize(40);
    text("Highscore: " + highScore, 1225, 870);
  }
    
  // The gameplay
  if (GameState == 0)
  {  
  background(0);
  
  // Printing time left, score and lives
  textSize(40);
  text(gameTime, 1400, 60);
  text(score, 30, 60);
  text("|" + lives, 1452, 60);
   
  // Reducing seconds for the timer
  if (millis() - time >= wait)
  {
    gameTime--;
    time = millis();  
  }
  
  // If the time or the lives run out, the game ends
  if (gameTime == 0 || lives <= 0)
  {
    GameState = 1;
  }
 
  // If the player gets four points, an extra life is added 
  if (score == 4)
  {
    lives = 2;
  }
  
  world.draw();
 }
}

void keyPressed() {
  if (GameState == 1)
  {
   if (keyCode == ENTER) 
   {
    GameState = 0;
    setup();
   }
  }
}
