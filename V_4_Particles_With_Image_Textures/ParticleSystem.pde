class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  PVector force;
  PImage img;
  
  ParticleSystem(PVector origin, PImage img) {
    particles = new ArrayList<Particle>();
    this.origin = origin.copy();    
    force = new PVector(0, 0);
    this.img = img;
  }
  
  void addParticle() {
    particles.add(new  Particle(origin, img));
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