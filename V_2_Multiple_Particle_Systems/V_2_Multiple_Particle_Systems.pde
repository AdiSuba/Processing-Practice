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
  for (ParticleSystem p : ps){
    p.update();
    p.display();
  }
}