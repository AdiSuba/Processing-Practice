import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;
ArrayList<Boundary> boundaries;

Box2DProcessing box2d;

void setup() {
  size(640,480);
  smooth();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();
  for(int i = 0; i < 15; i+=random(10)) {
    Boundary b = new Boundary(random(60, 580), random(240, 460));
    boundaries.add(b);
  }
}

void draw() {
  background(255);
  box2d.step();
  
  if (mousePressed) {
    Box p = new Box(mouseX,mouseY);
    boxes.add(p);
  }
  for (Box b: boxes) {
    b.display();
  }
  for (Boundary g: boundaries) {
    g.display();
  }
}