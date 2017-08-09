ArrayList<ParticleSystem> ps;

void setup() {
  size(600, 400);
  ps = new ArrayList<ParticleSystem>();
}

void mousePressed() {
  ps.add(new ParticleSystem(new PVector(mouseX, mouseY)));
}
void draw() {
  background(200);
  println(frameRate);
  for (ParticleSystem p : ps) {
    PVector grav = new PVector(0, 0.5);
    p.applyForce(grav);
    if(keyPressed) {
      PVector wind = new PVector(0.3, 0);
      p.applyForce(wind);
    }
    p.update();
    p.display();
  }
}