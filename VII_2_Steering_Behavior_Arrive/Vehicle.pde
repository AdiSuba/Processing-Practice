class Vehicle {
  PVector pos;
  PVector vel;
  PVector acc;
  float r;
  float maxspeed;
  float maxforce;
  
  Vehicle(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 4);
    acc = new PVector(0, 0);
    r = 6;
    maxspeed = 4;
    maxforce = 0.1;
  }
  
  Vehicle(float x, float y, float vx, float vy) {
    pos = new PVector(x, y);
    vel = new PVector(vx, vy);
    acc = new PVector(0, 0);
    r = 6;
    maxspeed = 4;
    maxforce = 0.1;
  }
  
  void update() {
    vel = vel.add(acc);
    vel.limit(maxspeed);
    pos = pos.add(vel);
    acc.mult(0);
  }
  
  void seek(PVector target) {
    PVector desired = PVector.sub(target, pos);
    desired.normalize();
    desired.mult(maxspeed);
    if(dist(target.x, target.y, pos.x, pos.y) < 100) {
      desired.limit(dist(target.x, target.y, pos.x, pos.y)*maxspeed/100);
    }
    
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    
    applyForce(steer);
  }
  
  void arrive(PVector target) {

  }
  
  void applyForce(PVector force) {
    acc = acc.add(force);
  }
  
  void display() {
    float theta = vel.heading2D() + PI/2;
    fill(127,20,20);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
}