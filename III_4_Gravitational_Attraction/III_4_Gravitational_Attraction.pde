Mover m;
Attractor a;

void setup() {
  size(600, 400);
  m = new Mover();
  a = new Attractor();
}

void draw() {
  background(200);
  
  PVector gravity = a.attract(m);
  m.applyForce(gravity);
  a.display();
  
  m.update();
  m.display();
}