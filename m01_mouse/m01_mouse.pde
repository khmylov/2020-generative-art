import hype.*;
import hype.extended.colorist.*;
import hype.extended.layout.*;

int N_ROWS = 23;
int N_COLS = 23;

String[] paths = {"svg1.svg", "svg2.svg", "svg3.svg", "svg4.svg", "svg5.svg", "svg6.svg"};
HShape[] shapes = new HShape[N_ROWS * N_COLS];

HColorPool colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #DADADA, #CCCCCC, #EEEEEE, #EDEDED);

void setup() {
  size(1200, 1200);
  H.init(this).background(#202020);
  smooth();

  //HPixelColorist colorist = new HPixelColorist("colors1.jpg");

  for (int i = 0; i < N_ROWS; i++) {
    for (int j = 0; j < N_COLS; j++) {
      HShape d = new HShape(paths[(int) random(paths.length)]);
      int x = 50 + j * 50;
      int y = 50 + i * 50;
      d
        .enableStyle(false)
        .strokeJoin(ROUND)
        .strokeCap(ROUND)
        .strokeWeight(1)
        .loc(x, y)
        //.stroke(colorist.getColor(x, y))
        .stroke(#000000)
        .rotate((int) random(4) * 90)
        .anchorAt(H.CENTER)
      ;
      d.randomColors(colors.fillOnly());
      shapes[i * N_COLS + j] = d;
      H.add(d);
    }
  }

}

void draw() {
  for (int i = 0; i < N_ROWS; i++) {
    for (int j = 0; j < N_COLS; j++) {
      HShape d = shapes[i * N_COLS + j];
      int shapeX = 50 + j * 50;
      int shapeY = 50 + i * 50;
      int dx = mouseX - shapeX;
      int dy = mouseY - shapeY;

      d.rotation(atan2(dy, dx) * 180.0 / PI);

      float distance = sqrt(dx * dx + dy * dy);
      float sizeMult = distance / sqrt(width * width + height * height);
      d.size(50 * (1.0 + sizeMult) * 0.48);
    }
  }

  H.drawStage();
}
