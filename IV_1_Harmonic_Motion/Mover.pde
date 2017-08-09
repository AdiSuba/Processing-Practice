class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float ang;
  float angVel;
  float angAcc;
  float mass;
  
  Mover() {
    pos = new PVector(width/2, height/4);
    vel = new PVector(random(-1, 1), 0);
    acc = new PVector(0, 0);
    mass = 10;
  }
  
  Mover(float mass) {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    this.mass = mass;
  }
  
  Mover(PVector pos, float mass) {
    this.pos = new PVector();
    this.pos = pos.copy();
    vel = new PVector(0, random(-1, 1));
    acc = new PVector(0, 0);
    this.mass = mass;
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
    float r;
    if(mass > 50) {
      fill(50);
      r = mass/10;
    }
    else {      
      fill(150);
      r = mass*2;
    }
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(0);
    ellipse(0, 0, r, r);
    fill(0);
    float endx = 20 * vel.x * abs(sin(pos.x/10) / vel.mag());
    float endy = 20 * vel.y * abs(sin(pos.x)/10) / vel.mag();
    line(0, 0, endx, endy);
    ellipse(endx, endy, 3, 3);
    popMatrix();
  }
}