Walker w;

void setup() {
  size(800, 800);
  frameRate(1000);
  background(255);
  w = new Walker();
}

void draw() {
  w.step();
  w.render();
}