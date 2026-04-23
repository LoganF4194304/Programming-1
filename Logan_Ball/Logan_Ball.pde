Ball basketball;
void setup(){
  size(400, 400);
  basketball = new Ball(width/2, height/2, PI/4, 50, 10);
}
void draw(){
  background(255);
  color(0, 255, 0);
  basketball.display();
}
