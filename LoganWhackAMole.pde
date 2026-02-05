int s = 4;
int time = 120;
float[] xPosition = new float[s*s];
float[] yPosition = new float[s*s];
boolean[] isMoleUp = new boolean[s*s];
int score = 0;
int screen = 500 - (500 % s);
void setup(){
  int index = 0;
  size(500, 500);
  windowResize(screen, screen);
  for(int row = 1; row <= s; row++){
    for(int col = 1; col <= s; col++){
      xPosition[index] = (screen / (s + 0.5)) * col;
      yPosition[index] = (screen / (s + 0.5)) * row;
      isMoleUp[index] = false;
      index++;
    }
  }
}
void draw(){
  background(0, 200, 0);
  fill(255);
  textSize(20);
  text("score: " + score, 0, 20);
  if(floor(frameCount % (100/s/s)) == 0){
    int randomIdx = (int)random(s*s);
    isMoleUp[randomIdx] = !isMoleUp[randomIdx];
  }
  for(int i = 0; i < s*s; i++){
    fill(128, 64, 0);
    ellipse(xPosition[i] - screen/s/4, yPosition[i] - screen/s/4, screen/s/2, screen/s/4);
    if(isMoleUp[i]){
      fill(128, 0, 0);
      rect(xPosition[i] - 3*screen/s/8, yPosition[i] - screen/s/2, screen/s/4, screen/s/4);
      ellipse(xPosition[i] - screen/s/4, yPosition[i] - screen/s/2, screen/s/4, screen/s/4);
      fill(200);
      circle(xPosition[i] - screen/s/4 + screen/s/24, yPosition[i] - screen/s/2 - screen/s/32, screen/s/16);
      circle(xPosition[i] - screen/s/4 - screen/s/24, yPosition[i] - screen/s/2 - screen/s/32, screen/s/16);
    }
  }
}
void mousePressed(){
  for(int i = 0; i < s*s; i++){
    if(mouseX < xPosition[i] - 1*screen/s/8 && mouseX > xPosition[i] - 3*screen/s/8 && mouseY < yPosition[i] - 1*screen/s/4 && mouseY > yPosition[i] - screen/s/2){
      if(isMoleUp[i]){
        isMoleUp[i] = !isMoleUp[i];
        score += 1;
      }
    }
  }
}
