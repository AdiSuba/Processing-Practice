Pendulum p1, p2, p3;

void setup() {
  size(600, 400);
  p1 = new Pendulum(150);
  p2 = new Pendulum(120);
  p3 = new Pendulum(80);
}

void draw() {
  background(200);
  p1.update();
  p1.display();
  p2.moveBeggining(p1.getEnd());
  p2.update(p1.angAcc);
  p2.display();
  p3.moveBeggining(p2.getEnd());
  p3.update(p2.angAcc);
  p3.display();
}