int playerX = 0;
int playerY = 0;
int mazeSize = 10;
int goalX = mazeSize;
int goalY = mazeSize;
boolean gameWon = false;
int origin;
void setup(){
  size(400, 400);
  textSize(20);
  fill(0);
  stroke(0, 255, 0);
  textAlign(CENTER, CENTER);
}
void draw(){
  for(int i = 0; i < mazeSize; i++){
    for(int j = 0; j < mazeSize; j++){
      rect(i * (width / mazeSize), j * (width / mazeSize), width / mazeSize, width / mazeSize);
    }
  }
  fill(255);
  rect(playerX * width / mazeSize, playerY * width / mazeSize, width / mazeSize, width / mazeSize);
  fill(0, 255, 0);
  rect((goalX - 1) * width / mazeSize, (goalY - 1) * width / mazeSize, width / mazeSize, width / mazeSize);
  fill(0);
  if(gameWon){
    fill(255);
    text("YOU WIN", width / 2, width / 2);
    fill(0);
  }
}
void keyPressed(){
  if(key == 'w' || keyCode == UP){
    if(playerY > 0){
      playerY--;
    }
  }else if(key == 'a' || keyCode == LEFT){
    if(playerX > 0){
      playerX--;
    }
  }else if(key == 's' || keyCode == DOWN){
    if(playerY < mazeSize - 1){
      playerY++;
    }
  }else if(key == 'd' || keyCode == RIGHT){
    if(playerX < mazeSize - 1){
      playerX++;
    }
  }
  if(playerX == goalX - 1 && playerY == goalY - 1){
    gameWon = true;
  }else{
    gameWon = false;
  }
}
