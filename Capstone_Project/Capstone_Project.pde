grid PlayingGrid;

void setup(){
  size(700,700);
  PlayingGrid = new grid(3,3);
}

void draw() {
  background(220);
  PlayingGrid.displayGrid();
}

void mousePressed() {
  PlayingGrid.click(mouseX, mouseY);
}

void keyPressed() {
  if(key == 'c'){
  PlayingGrid.clear();
  }
}

class grid{
  int rows, columns;
  boolean[][] gridarray;
  
  grid(int temp1,int temp2){
  rows = temp1;
  columns = temp2;
  gridarray = new boolean[rows][columns];
  clear();
}
  void displayGrid(){
  
    for (int y = 0; y < rows; y++){
      for(int x = 0; x < columns; x++){
      
        if (gridarray[y][x] == false){
        fill(255);
      }
      else {
        fill(0); // adjust to X's and O's
      }
      
      int CellWidth = width / columns;
      int CellHeight = height / rows;
      
      rect(x * CellWidth, y * CellHeight, CellWidth, CellHeight);
      }
    }
  }
  
  void click(int mx, int my){
  int CellWidth = width / columns;
  int CellHeight = height / rows;
  
  int x = mx / CellWidth;
  int y = my / CellHeight;
  
  if (gridarray[y][x] == false){
    gridarray[y][x]= true;
  }
  else{
    gridarray[y][x] = false;
  }
}
  
  void clear() {
     for(int y = 0; y < rows; y++){
       for(int x = 0; x < rows; x++){
         gridarray[y][x] = false;
       }
     }
  }
}
