import hype.*;
import hype.extended.colorist.*;

void setup() {
  size(1200, 600);
  H.init(this).background(#202020);
  smooth();

  HPixelColorist colors = new HPixelColorist("colors1.jpg");

  for (int i = 0; i < 200; ++i) {
    HRect d = new HRect();
    d
      .strokeWeight(3)
      .size(random(25, 125))
      .rotate(random(360))
      .loc(random(width), random(height))
      .stroke(colors.getColor(d.x(), d.y()))
      .fill(colors.getColor(d.x(), d.y()), 100)
      .anchorAt(H.CENTER)
    ;

    H.add(d);
  }

  H.drawStage();
}