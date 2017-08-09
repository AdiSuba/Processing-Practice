class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float t1, t2;
  
  Mover() {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    t1 = random(1000);
    t2 = random(1000); 
  }
  
  void update() {
    float ax = noise(t1);
    ax = map(ax, 0, 1, -0.1, 0.1);
    
    float ay = noise(t2);
    ay = map(ay, 0, 1, -0.1, 0.1);
    
    acc = new PVector(ax, ay);
    t1 += 0.01;
    t2 += 0.01;
    
    vel.add(acc);
    pos.add(vel);
    vel.limit(8);
  }
  
  void edges() {
    if(pos.x > width) pos.x = 0;
    if(pos.x < 0) pos.x = width;
    if(pos.y > height) pos.y = 0;
    if(pos.y < 0) pos.y = height;
  }
  
  void display() {
    fill(150);
    stroke(2);
    ellipse(pos.x, pos.y, 36, 36);
  }
}