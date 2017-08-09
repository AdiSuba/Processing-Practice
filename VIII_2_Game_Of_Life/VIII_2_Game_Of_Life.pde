GOL gol;
boolean start = false;
int wid = 5;
int i = 0;

void setup() {
  size(620, 480);
  frameRate(60);
  gol = new GOL();
}

void keyPressed() {
  start = !start;
}
void draw() {
  if(mousePressed) {
  int x = (int)mouseX/wid;
  int y = (int)mouseY/wid;
  gol.giveLife(x, y);
  }
  if(start && i%15 == 0) gol.generate();
  i++;
  gol.display();
}