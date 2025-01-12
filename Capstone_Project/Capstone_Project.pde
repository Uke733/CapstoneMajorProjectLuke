import java.util.*;
//Declarations
PImage pic, pic2;
grid PlayingGrid;

//test
int turn = 2; 

//Calling Functions
void setup(){
  size(600,600);
  PlayingGrid = new grid(3,3);
  pic = loadImage("Transparent_X.png");
  pic2 = loadImage("O_number_2.png");
}

void draw() {
  PlayingGrid.displayGrid();
}

void mousePressed() {
    PlayingGrid.click(mouseX, mouseY);
    turn = 3 - turn;
    if (turn == 1){
      System.out.println("X's turn");
    }
    else{
      System.out.println("O's turn"); //fix turn printing
    }
}

void keyPressed() {
  if(key == 'c'){
  PlayingGrid.clear();
  }
}

class grid{
  int rows, columns; 
  int[][] gridarray;
  int CellWidth;
  int CellHeight;
  
  grid(int temp1,int temp2){
    rows = temp1;
    columns = temp2;
    gridarray = new int[rows][columns];
    CellWidth = width / columns;
    CellHeight = height / rows;
    
    clear();
}

  void displayGrid(){
    for (int y = 0; y < rows; y++){
      for(int x = 0; x < columns; x++){
        
        //available
        
        if (gridarray[y][x] == 1){
          image(pic, x * CellWidth, y * CellHeight);
          }
        else if (gridarray[y][x] == 2){
          image(pic2, x * CellWidth, y * CellHeight);  
          }
        fill(0,0,0,0);
        rect(x * CellWidth, y * CellHeight, CellWidth, CellHeight);
      }
    }
  }
  
  void click(int mx, int my){
    int x = mx / CellWidth;
    int y = my / CellHeight;
  turn = turn - 3;
  if (turn == 1){
    gridarray[y][x] = 1;
  }
  else{
    gridarray[y][x] = 2;
  }
      
    }

  
  void clear() {
     for(int y = 0; y < rows; y++){
       for(int x = 0; x < rows; x++){
         gridarray[y][x] = 0;
       }
     }
  }
}
