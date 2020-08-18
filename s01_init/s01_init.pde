int time = 0;

void setup() {
  size(1600, 1400, P3D);
}

void draw() {
  this.time++;
  camera(
    width/2.0,
    height / 2.0,
    (height/2.6) / tan(PI*30.0 / 180.0),
    width / 2.0,
    height / 2.0,
    0,
    0, 1, 0);
  translate(width/2.0, height / 2.0, -this.time);
  rotate(radians(time * 2.6));
  fill(random(0, 255), random(0, 255), random(0, 255));
  rect(
    random(360, 270),
    random(80, 130),
    random(44, 59),
    random(39, 57));
}