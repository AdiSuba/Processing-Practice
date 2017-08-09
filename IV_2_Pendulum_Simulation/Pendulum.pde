class Pendulum {
  PVector beg;
  
  float r;
  float ang;
  float angVel;
  float angAcc;
  //float mass;
  
  Pendulum() {
    beg = new PVector(width/2, 0);
    r = 180;
    ang = -PI/3;
    angVel = 0;
    angAcc = 0;
  }
  
  Pendulum(float r) {
    beg = new PVector(width/2, 0);
    this.r = r;
    ang = -PI/3;
    angVel = 0;
    angAcc = 0;
  }
  
  void moveBeggining(PVector beg) {
    this.beg = beg.copy();
  }
  
  void update() {
    float gravity = 0.8, damping = 0.991;
    angAcc = (-gravity/r)*sin(ang);
    angVel += angAcc;
    angVel *= damping;
    ang += angVel;
  }
  
   void update(float angAcc1) {
    float gravity = 0.8, damping = 0.991;
    angAcc = angAcc1 + (-gravity/r)*sin(ang);
    angVel += angAcc;
    angVel *= damping;
    ang += angVel;
  }
  
  PVector getEnd() {
    return new PVector(beg.x + r*sin(ang), beg.y + r*cos(ang));
  }
  
  void display() {  
    fill(150);
    PVector end = getEnd();
    line(beg.x, beg.y, end.x, end.y);
    ellipse(end.x, end.y, 36, 36);
  }
}