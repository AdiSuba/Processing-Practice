class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  
  Mover() {
    pos = new PVector(random(width), height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = random(1, 2);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }
  
  void edges() {
    if(pos.x > width || pos.x < 0) vel.x = -vel.x;
    if(pos.y > height || pos.y < 0) vel.y = -vel.y;
  }
  
  void display() {
    fill(150);
    stroke(2);
    ellipse(pos.x, pos.y, mass*20, mass*20);
  }
}