class Shape {
  
  // Left, right, up, bottom
  
  PShape s_;
  int borders_[] = new int[4];
  
  
  
  Shape (int borders[]) {
    
  borders_[0] = borders[0];
  borders_[1] = borders[1];
  borders_[2] = borders[2];
  borders_[3] = borders[3];  
  s_ = createShape(RECT,borders_[0],borders_[2],borders_[1]-borders_[0],borders_[3]-borders_[2]);
  }
  
 
 
 
 void Display()
 {
   shape(s_);
 }
   
 
 
 // 0 is no contact, 1 is contact from up or down, 2 is contact from left/right
  
  int HitBorders(float location_x, float location_y)
  {
    
      int UpL = borders_[2];
      int LowL = borders_[3];
      int LeftL = borders_[0];
      int RightL = borders_[1];    
    
    if(location_y > UpL - 12 && location_y < LowL + 12 && location_x > LeftL - 12 && location_x < RightL + 12)
      {
      float U = abs(location_y - UpL);
      float D = abs(location_y - LowL);
      float L = abs(location_x - LeftL);
      float R = abs(location_x - RightL);
      float y_distance = min(U,D);
      float x_distance = min(L,R);
      
  
        if (y_distance < x_distance)
        {
          return 1;
        }
        else
        {
          return 2;

        }
      }
    else
    {
      return 0;
    }
  }
//  void InitializeObstacle(int TotalNumber)
//  {
//    int slice_x;
//    int slice_y;
//    borders = new int[4][TotalNumber];
//    for (int i = 0; i < TotalNumber; i++)
//    {
//      slice_x = round(i*(X_Size/TotalNumber));
//      slice_y = round(i*(Y_Size/TotalNumber));
//      //left
//      borders[0][i] = RandomNumber(slice_x, slice_x+20);
//      //right
//      borders[1][i] = RandomNumber(slice_x+50, slice_x+70);
//      //up
//      borders[2][i] = RandomNumber(slice_y, slice_y+20);
//      //bottom
//      borders[3][i] = RandomNumber(slice_y+50, slice_y+70);
//    }





}

