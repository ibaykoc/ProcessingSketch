float friction = 0.03;
float forceThresh = 1000;
public class Point {
  public float x;
  public float y;
  float size = random(8,32);
  float dist_to_mouse;
  color farColor = color(#fdcf58, 255);
  color nearColor = color(#800909, 255);

  float xOrg;
  float yOrg;
  public PVector velocity = new PVector(0, 0);

  Point(float x, float y) {
    this.x = x;
    this.y = y;
    xOrg = x;
    yOrg = y;
  }

  void Update() {
    if (mousePressed) {
      float mx = mouseX;
      float my = mouseY;

      dist_to_mouse = abs(x - mx) + abs(y - my);
      float mForce = map(window_diag - dist_to_mouse, 0, window_diag, 0, .3);
      if (x < mx) {
        velocity.x -= mForce;
      } else if (x > mx) {
        velocity.x += mForce;
      }

      if (y < my) {
        velocity.y -= mForce;
      } else if (y > my) {
        velocity.y += mForce;
      }
    } else {
      // Friction
      if (velocity.x > 0) {
        velocity.x -= friction;
      } else if (velocity.x < 0) {
        velocity.x += friction;
      }

      if (velocity.y > 0) {
        velocity.y -= friction;
      } else if (velocity.y < 0) {
        velocity.y += friction;
      }
    }

    x += velocity.x;
    y += velocity.y;

    if (x < 0 ) {
      x = width - 1;
    } else if ( x > width) {
      x = 1;
    }

    if (y < 0 ) {
      y = height - 1;
    } else if ( y > height) {
      y = 1;
    }

    velocity.x = constrain(velocity.x, -15, 15);
    velocity.y = constrain(velocity.y, -15, 15);
  }

  void Draw() {
    //point(x, y);
    noStroke();
    float t = abs(velocity.x) * abs(velocity.y) / (100);
    fill(lerpColor(nearColor, farColor, t));
    ellipse(x, y, size, size);
  }
}
