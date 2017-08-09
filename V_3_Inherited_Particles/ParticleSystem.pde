class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  PVector force;
  
  ParticleSystem() {
    particles = new ArrayList<Particle>();
    origin = new PVector(width/2, height/4);
    force = new PVector(0, 0);
  }
  
  ParticleSystem(PVector origin) {
    particles = new ArrayList<Particle>();
    this.origin = origin.copy();    
    force = new PVector(0, 0);
  }
  
  void addParticle() {
    if(random(1) < 0.5) particles.add(new SquareParticle(origin));
    else particles.add(new Particle(origin));
  }
  
  void applyForce(PVector force) {
    this.force.add(force);
  }
  
  void update() {
    addParticle();
    for(int i = particles.size() - 1; i >= 0 ; i--) {
      Particle p = particles.get(i);
      p.applyForce(force);
      p.update();
      if(p.isDead()) particles.remove(p); 
    }
    force.mult(0);
  }
  
  void display() {
    for(Particle p : particles) {
      p.display();
    }
  }
}