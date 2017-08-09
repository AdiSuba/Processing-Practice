class Vehicle {
  PVector pos;
  PVector vel;
  PVector acc;
  float r;
  float maxspeed;
  float maxforce;
  
  Vehicle(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    r = 50;
    maxspeed = 4;
    maxforce = 1;
  }
  
  Vehicle(float x, float y, float vx, float vy) {
    pos = new PVector(x, y);
    vel = new PVector(vx, vy);
    acc = new PVector(0, 0);
    r = 50;
    maxspeed = 4;
    maxforce = 1;
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
    desired.limit(maxspeed);
    if(dist(target.x, target.y, pos.x, pos.y) < 30) {
      desired.limit(dist(target.x, target.y, pos.x, pos.y)/5);
    }
    
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    
    applyForce(steer);
  }
  
  void seperate(ArrayList<Vehicle> vehicles) {
    float desiredSeperation = r*2;
    PVector sum = new PVector();
    int count = 0;
    for(Vehicle other : vehicles) {
      float d = PVector.dist(pos, other.pos);
      if(d > 0 && d < desiredSeperation) {
        PVector diff = PVector.sub(pos, other.pos);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count++;
      }
    }
    if(count > 0) {
      sum.setMag(maxspeed);
      PVector steer = PVector.sub(sum, vel);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }
  
  void applyForce(PVector force) {
    acc = acc.add(force);
  }
  
  void borders() {
    if (pos.x < -r) pos.x = width+r;
    if (pos.y < -r) pos.y = height+r;
    if (pos.x > width+r) pos.x = -r;
    if (pos.y > height+r) pos.y = -r;
  }
  
  void display() {
    float theta = vel.heading2D() + PI/2;
    fill(127,20,20);
    stroke(0);
    strokeWeight(1);
    ellipse(pos.x, pos.y, r*2, r*2);
   
  }
}