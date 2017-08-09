class Walker {
  float x, y, t1, t2, tp;
  Walker() {
    x = width/2;
    y = height/2;
    t1 = 0; 
    t2 = 1000; tp = 0;
  }
  
  void render() {
    stroke(0);
    point(x, y);
  }
  
  void step() {
  x = noise(t1);
  x = map(x, 0, 1, 0, width);
  
  y = noise(t2);
  y = map(y, 0, 1, 0, height);
  
  t1 += 0.001;
  t2 += 0.001;
  tp++;
  if(tp > 100 + random(500000)) {
    t1 = (int)random(10000);
    t2 = (int)random(10000);
    tp = 0;
  }
  }
}