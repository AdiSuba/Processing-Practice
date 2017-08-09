ArrayList<Vehicle> vehicles;
PVector target;
int i = 0;

void setup() {
  size(620, 480);
  vehicles = new ArrayList<Vehicle>();
  target = new PVector(width/2, height/2);
  
}

void draw() {  
  background(255);
  
  fill(200);
  ellipse(target.x, target.y, 20, 20);
  if (mousePressed) {
    if(i%5 == 0)vehicles.add(new Vehicle(mouseX, mouseY));
    i++;
  }
  for(Vehicle v: vehicles) {
    v.seek(target);
    v.arrive(target);
    v.update();
    v.display();
  }
}