class Attractor {
  PVector pos;
  float mass, G;
  
  Attractor() {
    pos = new PVector(width/2, height/2);
    mass = 100;
    G = 1;
  }
  
  PVector attract(Mover m) {    
    PVector force = PVector.sub(pos, m.pos);
    float dsq = force.magSq(); 
    force.normalize();
    
    float strength = (G * mass * m.mass) / dsq;
    force.mult(strength);
    
    return force;
  }
  
  void display() {
    fill(50);
    stroke(2);
    ellipse(pos.x, pos.y, mass/10, mass/10);
  }
}