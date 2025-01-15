import java.util.*;
//Declarations
PImage pic, pic2;
grid PlayingGrid;
int turn = 1;

//Size of grid, creating new grid with 3 rows 3 columns, setting up X and O images, X places first
void setup(){
  size(600,600);
  PlayingGrid = new grid(3,3);
  pic = loadImage("Transparent_X.png");
  pic2 = loadImage("O_number_2.png");
  System.out.println("X's start");
}

void draw() {
  PlayingGrid.displayGrid();
}

void mousePressed() {
    turn = 3 - turn;
    PlayingGrid.click(mouseX, mouseY);
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

//drawing grid
  void displayGrid(){
    for (int y = 0; y < rows; y++){
      for(int x = 0; x < columns; x++){
        
        //available
        if (gridarray[y][x] == 1){
          image(pic2, x * CellWidth, y * CellHeight);
          }
        if (gridarray[y][x] == 2){
          image(pic, x * CellWidth, y * CellHeight);  
          }
        fill(0,0,0,0);
        rect(x * CellWidth, y * CellHeight, CellWidth, CellHeight);
      }
    }
  }
  //win condition
  //int Xwins = 0;
  //int Owins = 0;
  boolean win(){
    //check columns for win
    //if(win() == false){
    //  clear();
    //  if (turn == 1){
    //    Xwins++;
    //  }
    //  else{
    //    Owins++;
    //  }
    //  System.out.println("Game Reset");
    //  System.out.println("X has " + Xwins + "wins and O has " + Owins);
    //}
    for(int x = 0; x < columns; x++){
      if (gridarray[0][x] != 0 && gridarray[0][x] == gridarray[1][x] && gridarray[1][x] == gridarray[2][x]){
        return true;
      }
    }
    //check rows for win
    for(int y = 0; y < rows; y++){
      if(gridarray[y][0] != 0 && gridarray[y][0] == gridarray[y][1] && gridarray[y][1] == gridarray[y][2]){
        return true;
      }
    }
    //check diagonals for win
    if(gridarray[0][0] != 0 && gridarray[0][0] == gridarray[1][1] && gridarray[1][1] == gridarray[2][2]){
      return true;
    }
    if(gridarray[0][2] != 0 && gridarray[0][2] == gridarray[1][1] && gridarray[1][1] == gridarray[2][0]){
      return true;
    }
    else{
      return false;
    }
  }
//Calling win and turns function when click is called  
  void click(int mx, int my){
    win();
    int x = mx / CellWidth;
    int y = my / CellHeight;
    if (win() == false){
     if (turn == 1){
          System.out.println("X's turn");
        }
      else{
          System.out.println("O's turn"); 
        }
        }
    if (turn == 1){
      gridarray[y][x] = 1;
      if(win() == true){
      System.out.println("O wins");
        } 
      }
    else{
      gridarray[y][x] = 2;
      if(win() == true){
      System.out.println("X wins");
        } 
      }   
  }
  
  void clear() {
     for(int y = 0; y < rows; y++){
       for(int x = 0; x < rows; x++){
         gridarray[y][x] = 0;
       }
     }
     background(204);
  } 
}
