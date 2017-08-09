ArrayList<Particle> particles;

void setup() {
  size(600, 400);
  particles = new ArrayList<Particle>();
}

void draw() {
  background(200);
  particles.add(new Particle());
  for(Particle p : particles) {
    PVector grav = new PVector(0, 0.5);
    p.applyForce(grav);
    p.update();
    p.display();
  }
  if(particles.get(0).isDead()) {
    particles.remove(0);
  }
  println(frameRate);
}