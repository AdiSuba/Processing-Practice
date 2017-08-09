ArrayList<Vehicle> vehicles;
int i = 0;

void setup() {
  size(620, 480);
  vehicles = new ArrayList<Vehicle>();
}

void draw() {  
  background(255);
  
  if (mousePressed) {
    if(i%5 == 0)vehicles.add(new Vehicle(mouseX, mouseY));
    i++;
  }
  for(Vehicle v: vehicles) {
    v.applyBehavior(vehicles);
    v.update();
    v.borders();
    v.display();
  }
}