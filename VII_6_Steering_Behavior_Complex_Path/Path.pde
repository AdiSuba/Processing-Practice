class Path {
  PVector start;
  PVector end;
  float radius;
  
  Path() {
    radius = 20;
    start = new PVector(0, height/3);
    end = new PVector(width, 2*height/3);
  }
  
  Path(PVector start, PVector end) {
    radius = 20;
    this.start = start.copy();
    this.end = end.copy();
  }
  
  void display() {
    fill(155);
    stroke(155);
    strokeWeight(0);
    for(float i = start.x; i < end.x; i+=5) {
      ellipse(i, (i - start.x) * (end.y - start.y) / (end.x - start.x) + start.y, 2*radius, 2*radius);
    }
    stroke(0);
    strokeWeight(1);
    line(start.x, start.y, end.x, end.y);
  }
  
  void displayLine() {
    stroke(0);
    strokeWeight(1);
    line(start.x, start.y, end.x, end.y);
  }
}