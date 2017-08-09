class ComplexPath {
  int numOfPaths;
  ArrayList<Path> paths;
  
  ComplexPath() {
    numOfPaths = 5;
    PVector beg, end;
    paths = new ArrayList<Path>();
    beg = new PVector(0, random(height));
    for(int i = 0; i <= numOfPaths; i++) {
      end = new PVector((i + 1) * width / numOfPaths, random(height));
      paths.add(new Path(beg, end));
      beg = end;
    }
  }
  
  Path getPath(float x) {
    for(Path p: paths) {
      if(p.start.x <= x && p.end.x >= x) return p;
    }
    if(x < 0) return paths.get(0);
    return paths.get(numOfPaths);
  }
  
  void display() {
    for(Path p: paths) {
      p.display();
    }
    for(Path p: paths) {
      p.displayLine();
    }
  }
}