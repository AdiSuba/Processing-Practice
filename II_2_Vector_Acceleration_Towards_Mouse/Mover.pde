class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  
  Mover() {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
  }
  
  void update() {
    acc = new PVector(mouseX, mouseY);
    acc.sub(pos);
    acc.setMag(1.5);
    vel.add(acc);
    pos.add(vel);
    vel.limit(10);
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