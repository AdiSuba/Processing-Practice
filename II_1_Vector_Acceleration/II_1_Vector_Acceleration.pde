Mover m;

void setup() {
  size(600, 400);
  m = new Mover();
}

void draw() {
  background(200);
  m.update();
  m.edges();
  m.display();
}