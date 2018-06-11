boolean reset = false;
int counter = -15;
Color[] colors;
void setup() {
  size(300, 300);
  colors = new Color[height + 20];
  for (int i = 0; i < colors.length; i++) {
    colors[i] = new Color(random(255), random(255), random(255));
  }
  background(0);
}

void draw() {
  if (counter < width + 10) {
    noStroke();
    for ( int i = 0; i < colors.length; i++) {
      Color c = colors[i];
      fill(c.r, c.g, c.b, 255);
      ellipse(counter, i - 10 + (sin(counter*0.1)*10), 5, 5);
    }
    //saveFrame("output/######.png");
  } else {
    counter = - 15;
    for (int i = 0; i < colors.length; i++) {
      colors[i] = new Color(random(255), random(255), random(255));
    }
  }
  counter++;
}
