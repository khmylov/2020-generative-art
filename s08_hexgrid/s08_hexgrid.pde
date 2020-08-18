import hype.*;
import hype.extended.colorist.*;
import hype.extended.layout.*;
import processing.pdf.*;

void setup() {
  size(600, 600);
  H.init(this).background(#FFFFFF);
  smooth();

  HDrawablePool dp1 = new HDrawablePool(88);
  dp1.autoAddToStage()
    .add(new HShape("hexagon.svg"))
    .layout(new HGridLayout().startX(27).startY(40).spacing(78, 51).cols(8))
    .onCreate(new HCallback() {
      public void run(Object obj) {
        HShape d = (HShape) obj;
        d.enableStyle(false).noStroke().fill(#4D4D4D).anchorAt(H.CENTER);
      }
    })
    .requestAll();

  HDrawablePool dp2 = new HDrawablePool(70);
  dp2.autoAddToStage()
    .add(new HShape("hexagon.svg"))
    .layout(new HGridLayout().startX(66).startY(65).spacing(78, 51).cols(7))
    .onCreate(new HCallback() {
      public void run(Object obj) {
        HShape d = (HShape) obj;
        d.enableStyle(false).noStroke().fill(#FF3300).anchorAt(H.CENTER);
      }
    })
    .requestAll();

  final HPixelColorist cp1 = new HPixelColorist("gradient.jpg").fillOnly();

  HDrawablePool dp3 = new HDrawablePool(70);
  dp3.autoAddToStage()
    .add(new HShape("hexagon.svg"))
    .layout(new HGridLayout().startX(66).startY(65).spacing(78, 51).cols(7))
    .onCreate(new HCallback() {
      public void run(Object obj) {
        HShape d = (HShape) obj;
        d.enableStyle(false).size(40).noStroke().anchorAt(H.CENTER);
        cp1.applyColor(d);
      }
    })
    .requestAll();

  //saveVector();
  noLoop();
}

void draw() {
  H.drawStage();
}

void saveVector() {
  PGraphics tmp;
  tmp = beginRecord(PDF, "render.pdf");

  if (tmp == null) {
    H.drawStage();
  } else {
    H.stage().paintAll(tmp, false, 1);
  }

  endRecord();
}
