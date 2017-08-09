ArrayList<Vehicle> vehicles;
FlowField flow;
int i = 0;
boolean displayFlow = true;

void setup() {
  size(620, 480);
  vehicles = new ArrayList<Vehicle>();
  flow = new FlowField(10);
}

void keyPressed() {
  displayFlow = !displayFlow;
}

void draw() {  
  background(255);
  flow.init();
  if(displayFlow) flow.display();
  
  if (mousePressed) {
    if(i%10 == 0)vehicles.add(new Vehicle(mouseX, mouseY));
    i++;
  }
  for(Vehicle v: vehicles) {
    v.follow(flow);
    v.update();
    v.borders();
    v.display();
  }
}