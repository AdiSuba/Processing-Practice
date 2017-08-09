Mover[] m;

void setup() {
  size(600, 400);
  m = new Mover[5];
  m[0] = new Mover();
  m[1] = new Mover(60);
  for(int i = 2; i < m.length; i++) {
    PVector pos = new PVector(i*width/5,  height/2);
    m[i] = new Mover(pos, 20/i);
  }
}

void draw() {
  background(200);
  for(int i = 0; i < m.length; i++) {
    for(int j = 0; j < m.length; j++) {
      if (i != j) {
        PVector gravity = m[j].attract(m[i]);
        m[i].applyForce(gravity);
      }
    }
    println(m[i].pos.x);
    println(m[i].pos.y);
    m[i].update();
    m[i].display();
  }
}