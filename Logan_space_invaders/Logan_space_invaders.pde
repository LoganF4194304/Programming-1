int spaceshipX;
int bulletX = spaceshipX;
int bulletY = 28;
int[] alienX = {30, 90, 150, 210, 270, 330};
int[] alienY = {40, 80, 120, 160};
int score = 0;
boolean isFired = false;
boolean[] isAlive = {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true};
PImage alien;
void setup(){
  size(400, 500);
  color(0, 0, 0);
  spaceshipX = width/2;
  alien = loadImage("Alien_Space_Invaders.png");
}
void draw(){
  background(0);
  fill(0, 255, 0);
  rect(spaceshipX - 20, height - 28, 40, 20);
  noFill();
  stroke(255, 255, 255);
  rect(8, 24, 400 - 16, 500 - 32);
  fill(255, 255, 255);
  for(int j = 0; j < 4; j++){
    for(int i = 0; i < 6; i++){
      if(isAlive[4 * j + i]){
        image(alien, alienX[i], alienY[j], 40, 40);
      }
    }
  }
  if(isFired){
    fill(255, 0, 0);
    rect(bulletX - 2, bulletY - 10, 4, 20);
    bulletY -= 10;
    if(bulletY < 28){
      isFired = false;
      bulletY = -20;
      bulletX = -20;
    }
    for(int i = 0; i < 24; i++){
      if(isAlive[i]){
        if(bulletX > alienX[i % 6] && bulletX < alienX[i % 6] + 40 && bulletY > alienY[floor(i / 6)] && bulletY < alienY[floor(i / 6)] + 40){
          isAlive[i] = false;
          isFired = false;
          score += 1;
        }
      }
    }
  }
  textSize(16);
  text("SCORE:" + score, 0, 16);
}
void keyPressed(){
  if(keyCode == LEFT && spaceshipX > 28){
    spaceshipX -= 4;
  }else if(keyCode == RIGHT && spaceshipX < width - 28){
    spaceshipX += 4;
  }else if(keyCode == UP && !isFired || key == ' ' && !isFired){
    bulletY = height - 28;
    bulletX = spaceshipX;
    isFired = true;
  }
}
