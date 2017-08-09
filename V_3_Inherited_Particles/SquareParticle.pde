class SquareParticle extends Particle {
  
  SquareParticle() {
   super();
  }
  
  SquareParticle(float mass) {
    super(mass);
  }
  
  SquareParticle(PVector pos) {
    super(pos);
  }
  
   void display() {
    stroke(2, lifespan);
    fill(150, lifespan);
    rectMode(CENTER);
    rect(pos.x, pos.y, 10, 10);
  }  
}