String scene = "start";
String option1;
String option2;
String narration;
boolean end = false;
void setup(){
  size(350, 400);
  textAlign(CENTER, CENTER);
  textSize(12);
}
void draw(){
  background(0, 0, 128);
  if(scene == "start"){
    narration = "this test is 100% of your grade. choose your questions";
    option1 = "prove 1 + 1 = 2";
    option2 = "find 2^2^2^2";
  }else if(scene == "prove 1 + 1 = 2"){
    narration = "you realize 1 + 1 = 2 is a 100 page proof.   GAME OVER";
    end = true;
  }else if(scene == "find 2^2^2^2"){
    narration = "you can clearly see that 2^2^2^2 is obviously 65536. next question:";
    option1 = "say 100 digits of e";
    option2 = "prove pythagoras";
  }else if(scene == "say 100 digits of e"){
    narration = "you say: '100 digits of e'    YOU WIN!";
    option1 = "";
    option2 = "";
    end = true;
  }else if(scene == "prove pythagoras"){
    narration = "you realize that pythagoras is not a theorem.   TEST FAILED";
    end = true;
  }
  if(end == false){
  drawScene(narration, option1, option2);
  }else{
    drawEnd(narration);
  }
}
void drawScene(String story, String optionA, String optionB){
  fill(255);
  text(story, width/2, 100);
  fill(200);
  rect(50, 210, 100, 40, 10);
  rect(200, 210, 100, 40, 10);
  rect(300, 0, 50, 50, 16);
  fill(0);
  text(optionA, 100, 225);
  text(optionB, 250, 225);
  text("redo", 325, 25);
}
void drawEnd(String story){
  fill(255);
  text(story, width/2, 100);
  text("(space to restart)", width/2, height/2 + 80);
}
void keyPressed(){
  if(keyCode == LEFT && end == false){
    scene = option1;
  }else if(keyCode == RIGHT && end == false){
    scene = option2;
  }else if(key == ' ' && end == true){
    scene = "start";
    end = false;
  }else if(key == 'r'){
    scene = "start";
    end = false;
  }
}
void mousePressed(){
  if(end == true){
    scene = "start";
    end = false;
  }else if(50 < mouseX && mouseX < 150 && 210 < mouseY && mouseY < 250){
    scene = option1;
  }else if(200 < mouseX && mouseX < 300 && 210 < mouseY && mouseY < 250){
    scene = option2;
  }else if(mouseX > 300 && mouseY < 50){
    scene = "start";
    end = false;
  }
}
