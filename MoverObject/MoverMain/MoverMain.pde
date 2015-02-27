import java.util.*;

// A Mover object
Mover mover;

// PShape object for creating obstacles
PShape square;

String typing = "";
String saved = "";

// These are the obstacle borders for one obstacle, we should make a data structure to store more of these and change the HitEdge function (Mover interface)
float ObstacleUpL = 100;
float ObstacleLowL = 180;
float ObstacleLeftL = 100;
float ObstacleRightL = 180;
int X_Size = 720;
int Y_Size = 440;

int[][] borders;
int ObstacleNumber;
int gameState = 1;

// This is for control purposes, there must be a certain time interval between button presses
int lastPressed = 0;

int RandomNumber(int min, int max)
{
  
  return min + (int)(Math.random() * ((max - min) + 1));
  
}

void InitializeObstacles(int TotalNumber)
{
  int slice_x;
  int slice_y;
  borders = new int[4][TotalNumber];
  for (int i = 0; i < TotalNumber; i++)
  {
    slice_x = round(i*(X_Size/TotalNumber));
    slice_y = round(i*(Y_Size/TotalNumber));
    //left
    borders[0][i] = RandomNumber(slice_x, slice_x+20);
    //right
    borders[1][i] = RandomNumber(slice_x+50, slice_x+70);
    //up
    borders[2][i] = RandomNumber(slice_y, slice_y+20);
    //bottom
    borders[3][i] = RandomNumber(slice_y+50, slice_y+70);
  }
  
}

void setup() {
  size(X_Size,Y_Size,P2D);
  mover = new Mover();
  ObstacleNumber = RandomNumber(1,5);
  InitializeObstacles(ObstacleNumber);
  //textSize(40);
}

void draw() {
  if (gameState == 0) {
    
  background(0);
  for(int i = 0; i < ObstacleNumber; i++)
  {
    square = createShape(RECT,borders[0][i],borders[2][i],borders[1][i]-borders[0][i],borders[3][i]-borders[2][i]);
    shape(square);
  }
  
  // Bounce off edges, alhalla "height", oikealla "width"
  if ((mover.location.x > width) || (mover.location.x < 0))
  {
  mover.HitBorder("Horizontal");
  ObstacleNumber = RandomNumber(1,5);
  InitializeObstacles(ObstacleNumber);
  }
  
  if ((mover.location.y > height) || (mover.location.y < 0))
  {
    mover.HitBorder("Vertical");
  }
  // Check if obstacles are hit
  mover.HitEdge(borders,ObstacleNumber);

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
