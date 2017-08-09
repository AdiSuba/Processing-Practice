import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;

Box2DProcessing box2d;
boolean start;

void setup() {
  size(640,480);
  smooth();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  start = new Boolean(false);
  boxes = new ArrayList<Box>();
}

void keyPressed() {
  start = !start;
}

void draw() {
  background(255);
  if(start) 
    box2d.step();
  
  if (mousePressed) {
    Box p = new Box(mouseX,mouseY);
    boxes.add(p);
  }
  for (Box b: boxes) {
    b.display();
  }
}