Mover m;

void setup() {
  size(600, 400);
  m = new Mover();
}

void draw() {
  background(200);
  
  PVector gravity = new PVector(0, 1);
  gravity.mult(m.mass);
  m.applyForce(gravity);
  
  PVector wind = new PVector(0.5, 0);
  m.applyForce(wind);
  
  if(mousePressed) {
    PVector drag = m.vel.get();
    drag.normalize();
    float c = -0.01;
    float speed = m.vel.mag();
    
    drag.mult(c*speed*speed); 
    m.applyForce(drag);
  }
  m.update();
  m.edges();
  m.display();

}