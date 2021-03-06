Follower f, g;

void setup() {
  size(800, 600); 
  f = new Follower(400, 300, width, height);
  g = new Follower(100, 50, width, height, #AF8920, 40, 20);
  f.setColor(#0D5F18);
  f.setSpeed(5);
  f.setSize(120);  
}

void draw() {
  background(80);
  f.draw();
  g.draw();
  f.followMe(mouseX, mouseY);
  g.followMe(mouseX, mouseY);
}

class Follower {
  float x;
  float y;
  float speed;
  float size;
  float followX;
  float followY;
  float rangeX;
  float rangeY;
  int myColor;

  Follower(float x, float y, float rangeX, float rangeY) {
    this.x = x;
    this.y = y;
    this.speed = 5;
    this.size = 80;
    this.followX = x;
    this.followY = y;
    this.rangeX = rangeX;
    this.rangeY = rangeY;
    this.myColor = #888888;
  }

  //long version of Constructor
    Follower(
      float x, float y, float rangeX, 
      float rangeY, int myColor, float speed, float size) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.size = size;
    this.followX = x;
    this.followY = y;
    this.rangeX = rangeX;
    this.rangeY = rangeY;
    this.myColor = myColor;
  }

  void followMe(float followX, float followY) {
    this.followX = followX;
    this.followY = followY;
    x += (followX - x)/rangeX * speed;
    y += (followY - y)/rangeY * speed;
  }

  void draw() {
    stroke(255);
    strokeWeight(3);
    fill(myColor);
    ellipse(x, y, size, size);
    followMe(followX, followY);
  }
  
  void setSpeed(float speed) {
    this.speed = speed;
  }
  
  void setColor(int myColor) {
    this.myColor = myColor;
  }
  
  void setSize(float size) {
    this.size = size;
  }
}
