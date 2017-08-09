ArrayList<Vehicle> vehicles;
int i = 0;
Path p;
boolean debug = true;

void setup() {
  size(620, 480);
  vehicles = new ArrayList<Vehicle>();
  p = new Path();
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
  
  if(debug) p.display();
  
  for(Vehicle v: vehicles) {
    v.follow(p);
    v.update();
    v.borders(p);
    v.display();
  }
}