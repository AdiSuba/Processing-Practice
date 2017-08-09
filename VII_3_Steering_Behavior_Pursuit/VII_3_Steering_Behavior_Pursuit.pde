ArrayList<Vehicle> vehicles;
Vehicle target;
int i = 0;
float t1 = 0;
float t2 = 1000;

void setup() {
  size(620, 480);
  vehicles = new ArrayList<Vehicle>();
  target = new Vehicle(width/2, height/2);
  
}

void draw() {  
  background(255);
  float x = noise(t1);
  x = map(x, 0, 1, 0, width);
  
  float y = noise(t2);
  y = map(y, 0, 1, 0, height);
  
  t1 += 0.007;
  t2 += 0.007;
  
  println(x);
  
  fill(200, 20, 20);
  ellipse(x, y, 5, 5);
  
  if (mousePressed) {
    if(i%5 == 0)vehicles.add(new Vehicle(mouseX, mouseY));
    i++;
  }
  for(Vehicle v: vehicles) {
    v.pursue(target);
    v.update();
    v.display();
  }
  target.seek(new PVector(x, y));
  target.update();
  target.display();
}