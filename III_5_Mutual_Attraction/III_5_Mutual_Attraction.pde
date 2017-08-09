Mover m;
Mover a;

void setup() {
  size(600, 400);
  m = new Mover();
  a = new Mover(100);
}

void draw() {
  background(200);
  
  PVector gravity = a.attract(m);
  m.applyForce(gravity);
  
  gravity = m.attract(a);
  a.applyForce(gravity);
  
  a.update();
  a.display();
  
  m.update();
  m.display();
}