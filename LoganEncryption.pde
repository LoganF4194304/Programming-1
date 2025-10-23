String message = "the nimble fox jumped over the lazy dog";
int key = 6;
String encrypted = "";
void setup(){
  size(256, 256);
  background(0, 255, 255);
  encrypted = encrypt(message, key);
  fill(0000);
  text("Original: " + message, 5, 80);
  text("Encripted: " + encrypted, 5, 120);
}
String encrypt(String text, int shift){
  String result = "";
  for(int i = 0; i < text.length(); i++){
    char c = text.charAt(i);
    c = (char)(((c + shift) % 26) + 104);
    result += c;
  }
  return result;
}
