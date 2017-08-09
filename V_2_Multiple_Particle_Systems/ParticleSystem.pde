class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem() {
    particles = new ArrayList<Particle>();
    origin = new PVector(width/2, height/4);
  }
  
  ParticleSystem(PVector origin) {
    particles = new ArrayList<Particle>();
    this.origin = origin.copy();
  }
  
  void addParticle() {
    particles.add(new Particle(origin));
  }
  
  void update() {
    addParticle();
    for(Particle p : particles) {
      PVector grav = new PVector(0, 0.5);
      p.applyForce(grav);
      p.update();
    }
  }
  
  void display() {
    for(Particle p : particles) {
      p.display();
    }
  }
}