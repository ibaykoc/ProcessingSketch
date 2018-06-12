class Surface {

  int totalXMinus;
  int totalZMinus;
  int totalXPlus;
  int totalZPlus;
  float gap = 10;
  PVector[][] vertices;

  Surface(int totalXMinus, int totalXPlus, int totalZMinus, int totalZPlus, float gap) {
    this.totalXMinus = totalXMinus;
    this.totalZMinus = totalZMinus;
    this.totalXPlus = totalXPlus;
    this.totalZPlus = totalZPlus;
    this.gap = gap;
    vertices = new PVector[totalXMinus + totalXPlus + 1][totalZMinus + totalZPlus + 1];

    int xIdx = 0;
    int zIdx = 0;
    for (float xPos = -totalXMinus*gap; xPos <=totalXPlus*gap; xPos+=gap) {
      zIdx = 0;
      for (float zPos = -totalZMinus*gap; zPos <=totalZPlus*gap; zPos+=gap) {
        vertices[xIdx][zIdx] = new PVector(xPos, 0, zPos);
        zIdx++;
      }
      xIdx++;
    }
  }

  void Draw() {
    smooth();
    stroke(255);
    beginShape(LINES);

    for (int x = 0; x < vertices.length; x++) {
      for (int z = 0; z < vertices[x].length; z++) {
        vertices[x][z].y = pow(-vertices[x][z].x,2);
      }
    }

    PVector from;
    PVector to;
    for (int x = 0; x < vertices.length-1; x++) {
      for (int z = 0; z < vertices[x].length-1; z++) {
        if (x == 0) {
          from = vertices[x][z];
          to = vertices[x][z+1];
          vertex(from.x, from.y, from.z);
          vertex(to.x, to.y, to.z);

          to = vertices[x+1][z];
          vertex(from.x, from.y, from.z);
          vertex(to.x, to.y, to.z);

          from = vertices[x+1][z];
          to = vertices[x+1][z+1];
          vertex(from.x, from.y, from.z);
          vertex(to.x, to.y, to.z);
        } else {
          from = vertices[x][z];
          to = vertices[x+1][z];
          vertex(from.x, from.y, from.z);
          vertex(to.x, to.y, to.z);

          from = vertices[x+1][z];
          to = vertices[x+1][z+1];
          vertex(from.x, from.y, from.z);
          vertex(to.x, to.y, to.z);
        }
        if (z >= vertices[x].length-2) {
          from = vertices[x][z+1];
          to = vertices[x+1][z+1];
          vertex(from.x, from.y, from.z);
          vertex(to.x, to.y, to.z);
        }
      }
    }
    endShape();
  }
}
