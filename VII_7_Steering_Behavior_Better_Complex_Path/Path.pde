class Path {
  ArrayList<PVector> points;
  float radius;
  
  Path() {
    radius = 20;
    points = new ArrayList<PVector>();
    for(int i = 0; i <= 5; i++) {
      points.add(new PVector(i*width/5, random(height)));
    }
  }
  
  void display() {
    fill(155);
    stroke(155);
    strokeWeight(0);
    PVector start, end;
    for(int i = 1; i < points.size(); i++) {
      start = points.get(i - 1);
      end = points.get(i);
      for (float j = start.x; j < end.x; j+=5) {
        ellipse(j, (j - start.x) * (end.y - start.y) / (end.x - start.x) + start.y, 2*radius, 2*radius);
      }
    }
    stroke(0);
    strokeWeight(1);
    for(int i = 1; i < points.size(); i++) {
      start = points.get(i - 1);
      end = points.get(i);
      line(start.x, start.y, end.x, end.y);
    }
  }  
}