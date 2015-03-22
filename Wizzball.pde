import java.util.*;

// A Mover object
Mover mover;

// Own Shape
Shape shape;
Shape shape2;
Shape shape3;

Nasty nasty;

// PShape object for creating obstacles
PShape square;

// These are for the background image
PImage back;
PVector vback;

int X_Size = 720;
int Y_Size = 440;

// State of the game for starting screen etc.
int gameState = 1;

int[] gapPlaces = new int[] {300, 600};
// must be dividable by two
int[] gapWidths = new int[] {50, 70};

// This is for control purposes, there must be a certain time interval between button presses
int lastPressed = 0;

void setup() {
  size(X_Size,Y_Size,P2D);
  back = loadImage("back.png");
  
  vback = new PVector(0, 0);
  
  mover = new Mover();
  nasty = new Nasty();
  
  int borders[] = new int[] {20,50,20,50};
  shape = new Shape(borders);
    
  int borders2[] = new int[] {50,60,70,100};
  shape2 = new Shape(borders2);
  
  int borders3[] = new int[] {200,290,300,360};
  shape3 = new Shape(borders3);  
}

void draw() {
  // In game
 if (gameState == 0) {
    
  paraDraw(back, vback, 0.3);
  
  strokeWeight(8);
  line(0,0,gapPlaces[0] - gapWidths[0],0);
  line(gapPlaces[0] + gapWidths[0],0,X_Size,0);
  
  line(0,Y_Size,X_Size,Y_Size);
  mover.display(); 
  nasty.display();

  shape.Display();
  shape2.Display();
  shape3.Display();
  
  mover.HitBorder(gapPlaces,gapWidths);
  nasty.HitBorder();
  
  mover.HitEdge(shape);
  mover.HitEdge(shape2);
  mover.HitEdge(shape3);
  nasty.HitEdge(shape);
  nasty.HitEdge(shape2);
  nasty.HitEdge(shape3);
  
 if(mover.HitNasty(nasty.RequestLocation()))
  {
    gameState = 2;
  }
  
  mover.update("NoKey");
  nasty.update(RandomNumber(-1,1),RandomNumber(-1,1));
  
   // Display the Mover
 }
  
  // Starting screen
  else if (gameState == 1) {
    background(100);
    textSize(40);
    text("WIZZBALL", 10, 170);
    textSize(18);
    text("Press ENTER to start an adventure", 10, 190);
    textSize(14);
    text("Once upon a time there was Ball. One day he decided to get some excitement to his boring life.", 10, 25);  
  }
  
  // End screen
  else if (gameState == 2) {
    background(100);
    textSize(60);
    text("GAME OVER", 10, 170);
    textSize(18);
    text("Press ENTER to play again", 10, 190);
  }
}

// Check button presses
void keyPressed() {
if (gameState == 0) {   
 
  if (millis() - lastPressed < 150) {
  return;
}
   if (keyCode == UP) {
      mover.update("Up");
    }
     if (keyCode == DOWN) {
      mover.update("Down");
    }
       if (keyCode == RIGHT) {
      mover.update("Right");
    }    
       if (keyCode == LEFT) {
      mover.update("Left");
    }
    if (keyCode == TAB)
    {
      mover.gravityflip();
    }
    lastPressed = millis();
}

else {
  if (keyCode == ENTER) {
    if (gameState == 2)
      {
        setup();
      }
    gameState = 0;
  }
 }
}

int RandomNumber(int min, int max)
{
  return min + (int)(Math.random() * ((max - min) + 1));  
}

void paraDraw(PImage img, PVector pos, float vel) {
  pos.sub(vel, 0, 0);
  
  int r = (int)pos.x + img.width;
  
  if (r < width) image(img, r, pos.y);
  if (pos.x < width) image(img, pos.x - img.width, pos.y);
  if (pos.x < -img.width) pos.x = width;
  
  image(img, pos.x, pos.y);
}
