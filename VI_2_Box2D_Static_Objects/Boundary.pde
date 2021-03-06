class Boundary  {
  
  Body body;

  float x,y;
  float w,h;

  Boundary(float x_, float y_) {
    x = x_;
    y = y_;
    w = 60;
    h = 16;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float realw = box2d.scalarPixelsToWorld(w/2);
    float realh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(realw, realh);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    
    body.createFixture(fd);
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    
    fill(55);
    stroke(0);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }
}