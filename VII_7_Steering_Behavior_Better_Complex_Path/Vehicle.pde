class Vehicle {
  PVector pos;
  PVector vel;
  PVector acc;
  float r;
  float maxspeed;
  float maxforce;
  
  Vehicle(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(4, 0);
    acc = new PVector(0, 0);
    r = 6;
    maxspeed = random(2, 8);
    maxforce = 0.1;
  }
  
  Vehicle(float x, float y, float vx, float vy) {
    pos = new PVector(x, y);
    vel = new PVector(vx, vy);
    acc = new PVector(0, 0);
    r = 6;
    maxspeed = 4;
    maxforce = 0.1;
  }
  
  void update() {
    vel = vel.add(acc);
    vel.limit(maxspeed);
    pos = pos.add(vel);
    acc.mult(0);
  }
  
  void seek(PVector target) {
    PVector desired = PVector.sub(target, pos);
    desired.normalize();
    desired.mult(maxspeed);
    if(dist(target.x, target.y, pos.x, pos.y) < 100) {
      desired.limit(dist(target.x, target.y, pos.x, pos.y)*maxspeed/100);
    }
    
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    
    applyForce(steer);
  }
  
  void pursue(Vehicle target) {
    PVector desired = PVector.sub(PVector.add(target.pos, target.vel), pos);
    desired.normalize();
    desired.mult(maxspeed);
  }
  
  // This function implements Craig Reynolds' path following algorithm
  // http://www.red3d.com/cwr/steer/PathFollow.html
  void follow(Path p) {

    // Predict pos 50 (arbitrary choice) frames ahead
    // This could be based on speed 
    PVector predict = vel.get();
    predict.normalize();
    predict.mult(50);
    PVector predictpos = PVector.add(pos, predict);

    // Now we must find the normal to the path from the predicted pos
    // We look at the normal for each line segment and pick out the closest one

    PVector normal = null;
    PVector target = null;
    float worldRecord = 1000000;  // Start with a very high record distance that can easily be beaten

    // Loop through all points of the path
    for (int i = 0; i < p.points.size()-1; i++) {

      // Look at a line segment
      PVector a = p.points.get(i);
      PVector b = p.points.get(i+1);

      // Get the normal point to that line
      PVector normalPoint = getNormalPoint(predictpos, a, b);
      // This only works because we know our path goes from left to right
      // We could have a more sophisticated test to tell if the point is in the line segment or not
      if (normalPoint.x < a.x || normalPoint.x > b.x) {
        // This is something of a hacky solution, but if it's not within the line segment
        // consider the normal to just be the end of the line segment (point b)
        normalPoint = b.get();
      }

      // How far away are we from the path?
      float distance = PVector.dist(predictpos, normalPoint);
      // Did we beat the record and find the closest line segment?
      if (distance < worldRecord) {
        worldRecord = distance;
        // If so the target we want to steer towards is the normal
        normal = normalPoint;

        // Look at the direction of the line segment so we can seek a little bit ahead of the normal
        PVector dir = PVector.sub(b, a);
        dir.normalize();
        // This is an oversimplification
        // Should be based on distance to path & vel
        dir.mult(10);
        target = normalPoint.get();
        target.add(dir);
      }
    }

    // Only if the distance is greater than the path's radius do we bother to steer
    if (worldRecord > p.radius) {
      seek(target);
    }


    // Draw the debugging stuff
    if (debug) {
      // Draw predicted future pos
      stroke(0);
      fill(0);
      line(pos.x, pos.y, predictpos.x, predictpos.y);
      ellipse(predictpos.x, predictpos.y, 4, 4);

      // Draw normal pos
      stroke(0);
      fill(0);
      ellipse(normal.x, normal.y, 4, 4);
      // Draw actual target (red if steering towards it)
      line(predictpos.x, predictpos.y, normal.x, normal.y);
      if (worldRecord > p.radius) fill(255, 0, 0);
      noStroke();
      ellipse(target.x, target.y, 8, 8);
    }


    // Only if the distance is greater than the path's radius do we bother to steer
    if (worldRecord > p.radius) {
      seek(target);
    }
  }

//  void follow(Path p) {
//    PVector predict = vel.get();
//    predict.setMag(50);
//    PVector predictPos = PVector.add(pos, predict);
//    PVector a = p.start;
//    PVector b = p.end;
//    PVector normalPoint = getNormalPoint(predictPos, a, b);
//    PVector dir = PVector.sub(b, a);
//    dir.normalize();
//    dir.mult(10);
    
//    PVector target = PVector.add(normalPoint, dir);
//    float distance = PVector.dist(predictPos, normalPoint);
    
//    if(distance > p.radius) {
//      fill(180, 20, 20);
//      seek(target);
//    }
    
//    if (debug) {
//      fill(0);
//      stroke(0);
//      line(pos.x, pos.y, pos.x, pos.y);
//      ellipse(predictPos.x, predictPos.y, 4, 4);

//      // Draw normal pos
//      fill(0);
//      stroke(0);
//      line(predictPos.x, predictPos.y, normalPoint.x, normalPoint.y);
//      ellipse(normalPoint.x, normalPoint.y, 4, 4);
//      stroke(0);
//      if (distance > p.radius) fill(255, 0, 0);
//      noStroke();
//      ellipse(target.x+dir.x, target.y+dir.y, 8, 8);
//    } 
//  }
  
  PVector getNormalPoint(PVector p, PVector a, PVector b) {
    PVector ap = PVector.sub(p, a);
    PVector ab = PVector.sub(b, a);
    ab.normalize();
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(a, ab);
    return normalPoint;
  }
  
  void applyForce(PVector force) {
    acc = acc.add(force);
  }
  
  void borders(Path p) {
    PVector start = p.points.get(0);
    PVector end = p.points.get(p.points.size() - 1);
    if (pos.x > end.x + 5) {
      pos.x = start.x - 5;
      pos.y = start.y + (pos.y - end.y);
    }
    else if (pos.x < start.x - 5) {
      pos.x = end.x + 5;
      pos.y = end.y + (pos.y - start.y);
    }
  }
  
  void display() {
    float theta = vel.heading2D() + PI/2;
    fill(155);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
}