class Ball{
  float x, y, Vx, Vy, Size;
  Ball(float startX, float startY, float startAngle, float speed, float Radius){
    x = startX;
    y = startY;
    Size = Radius;
    Vx = speed*cos(startAngle);
    Vy = -speed*sin(startAngle);
  }
  void display(){
    x += Vx/2;
    y += Vy/2;
    Vy += 1;
    if(y <= 0){
      Vy = abs(Vy)/1.1+0.1;
      Vx /= 1.01;
    }
    if(y >= height){
      Vy = -abs(Vy)/1.1-0.1;
      Vx /= 1.01;
    }
    if(x >= width || x <= 0){
      Vx = -Vx/1.01;
    }
    circle(x, y, Size);
  }
}
