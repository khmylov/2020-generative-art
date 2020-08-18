import hype.*;
import hype.extended.colorist.*;
import hype.extended.layout.*;
import processing.pdf.*;

void setup() {
  size(600, 600);
  H.init(this).background(#202020);
  smooth();

  final HColorPool colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #DADADA, #CCCCCC, #EEEEEE, #EDEDED);

  HDrawablePool pool = new HDrawablePool(121);
  pool.autoAddToStage()
    .add(new HShape("svg1.svg"))
    .add(new HShape("svg2.svg"))
    .add(new HShape("svg3.svg"))
    .add(new HShape("svg4.svg"))
    .add(new HShape("svg5.svg"))
    .add(new HShape("svg6.svg"))
    .layout(new HGridLayout()
      .startX(50)
      .startY(50)
      .spacing(50, 50)
      .cols(11)
    )
    .onCreate(
      new HCallback() {
        public void run(Object obj) {
          HShape d = (HShape) obj;
          d
            .enableStyle(false)
            .strokeJoin(ROUND)
            .strokeCap(ROUND)
            .strokeWeight(1)
            .stroke(#000000)
            .anchorAt(H.CENTER)
            .rotate((int) random(4) * 90)
            //.size(50 + ((int) random(4) * 50))
          ;
          d.randomColors(colors.fillOnly());
        }
      }
    )
    .requestAll()
  ;

  //saveVector();
  noLoop();
}

void draw() {
  H.drawStage();
}

void saveHiRes(int scaleFactor) {
  PGraphics hires = createGraphics(width * scaleFactor, height * scaleFactor, JAVA2D);

  beginRecord(hires);
  hires.scale(scaleFactor);

  if (hires == null) {
    H.drawStage();
  } else {
    H.stage().paintAll(hires, false, 1);
  }

  endRecord();

  hires.save("render.png");
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
