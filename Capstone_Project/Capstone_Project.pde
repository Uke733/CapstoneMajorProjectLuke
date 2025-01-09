//Declarations
PImage pic;
grid PlayingGrid;

//Calling Functions
void setup(){
  size(900,900);
  PlayingGrid = new grid(3,3);
  pic = loadImage("Transparent_X.png");
}

void draw() {
  PlayingGrid.displayGrid();
}
int count = 0;
void mousePressed() {
  if (count < 1000){
    PlayingGrid.click(mouseX, mouseY);
  }
  //  if (mouseX > 210){
  //    coll = 1;
  //    }
  //  else if (mouseX > 420){
  //    coll = 2;
  //    }
  //  else if(mouseX < 630){
  //    coll = 3;
  //    }
  //  if (mouseY > 210){
  //    row = 1;
  //    }
  //  else if (mouseY > 420){
  //    row = 2;
  //    }
  //  else if(mouseY < 630){
  //    row = 3;
  //    }
  //  count++;
  //}
}

void keyPressed() {
  if(key == 'c'){
  PlayingGrid.clear();
  }
}

//Functions
class grid{
  int rows, columns;
  int[][] gridarray;
  int CellWidth = width / columns;
  int CellHeight = height / rows;
  
  grid(int temp1,int temp2){
  rows = temp1;
  columns = temp2;
  gridarray = new int[rows][columns];
  clear();
}
  void displayGrid(){
  
    for (int y = 0; y < rows; y++){
      for(int x = 0; x < columns; x++){
        
        //available
        if (gridarray[y][x] == 1){
        fill(255);
      }
      else{
        image(pic,(columns * CellWidth),(rows * CellWidth));
      }
     
      rect(x * CellWidth, y * CellHeight, CellWidth, CellHeight);
      }
    }
  }
  
  void click(int mx, int my){
  int CellWidth = width / columns;
  int CellHeight = height / rows;
  
  int x = mx / CellWidth;
  int y = my / CellHeight;
  
  //if (gridarray[y][x] == false){
  //  gridarray[y][x]= true;
  //}
  //else{
  //  gridarray[y][x] = false;
  //}
}
  
  void clear() {
     for(int y = 0; y < rows; y++){
       for(int x = 0; x < rows; x++){
         gridarray[y][x] = 0;
       }
     }
  }
}
