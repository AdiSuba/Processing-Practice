class GOL {
  int w = wid;
  int colls, rows;
  int[][] board;  
  
  GOL() {
    colls = width / w;
    rows = height / w;
    board = new int[colls][rows];
  }
  
  void generate() {
    int[][] next = new int[colls][rows];
    
    for(int x = 1; x < colls - 1; x++) {
      for(int y = 1; y < rows - 1; y++) {
         int neighbors = 0;
         for(int i = -1; i <= 1; i++)
           for(int j = -1; j <= 1; j++)
             neighbors += board[x+i][y+j];
         neighbors -= board[x][y];
         //Life Goals
         if(board[x][y] == 1 && (neighbors < 2 || neighbors > 3)) next[x][y] = 0;
         else if(board[x][y] == 0 && neighbors == 3) next[x][y] = 1;
         else next[x][y] = board[x][y];      
      }
    }
    board = next;
  }
  
  void giveLife(int x, int y) {
    if(x >= 0 && y >= 0 && x < colls && y < rows) board[x][y] = 1;
  }
  
  void display() {
    for(int i = 0; i < colls; i++) {
      for(int j = 0; j < rows; j++) {
        if (board[i][j] == 1) fill(0);
        else fill(255);
        strokeWeight(0);
        rect(i*w, j*w, w, w);
      }
    }
    
    
  }
  
}