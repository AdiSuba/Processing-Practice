class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  
  float lifespan = 255;
  
  Particle() {
    pos = new PVector(width/2, height/4);
    vel = new PVector(random(-1, 1), random(-3, 3));
    acc = new PVector(0, 0);
    mass = 10;
  }
  
  Particle(float mass) {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    this.mass = mass;
  }
  
  Particle(PVector pos) {
    this.pos = new PVector();
    this.pos = pos.copy();
    vel = new PVector(0, random(-1, 1));
    acc = new PVector(0, 0);
    mass = 10;
  }
  
  PVector attract(Particle p) {
    float G = 1;
    PVector force = PVector.sub(pos, p.pos);
    float dsq = force.magSq(); 
    force.normalize();
    
    float strength = (G * mass * p.mass) / dsq;
    force.mult(strength);
    
    return force;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }
  
  boolean isDead() {
    return (particles.get(0).lifespan <= 0);
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    lifespan -= 2;
  }
  
  void edges() {
    if(pos.x > width || pos.x < 0) vel.x = -vel.x;
    if(pos.y > height || pos.y < 0) vel.y = -vel.y;
  }
  
  void display() {
    stroke(2, lifespan);
    fill(150, lifespan);
    ellipse(pos.x, pos.y, 10, 10);
  }
}