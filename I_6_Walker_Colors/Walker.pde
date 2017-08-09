class Walker {
  float x, y, t1, t2, t3;
  
  Walker() {
    x = width/2;
    y = height/2;
    t1 = random(10000);
    t2 = random(10000);
    t3 = random(10000);
  }
  
  void render() {
    float r = noise(t1);
    r = map(r, 0, 1, 0, 255);
  
    float g = noise(t2);
    g = map(g, 0, 1, 0, 255);
     
    float b = noise(t3);
    b = map(b, 0, 1, 0, 255);
    
    t1 += 0.0002;
    t2 += 0.0002;
    t3 += 0.0002;
    stroke(r, g, b);
    strokeWeight(1);
    point(x, y);
  }
  
  void step() {
     int choice = (int)random(4);
     
     if(choice == 0) {
       x+=1;
     }
     else if(choice == 1) {
       x-=1;
     }
     else if(choice == 2) {
       y+=1;
     }
     else {
       y-=1;
     }
  }
}