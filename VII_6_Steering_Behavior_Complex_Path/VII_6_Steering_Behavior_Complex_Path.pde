ArrayList<Vehicle> vehicles;
int i = 0;
Path p;
ComplexPath cp;
boolean debug = true;

void setup() {
  size(620, 480);
  vehicles = new ArrayList<Vehicle>();
  p = new Path();
  cp = new ComplexPath();
}

  
int sgn(float f) {
  if (f >= 0) return 1;
  return -1;
} 

void keyPressed() {
  debug = !debug;
}

void draw() {  
  background(255);
  
  if (mousePressed) {
    if(i%10 == 0)vehicles.add(new Vehicle(mouseX, mouseY));
    i++;
  }
  
  if(debug) cp.display();
  
  for(Vehicle v: vehicles) {
    v.follow(cp);
    v.update();
    v.borders(cp);
    v.display();
  }
}