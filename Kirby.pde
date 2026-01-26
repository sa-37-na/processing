// === グローバル変数 ===
// 星の座標・動き
float xStar = 0;
float yStar = 0;
float starSpeed = 2;
int starStartFrame = 0;
int starDuration = 60;  // 星の表示時間（フレーム単位） // 工夫した点4: 一定時間後に消える演出
color starColor; // 工夫した点6: 星の色をランダムに
boolean doDraw = false;

// 敵ボールの座標・動き
float x3;
float speed;
float ac = 10;

void setup() {
  size(500, 500);
  x3 = 0;
  speed = 1;
  background(255);
}

void draw() {
  background(#B4D5FF);

  drawKirby(100);      // カービィ描画（通常サイズ）
  drawEnemyBall(50);   // 敵ボール描画

  if (doDraw) {
    if (frameCount - starStartFrame < starDuration) {
      drawKirby(150);         // 工夫した点2: カービィの口を開けたように見せる
      drawStar(5);            // 工夫した点3: 五芒星を三角関数で描画
      showHitText();         // 工夫した点5: HIT!と表示
      drawOpenMouth();       // 工夫した点5: カービィの口の視覚演出
    } else {
      doDraw = false;
    }
  }
}
// === 関数1：カービィを描画 ===
void drawKirby(int r) {
  float x = mouseX;
  float y = mouseY;

  fill(#FFB4F1);
  noStroke();
  circle(x, y, r);

  // 目
  fill(0);
  ellipse(x - 10, y - 10, 10, 30);
  ellipse(x + 10, y - 10, 10, 30);
  fill(255);
  ellipse(x - 10, y - 15, 5, 10);
  ellipse(x + 10, y - 15, 5, 10);
  fill(#3A2EF0);
  ellipse(x - 10, y, 5, 10);
  ellipse(x + 10, y, 5, 10);

  // ほっぺ
  fill(#FF58B4);
  ellipse(x + 20, y, 10, 5);
  ellipse(x - 20, y, 10, 5);

  // 星が出てないときだけ口を描画
  if (!doDraw) {
    fill(#FA3A50);
    beginShape();
    curveVertex(x - 5, y + 5);
    curveVertex(x - 5, y + 5);
    curveVertex(x - 3, y + 13);
    curveVertex(x, y + 15);
    curveVertex(x + 3, y + 13);
    curveVertex(x + 5, y + 5);
    curveVertex(x + 5, y + 5);
    endShape(CLOSE);
  }
}
// === 関数2：動く敵キャラ（ボール） ===
void drawEnemyBall(int r) {
  x3 += speed;

  if (!doDraw) {
    fill(#B4FFF6);
    circle(x3, height / 2, r);
  }

  if (x3 > width + r / 2) {
    x3 = -r / 2;
    doDraw = false;
  }

  if (abs(mouseX - x3) < 20) {
    speed = min(speed + ac, 10); // 工夫した点: 接近で加速
    if (abs(mouseX - x3) < 2) {
      doDraw = true;                        // 工夫した点1: 敵と接触時に星発射
      xStar = mouseX;
      yStar = mouseY;                      // 工夫した点2: カービィの位置から星を発射
      starSpeed = 2;
      starStartFrame = frameCount;
      starColor = color(random(255), random(255), random(255)); // 工夫した点6: 星の色を毎回変化
    }
  }
}
// === 関数3：星を描画・移動 ===
void drawStar(int n) {
  fill(starColor);

  beginShape();
  float r1 = 20;
  float r2 = 10;
  float angleStep = TWO_PI / (n * 2);

  for (int i = 0; i < n * 2; i++) {
    float r = (i % 2 == 0) ? r1 : r2;
    float angle = i * angleStep;
    float x = cos(angle) * r + xStar;
    float y = sin(angle) * r + yStar;
    vertex(x, y);
  }

  endShape(CLOSE);

  xStar += starSpeed;
  if (xStar > width - 30 || xStar < 30) {
    starSpeed *= -1; // 工夫した点: 星の往復移動
  }
}
// === 関数4：HIT! のテキスト表示 ===
void showHitText() {
  fill(255, 0, 0);
  textSize(32);
  text("HIT!", width / 2 - 30, 50); // 工夫した点5: 接触時に文字表示
}

// === 関数5：カービィの口を開ける楕円描画 ===
void drawOpenMouth() {
  fill(#FA3A50);
  ellipse(mouseX, mouseY + 20, 20, 30); // 工夫した点5: 口を開ける演出の強化
}
