float x, y;
void setup(){
  size(256,256);
  x = width/2;
  y = width/2;
}
void mousePressed(){
  x = mouseX;
  y = mouseY;
}
void draw(){
  color(0,255,0);
  ellipse(x, y, 10, 10);
}
