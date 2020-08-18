import hype.*;
import hype.extended.colorist.*;

void setup() {
  size(1200, 600);
  H.init(this).background(#202020);
  smooth();

  HColorField colors = new HColorField(width, height)
    .addPoint(0, height / 2, #FF3300, 0.6)
    .addPoint(width, height / 2, #0095A8, 0.6)
    .addPoint(width / 2, 0, #FFFF00, 0.3)
    .addPoint(width / 2, height, #00FF00, 0.3)
    .fillAndStroke()
  ;

  for (int i = 0; i < 200; ++i) {
    HRect d = new HRect();
    d
      .fill(#000000, 100)
      .stroke(#000000)
      .strokeWeight(2)
      .size(random(25, 125))
      .rotate(random(360))
      .loc(random(width), random(height))
      .anchorAt(H.CENTER)
    ;
    colors.applyColor(d);

    H.add(d);
  }

  H.drawStage();
}