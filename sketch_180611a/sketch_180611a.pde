Point[] points;

float window_diag;

void setup() {
  size(600, 600);
  window_diag  = width + height;
  points = new Point[1000];

  for (int i = 0; i < points.length; i++) {
    points[i] = new Point(random(0, width), random(0, height));
  }
}

void draw() {
  //background(0);
  stroke(255);
  for (int i = 0; i < points.length; i++) {
    points[i].Update();
    points[i].Draw();
  }
  println(frameRate);
  //saveFrame("output/######-img.png");
}
