//Declarations
PImage pic, pic2;
grid PlayingGrid;
int count = 0;
int turn = 1;

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
  if (count < 1000){
    PlayingGrid.click(mouseX, mouseY);
  }
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
        
        //available, make second array to determine which squares are taken.
        if (gridarray[y][x] == 1){
          if (turn == 2){
            image(pic,(x * CellWidth),(y * CellWidth));
          }
          else{
            image(pic2,(x * CellWidth),(y * CellWidth));
          }
        }
        fill(0,0,0,0);
        rect(x * CellWidth, y * CellHeight, CellWidth, CellHeight);
      }
    }
  }
  
  void click(int mx, int my){
  
    int x = mx / CellWidth;
    int y = my / CellHeight;
  
  if (gridarray[y][x] == 0){
    gridarray[y][x]= 1;
    }
  if (turn == 1){
    turn++;
    }
  else{
    turn--;
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
