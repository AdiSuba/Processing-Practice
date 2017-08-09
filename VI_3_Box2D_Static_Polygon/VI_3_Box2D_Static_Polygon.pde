import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;
Surface s;

Box2DProcessing box2d;

void setup() {
  size(640,480);
  smooth();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  s = new Surface();
  boxes = new ArrayList<Box>();

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
  s.display();
}