class Cartesian {

  int totalX = 10;
  int totalY = 10;
  int totalZ = 10;
  int scale = 10;

  Surface surface = new Surface(10, 10, 10, 10, 1);

  Cartesian(int totalX, int totalY, int totalZ, int scale) {
    this.totalX = totalX;
    this.totalY = totalY;
    this.totalZ = totalZ;
    this.scale = scale;
  }

  void Draw() {
    // Draw y line
    textSize(4);
    textMode(SHAPE);
    textAlign(CENTER);
    fill(0, 255, 0);
    text("y", 0, - (((totalX*scale/2)) + 4), 0);
    stroke(0, 255, 0);
    line (0, -totalY*scale/2, 0, 0, (totalY*scale/2), 0);

    // Draw x line
    fill(255, 0, 0);
    text("x", (totalX*scale/2) + 4, 0, 0);
    stroke(255, 0, 0);
    line (-totalX*scale/2, 0, 0, (totalX*scale/2), 0, 0);

    // Draw z line
    fill(0, 0, 255);
    text("z", 0, 0, -((totalZ*scale/2)));
    stroke(0, 0, 255);
    line (0, 0, -totalZ*scale/2, 0, 0, (totalZ*scale/2));

    surface.Draw();
  }
}
