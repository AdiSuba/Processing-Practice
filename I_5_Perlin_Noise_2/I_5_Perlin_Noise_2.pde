float t1 = 0;
float t2 = 1000;
float t3 = 5000;
float t4 = 10000;

void setup() {
  size(400, 300);
}

void draw() {
  background(0);
  fill(255);
  float x = noise(t1);
  x = map(x, 0, 1, 0, width);
  
  float y = noise(t2);
  y = map(y, 0, 1, 0, height);
  
  t1 += 0.005;
  t2 += 0.005;
  ellipse(x, y, 80, 80);
  
  float x1 = noise(t3);
  x1 = map(x1, 0, 1, 0, width);
  
  float y1 = noise(t4);
  y1 = map(y1, 0, 1, 0, height);
  
  t3 += 0.02;
  t4 += 0.02;
  
  fill(0);
  ellipse(x1, y1, 10, 10);
}