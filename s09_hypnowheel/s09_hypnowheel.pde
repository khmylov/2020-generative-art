import hype.*;
import hype.extended.behavior.*;
import hype.extended.colorist.*;
import hype.extended.layout.*;
import processing.pdf.*;

HDrawablePool pool;
HColorPool colors;

void setup() {
  size(800, 800);
  H.init(this).background(#202020);
  smooth();

  colors = new HColorPool()
    .add(#333333)
    .add(#666666, 6)
    .add(#999999, 4)
    .add(#CCCCCC, 2)
    .add(#0095A8)
    .add(#00616F)
    .add(#FF3300)
    .add(#FF6600)
  ;

  pool = new HDrawablePool(40);
  pool
    .autoAddToStage()
    .add(new HShape("1.svg"))
    .add(new HShape("2.svg"))
    .add(new HShape("3.svg"))
    .add(new HShape("4.svg"))
    .onCreate(new HCallback() {
      public void run(Object obj) {
        float ranScale = 1 + ((int) random(16) * 0.3);
        int ranBaseWeight = 10 + ((int) random(5) * 5);

        HShape d = (HShape) obj;
        d
          .enableStyle(false)
          .anchorAt(H.CENTER)
          .loc(width / 2, height / 2)
          .scale(ranScale)
          .noFill()
          .strokeWeight(ranBaseWeight * (1/ranScale))
          .strokeJoin(SQUARE)
          .strokeCap(SQUARE)
        ;
        d.randomColors(colors.strokeOnly());

        // float ranSpeed = random(-6, 6);
        // if (ranSpeed == 0) ranSpeed = 1;
        // new HRotate(d, ranSpeed);

        int i = pool.currentIndex();

        new HOscillator()
          .target(d)
          .property(H.ROTATION)
          .range(-360, 360)
          .speed(0.2)
          .freq(3)
          .currentStep(i)
        ;

        new HOscillator()
          .target(d)
          .property(H.SCALE)
          .range(0.25, 1.5)
          .speed(0.5)
          .freq(4)
          .currentStep(i)
        ;
      }
    })
    .requestAll()
  ;

  //saveVector();
  //noLoop();
}

void draw() {
  H.drawStage();
}

void keyPressed() {
  if (key == 'c') {
    for (HDrawable temp : pool) {
      HShape d = (HShape) temp;
      d.randomColors(colors.strokeOnly());
    }
  }
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
