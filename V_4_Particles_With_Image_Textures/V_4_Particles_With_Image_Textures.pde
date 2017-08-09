ArrayList<ParticleSystem> ps;
float strength;
PImage img;

void setup() {
  size(600, 400, P2D);
  strength = width/2;
  ps = new ArrayList<ParticleSystem>();
  img = loadImage("texture1.png");
  for(int i = - 3; i < 4; i++) { 
    ps.add(new ParticleSystem(new PVector(width*(i+5)/12, 4*height/5), img));
  }
}

void draw() {
  background(0);
  println(frameRate);
  for (ParticleSystem p : ps) {
    PVector grav = new PVector(0, -1);
    p.applyForce(grav);
    if(mousePressed) {
      strength = mouseX;
      if(strength < 4 * width/10) strength =  4 * width/10;
      else if(strength > 6 * width/10) strength = 6 * width/10;
    }
    PVector wind = new PVector((strength - width/2)/50, 0);
    p.applyForce(wind);
    stroke(150);
    line(width/2, height/10, strength, height/10);
    ellipse(strength, height/10, 5, 5);
    p.update();
    p.display();
  }
}