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
  x = map(x, 0, 1, 0, width - 130);
  
  float y = noise(t2);
  y = map(y, 0, 1, 0, height);
  
  t1 += 0.001;
  t2 += 0.001;
  ellipse(x, y, 80, 80);
  ellipse(x + 130, y, 80, 80);
  
  float x1 = noise(t3);
  x1 = map(x1, 0, 1, x - 40, x + 40);
  
  float y1 = noise(t4);
  y1 = map(y1, 0, 1, y - 40, y + 40);
  
  t3 += 0.01;
  t4 += 0.01;
  
  fill(0);
  ellipse(x1, y1, 40, 40);
  ellipse(x1 + 130, y1, 40, 40);
}