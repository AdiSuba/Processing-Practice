class Path {
  PVector start;
  PVector end;
  float radius;
  
  Path() {
    radius = 20;
    start = new PVector(0, height/3);
    end = new PVector(width, 2*height/3);
  }
  
  void display() {
    fill(155);
    stroke(155);
    strokeWeight(0);
    for(int i = 0; i < width; i+=10) {
      ellipse(i, (i - start.x) * (end.y - start.y) / (end.x - start.x) + start.y, 2*radius, 2*radius);
    }
    stroke(0);
    strokeWeight(1);
    line(start.x, start.y, end.x, end.y);
  }  
}