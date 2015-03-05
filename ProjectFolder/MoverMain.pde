import java.util.*;

// A Mover object
Mover mover;

// Own Shape

Shape shape;
Shape shape2;
Shape shape3;
// PShape object for creating obstacles
PShape square;

String typing = "";
String saved = "";

// These are the obstacle borders for one obstacle, we should make a data structure to store more of these and change the HitEdge function (Mover interface)
int X_Size = 720;
int Y_Size = 440;


int gameState = 1;


// This is for control purposes, there must be a certain time interval between button presses
int lastPressed = 0;

int RandomNumber(int min, int max)
{
  
  return min + (int)(Math.random() * ((max - min) + 1));
  
}


void setup() {
  size(X_Size,Y_Size,P2D);
  mover = new Mover();
  
  int borders[] = new int[] {20,50,20,50};
  shape = new Shape(borders);
    
  int borders2[] = new int[] {50,60,70,100};
  shape2 = new Shape(borders2);
  
  int borders3[] = new int[] {200,290,300,360};
  shape3 = new Shape(borders3);  
  
  //textSize(40);
}

void draw() {
  if (gameState == 0) {
    
  background(0);

  shape.Display();
  shape2.Display();
  shape3.Display();
  
  // Bounce off edges, alhalla "height", oikealla "width"
  if ((mover.location.x > width) || (mover.location.x < 0))
  {
  mover.HitBorder("Horizontal");
  }
  
  if ((mover.location.y > height) || (mover.location.y < 0))
  {
    mover.HitBorder("Vertical");
  }
  // Check if obstacles are hit
  mover.HitEdge(shape);
  mover.HitEdge(shape2);
  mover.HitEdge(shape3);

  mover.update("NoKey");
  // Display the Mover
  mover.display(); 
  }
  
  else {
    background(100);
    textSize(40);
    text("WIZZBALL", 10, 170);
    textSize(18);
    text("Press ENTER to start an adventure", 10, 190);
    textSize(14);
    text("Once upon a time there was Ball. One day he decided to get some excitement to his boring life.", 10, 25);   
  }
}

// Check button presses
void keyPressed() {
if(gameState == 0) {   
if(millis() - lastPressed < 150)
{
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
    gameState = 0;
  }
}
}
