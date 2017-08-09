Mover m;

void setup() {
  size(600, 400);
  m = new Mover();
}

void draw() {
  background(200);
  
  PVector gravity = new PVector(0, 1);
  PVector normal = gravity.copy();
  gravity.mult(m.mass);
  m.applyForce(gravity);
  
  normal = normal.mult(-1);
  m.applyForce(gravity.mult(-1));
  
  if(mousePressed) {
    PVector wind = new PVector(0.5, 0);
    m.applyForce(wind);
  }
  
  PVector friction = m.vel.get();
  friction.normalize();
  float c = -0.1;
  friction.limit(c*normal.mag());
  m.applyForce(friction);
  
  m.update();
  m.edges();
  m.display();

}