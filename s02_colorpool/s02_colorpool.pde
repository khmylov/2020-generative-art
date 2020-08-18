import hype.*;
import hype.extended.colorist.*;

void setup() {
  size(1200, 900);
  H.init(this).background(#202020);
  smooth();

  HColorPool colors = new HColorPool()
    .add(#784830, 10)
    .add(#78C0C0, 15)
    .add(#A8D8D8, 8)
    .add(#186090, 20)
    .add(#C0D8F0, 25)
    .add(#3078A8, 10)
    .add(#F0F0D8, 10)
    .add(#C0F0D8, 20)
    .add(#787878, 10)
  ;

  for (int i = 0; i < 200; ++i) {
    HDrawable d = new HRect()
      .strokeWeight(1)
      .stroke(#000000)
      .fill(colors.getColor())
      .size(random(25, 125))
      .rotate(random(360))
      .loc(random(width), random(height))
      .anchorAt(H.CENTER)
    ;

    H.add(d);
  }

  H.drawStage();
}