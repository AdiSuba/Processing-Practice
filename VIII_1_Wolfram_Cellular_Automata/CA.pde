class CA {
  
  int[] cells;
  int generation;
  
  int[] ruleset;
  int w = 5;
  
  ArrayList<int[]> previous;
  
  CA() {
    cells = new int[width/w];
    previous = new ArrayList<int[]>();
    for(int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }
    cells[cells.length/2] = 1;
    generation = 0;
    ruleset = new int[]{0, 1, 1, 1, 1, 0, 1, 1};
  }
  
  CA(int rule) {
    cells = new int[width/w];
    previous = new ArrayList<int[]>();
    for(int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }
    cells[cells.length/2] = 1;
    generation = 0;
    String bin = binary(rule, 8);
    ruleset = new int[8];
    for(int i = 0; i < 8; i++) {
      ruleset[7 - i] = int(bin.charAt(i)) - 48;
      print(ruleset[i]);
    }
  }
  
  void generate() {
    int[] nextgen = new int[cells.length];
    if(generation > previous.size()) {
      previous.remove(0);
      generation--;
    }
    previous.add(cells);
    for (int i = 1; i < cells.length - 1;  i++) {
      int left = cells[i - 1];
      int me = cells [i];
      int right = cells[i+1];
      nextgen[i] = rules(left, me, right);
    }
    cells = nextgen;
    generation++;
  }
  
  int rules(int b2, int b1, int b0) {
    //return ruleset[4 * b2 + 2 * b1 + b0];
    String s = "" + b2 + b1 + b0;
   int index = Integer.parseInt(s, 2);
   return ruleset[index];
  }
  
  void display() {
    for (int i = 0; i < previous.size(); i++) {
      for(int j = 0; j < previous.get(i).length; j++) {
        if (previous.get(i)[j] == 1) fill(0);
        else fill(255);
        noStroke();
        rect(j*w, height - (previous.size() - i)*w - w, w, w);
      }
    }
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) fill(0);
      else fill(255);
      noStroke();
      rect(i*w, height - w, w, w);
    }
  }
}