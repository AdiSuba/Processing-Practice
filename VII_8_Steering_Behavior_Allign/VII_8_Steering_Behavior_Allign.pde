ArrayList<Vehicle> vehicles;
int i = 0;

void setup() {
  size(640, 480);
  vehicles = new ArrayList<Vehicle>();
}

void draw() {  
  background(255);
  
  if (mousePressed) {
    if(i%5 == 0)vehicles.add(new Vehicle(mouseX, mouseY));
    i++;
  }
  for(Vehicle v: vehicles) {
    v.allign(vehicles);
    v.update();
    v.borders();
    v.display();
  }
}