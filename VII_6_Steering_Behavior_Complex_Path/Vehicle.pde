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
    maxspeed = random(2, 4);
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
  
  void pursue(Vehicle target) {
    PVector desired = PVector.sub(PVector.add(target.pos, target.vel), pos);
    desired.normalize();
    desired.mult(maxspeed);
  }
  
  void follow(Path p) {
    PVector predict = vel.get();
    predict.setMag(50);
    PVector predictPos = PVector.add(pos, predict);
    PVector a = p.start;
    PVector b = p.end;
    PVector normalPoint = getNormalPoint(predictPos, a, b);
    PVector dir = PVector.sub(b, a);
    dir.normalize();
    dir.mult(10);
    
    PVector target = PVector.add(normalPoint, dir);
    float distance = PVector.dist(predictPos, normalPoint);
    
    if(distance > p.radius) {
      fill(180, 20, 20);
      seek(target);
    }
    
    if (debug) {
      fill(0);
      stroke(0);
      line(pos.x, pos.y, pos.x, pos.y);
      ellipse(predictPos.x, predictPos.y, 4, 4);

      // Draw normal position
      fill(0);
      stroke(0);
      line(predictPos.x, predictPos.y, normalPoint.x, normalPoint.y);
      ellipse(normalPoint.x, normalPoint.y, 4, 4);
      stroke(0);
      if (distance > p.radius) fill(255, 0, 0);
      noStroke();
      ellipse(target.x+dir.x, target.y+dir.y, 8, 8);
      } 
  }
  
  void follow(ComplexPath cp) {
    follow(cp.getPath(pos.x+sgn(vel.x)*50));    
  }
  
  PVector getNormalPoint(PVector p, PVector a, PVector b) {
    PVector ap = PVector.sub(p, a);
    PVector ab = PVector.sub(b, a);
    ab.normalize();
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(a, ab);
    return normalPoint;
  }
  
  void applyForce(PVector force) {
    acc = acc.add(force);
  }
  
  void borders(Path p) {
    if (pos.x > p.end.x + r) {
      pos.x = p.start.x - r;
      pos.y = p.start.y + (pos.y-p.end.y);
    }
  }
  
  void borders(ComplexPath cp) {
    Path p1 = cp.getPath(0);
    Path p2 = cp.getPath(width);
    if (pos.x > p2.end.x + r) {
      pos.x = p1.start.x - r;
      pos.y = p1.start.y + (pos.y - p2.end.y);
    }
    if (pos.x < p1.start.x - r) {
      pos.x = p2.end.x + r;
      pos.y = p2.end.y + (pos.y - p1.start.y);
    }
  }
  
  void display() {
    float theta = vel.heading2D() + PI/2;
    fill(155);
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