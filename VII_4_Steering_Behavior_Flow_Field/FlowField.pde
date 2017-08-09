class FlowField {
  PVector[][] field;
  int cols, rows;
  int resolution;
  float t = 10000;
  
  FlowField(int r) {
    resolution = r;
    cols = width / r;
    rows = height / r;
    field = new PVector[cols][rows];
    init();
  }
  
  void init() {
    float step = 0.2;
    float xoff = 0;
    for(int i = 0; i < cols; i++) {
      float yoff = 0;
      for(int j = 0; j < rows; j++) {
        float theta = map(noise(xoff, yoff, t), 0, 1, 0, 2*PI);
        field[i][j] = PVector.fromAngle(theta);
        yoff += step;
      }
    xoff += step;
    }
    t += 0.05;
  }
  
  void display() {
    for(int i = 0; i < cols; i++) {
      for(int j = 0; j < rows; j++) {
        drawVector(field[i][j],i*resolution,j*resolution,resolution-2);
      }
    }
  }
  
  void drawVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    translate(x,y);
    stroke(0,100);
    rotate(v.heading2D());
    float len = v.mag()*scayl;
    line(0,0,len,0);
    popMatrix();
  }
  
  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution,0,cols-1));
    int row = int(constrain(lookup.y/resolution,0,rows-1));
    return field[column][row].get();
  }
}