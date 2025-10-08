PFont title;
PImage type;
PImage pokemon;
PImage description;
String name = "Mega Rayquaza Ex";
void setup(){
  size(384, 512);
  background(0, 192, 0);
  pokemon = loadImage("Rayquaza.jpg");
  type = loadImage("dragon type symbol.png");
  description = loadImage("rayquaza description.jpg");
}
void draw(){
  textSize(20);
  image(pokemon, 20, 20, 344, 300);
  image(type, -7, 0, 40, 20);
  image(description, 144, 464, 240, 48);
  text(name, 24, 17);
  text("Celestial Roar                999 damage", 25, 320);
  text("Dragon Pulse                1000 damage", 25, 400);
  text("        enemy pokemon is dead", 25, 440);
  
}
