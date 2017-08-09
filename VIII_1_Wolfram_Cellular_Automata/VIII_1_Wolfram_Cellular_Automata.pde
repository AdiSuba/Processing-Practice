CA ca;

void setup() {
  size(620, 480);
  ca = new CA(90);
  background(255);
  frameRate(30);
}

void draw() {  
  //background(255);
  ca.generate();
  ca.display();
}