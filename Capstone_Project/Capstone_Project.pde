// Program name: (Tic Tac Toe)

// Student name: (Luke Filipchuk)

// Date: (Jan 21)

// Program Description: Visual Tic-Tac-Toe, 3 consecutive X's or O's placed in a column or row to win the game.

//import java.util.Scanner;
// Declaring images
PImage pic, pic2;
grid PlayingGrid;

// Size of grid, creating new grid with 3 rows 3 columns, setting up X and O images, prints instructions
void setup(){
  size(600,600);
  pic = loadImage("Transparent_X.png");
  pic2 = loadImage("O_number_2.png");
  System.out.println("~~~ 3 consecutive X's or O's placed in a column or row to win the game ~~~");
  System.out.println("~~~ X's START, press 'c' to RESET Game ~~~");
  
  //Supposed to be additional code for input but unfinished  
  
  ////Inputting number of rows
  //Scanner InputRows = new Scanner(System.in);
  //System.out.println("Enter the number of rows");
  //int InputRows2 = InputRows.nextInt();
  ////Inputting number of columns
  //Scanner InputCols = new Scanner(System.in);
  //System.out.println("Enter the number of columns");
  //int InputCols2 = InputCols.nextInt();
  
  PlayingGrid = new grid(3, 3);
}

// Calling new grid to conditionally display X's and O's
void draw() {
  PlayingGrid.displayGrid();
}

// Moving mouseX and mouseY to click function
void mousePressed() {
  PlayingGrid.click(mouseX, mouseY);
}
  
// Calling clear function when 'c' is pressed
void keyPressed() {
  if(key == 'c'){
    PlayingGrid.clearme();
  }
}

// Creating new class for drawing grid and calling function
class grid{
  // Initializing grid coordinates for win conditionals
  int turn = 1;
  int rows, columns; 
  int[][] gridarray;
  int CellWidth;
  int CellHeight;
  boolean[][] IsPopulated;
  
  // Ensuring overwritting does not occur
  grid(int temp1,int temp2){
    rows = temp1;
    columns = temp2;
    gridarray = new int[rows][columns];
    CellWidth = width / columns;
    CellHeight = height / rows;
    IsPopulated = new boolean [rows][columns];
    clearme();
  }
  
  // Drawing grid
  void displayGrid(){
    for (int y = 0; y < rows; y++){
      for(int x = 0; x < columns; x++){   
        // Places O's image
        if (gridarray[y][x] == 1){
          image(pic2, x * CellWidth, y * CellHeight);
          }
        // Places X's image
        if (gridarray[y][x] == 2){
          image(pic, x * CellWidth, y * CellHeight);  
          }
        // Prevents overlapping of image and grid
        fill(0,0,0,0);
        // Draws playing grid
        rect(x * CellWidth, y * CellHeight, CellWidth, CellHeight);
      }
    }
  }
  
  // Win conditionals
  boolean win(){
    boolean foundwin;
    foundwin = false;
    // Checks columns for win
    for(int x = 0; x < columns; x++){
        if (gridarray[0][x] != 0 && gridarray[0][x] == gridarray[1][x] && gridarray[1][x] == gridarray[2][x]){
          foundwin = true;
        }
    }
    // Checks rows for win
    for(int y = 0; y < rows; y++){
      if(gridarray[y][0] != 0 && gridarray[y][0] == gridarray[y][1] && gridarray[y][1] == gridarray[y][2]){
        foundwin = true;
      }
    }
    // Checks diagonals for win
    if(gridarray[0][0] != 0 && gridarray[0][0] == gridarray[1][1] && gridarray[1][1] == gridarray[2][2]){
        foundwin = true;
    }
    if(gridarray[0][2] != 0 && gridarray[0][2] == gridarray[1][1] && gridarray[1][1] == gridarray[2][0]){
        foundwin = true;
    }
    // Converting foundwin to win()
    if (foundwin == true){
      return true;
    }
    else{
      return false;
      }
  }
  
  // Calling win and turns function when click is called  
  int Xwins, Owins = 0;
  void click(int mx, int my){
    // Takes mouse coordinates and converts to playing size of grid --> (x = 0-2,y = 0-2)
    int x = mx / CellWidth;
    int y = my / CellHeight;
    // Checks that square clicked was not previously used
    if (IsPopulated[x][y] == false){
      turn = 3 - turn;
      if (win() == false){
        if (turn == 1){
            System.out.println("X's turn");
          }
        else{
            System.out.println("O's turn"); 
          }
      }
      // Tells IsPopulated that O has picked this square
      if (turn == 1){
        IsPopulated[x][y] = true; 
        gridarray[y][x] = 1;
        // Checks if O has won
        if(win() == true){
          System.out.println("~~~ O wins, X's start ~~~");
          Owins++;
          System.out.println("O has " + Owins + " win(s)");
          clearme();
        } 
      }
      // Tells IsPopulated that X has picked this square
      else{
        IsPopulated[x][y] = true; 
        gridarray[y][x] = 2;
        // Checks if X has won
        if(win() == true){
          System.out.println("~~~ X wins, O's start ~~~");
          Xwins++;
          System.out.println("X has " + Xwins + " win(s)");
          clearme();
        } 
      }
  }
  // Tells player they have clicked on a already used square
  else{
    System.out.println("Pick another square or 'c' to RESET");
   }
}  
  
  // Clear function, checks rows and columns to reset each image
  void clearme() {
     for(int a = 0; a < rows; a++){
       for(int b = 0; b < columns; b++){
          gridarray[a][b] = 0;
          // Resets playing board in terms of overlapping
          IsPopulated[a][b] = false;
       }
     }
     background(204);
  } 
}
