PVector rotation = new PVector(0, 90, 0);
PVector camPos = new PVector(0, 0, 0);
PVector camFocusPos = new PVector(0, 0, 0);
float camToFocusDist = 200;

Cartesian cartesian = new Cartesian(10, 10, 10, 10);

void setup() {
  size(600, 600, P3D);
  camPos.x = 0;
  camPos.y = 0;
  camPos.z = camToFocusDist;
  camFocusPos.x = 0;
  camFocusPos.y = 0;
  camFocusPos.z = 0;
  frustum(-6, 6, -6, 6, 10, 1000);
}

void draw() {
  // Clear screen
  background(0);


  // Make 0,0,0 to center
  translate(width/2, height/2, -100);
  camera(
    camPos.x, camPos.y, camPos.z, 
    camFocusPos.x, camFocusPos.y, camFocusPos.z, 
    0, 1, 0);
  cartesian.Draw();

  camera();
  fill(255);
  textSize(12);
  textMode(SCREEN);
  textAlign(LEFT);
  text("Camera Position: " + camPos, 0, 12);
  text("Rotation: " + rotation, 0, 24);
}

void mouseDragged() {
  float mouseXDif = mouseX - pmouseX;
  float mouseYDif = mouseY - pmouseY;
  if (mouseButton == LEFT) {
    rotation.y += mouseXDif;
    rotation.x -= mouseYDif;
    camPos.x = cos(radians(rotation.y))* camToFocusDist;
    camPos.y = sin(radians(rotation.x))* camToFocusDist;
    camPos.z = sin(radians(rotation.y))*cos(radians(rotation.x))* camToFocusDist;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  camToFocusDist += e;
  camPos.x = cos(radians(rotation.y))* camToFocusDist;
  camPos.y = sin(radians(rotation.x))* camToFocusDist;
  camPos.z = sin(radians(rotation.y))* camToFocusDist;
  //if (zoom < 0.01) zoom = 0.01;
}
