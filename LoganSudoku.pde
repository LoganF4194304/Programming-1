int s = 3;
int S = 500 - (500 % (s*s)) + s*s;
int cellSize = S / (s*s);
int[][] SudokuBoard = new int[][]{
{6, 0, 0, 0, 0, 0, 0, 9, 0},
{0, 0, 0, 8, 0, 5, 0, 0, 3},
{0, 0, 0, 7, 1, 0, 0, 0, 0},
{5, 0, 0, 0, 4, 8, 0, 0, 1},
{0, 0, 2, 0, 0, 0, 0, 0, 5},
{0, 0, 8, 0, 0, 0, 0, 6, 0},
{0, 5, 0, 0, 6, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 2, 7, 4, 9},
{0, 9, 0, 0, 0, 1, 3, 0, 0}};
int selectedRow = 0;
int selectedCol = 0;
int idx = 0;
void setup(){
  size(500, 500);
  windowResize(S, S);
  textAlign(CENTER, CENTER);
}
void drawGrid(){
  for(int r = 0; r < s*s; r++){
    for(int c = 0; c < s*s; c++){
      int x = c * cellSize;
      int y = r * cellSize;
      if(r == selectedRow && c == selectedCol){
        fill(0, 255, 0);
      }else{
        fill(255);
      }
      stroke(0);
      strokeWeight(1);
      rect(x, y, cellSize, cellSize);
      if(SudokuBoard[r][c] != 0){
        fill(0);
        textSize(20);
        text(SudokuBoard[r][c], x + cellSize / 2, y + cellSize / 2);
      }
    }
  }
}
void draw(){
  background(255);
  stroke(0);
  drawGrid();
  strokeWeight(3);
  for(int i = 0; i < s; i++){
    line(3*i*cellSize, 0, 3*i*cellSize, height);
    line(0, 3*i*cellSize, width, 3*i*cellSize);
  }
}
void mousePressed(){
  selectedCol = mouseX / cellSize;
  selectedRow = mouseY / cellSize;
}
void keyPressed(){
  if(key >= '1' && key <= '9'){
    int val = key - '0';
    if(isSafe(SudokuBoard, selectedRow, selectedCol, val)){
      SudokuBoard[selectedRow][selectedCol] = val;
    }
  }else if(key == BACKSPACE || key == DELETE){
    SudokuBoard[selectedRow][selectedCol] = 0;
  }
}
boolean isSafe(int[][] num, int row, int col, int val){
  for(int x = 0; x < s*s; x++){
    if(num[row][x] == val || num[x][col] == val) return false;
  }
  int startRow = row - (row % 3);
  int startCol = col - (col % 3);
  for(int i = 0; i < s; i++){
    for(int j = 0; j < s; j++){
      if(num[i + startRow][j + startCol] == val) return false;
    }
  }
  return true;
}
