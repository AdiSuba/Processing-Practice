class Surface  {
  
  Body body;

  ArrayList<Vec2> surface;

  Surface() {
    
    surface = new ArrayList<Vec2>();
    float prevx = 0;
    surface.add(new Vec2(prevx, random(height/3, 4*height/5)));
    for(int i = 0; i < 10; i += random(3)) {
      prevx = random(prevx, width/5 + prevx);
      surface.add(new Vec2(prevx, random(height/3, 4*height/5)));
    }
    surface.add(new Vec2(width, random(height/3, 4*height/5)));
    
    ChainShape chain = new ChainShape();
    Vec2[] vertices = new Vec2[surface.size()];
    for(int i = 0; i < vertices.length; i++) {
      vertices[i] = box2d.coordPixelsToWorld(surface.get(i));
    }
    chain.createChain(vertices, vertices.length);
    
    BodyDef bd = new BodyDef();
    body = box2d.createBody(bd);
    
    body.createFixture(chain, 1);
  }

  void display() {
    strokeWeight(1);
    stroke(0);
    fill(0);
    beginShape();
    for (Vec2 v: surface) {
      vertex(v.x, v.y);
    }
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE);
  }
}