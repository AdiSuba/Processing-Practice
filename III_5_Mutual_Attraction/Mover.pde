class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  
  Mover() {
    pos = new PVector(width/2, height/4);
    vel = new PVector(0.5, 0);
    acc = new PVector(0, 0);
    mass = 10;
  }
  
  Mover(float weight) {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = weight;
  }
  
  PVector attract(Mover m) {
    float G = 1;
    
    PVector force = PVector.sub(pos, m.pos);
    float dsq = force.magSq(); 
    force.normalize();
    
    float strength = (G * mass * m.mass) / dsq;
    force.mult(strength);
    
    return force;
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
    stroke(2);
    if(mass > 50) {
      fill(50);
      ellipse(pos.x, pos.y, mass/10, mass/10);
    }
    else {
      fill(150);
      ellipse(pos.x, pos.y, mass*2, mass*2);
    }
  }
}