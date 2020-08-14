import themidibus.*; //Import the midibus library
MidiBus myBus; // The MidiBus

boolean nowPedaling = false; // is it pedaling?（不要動）
int[] isKeyOn = new int[128]; // what notes are being pressed (1 or 0)（不要動）
float[] isFilled = new float[128]; // not used (yet)（不要動）
int[] isPedaled = new int[128]; // what notes are pedaled (1 or 0)（不要動）
color keyOnColor; // set it in setup()
color pedaledColor; // set it in setup()

int[] isBlack = {0, 11, 0, 13, 0, 0, 11, 0, 12, 0, 13, 0}; // 是黑鍵嗎？是的話，相對左方的白鍵位移多少？(default: {0, 11, 0, 13, 0, 0, 11, 0, 12, 0, 13, 0}）
int border = 3; // 左方留空幾個畫素？(default: 3)
int whiteKeyWidth = 20; // 白鍵多寬？(default: 20)
int whiteKeySpace = 1; // 白鍵間的縫隙多寬？(default: 1)
int blackKeyWidth = 17; // 黑鍵多寬？(default: 17)
int blackKeyHeight = 45; // 黑鍵多高？(default: 45)
int radius = 5; // 白鍵圓角(default: 5)
int bRadius = 4; // 黑鍵圓角(default: 4)
int keyAreaY = 3; // 白鍵從 Y 軸座標多少開始？(default: 3)
int keyAreaHeight = 70; // 白鍵多高？(default: 70)
boolean rainbowMode = false; // 彩虹模式 (default: false)

void setup() {
  int winWidth = (whiteKeyWidth+whiteKeySpace)*52 + (border*2); // recommended window width
  int winHeight = keyAreaHeight + (keyAreaY*2); // recommended window width
  println("Recommended window size: ", winWidth, winHeight); // 建議的視窗大小（顯示於 Console）
  size(1098, 76, FX2D); // 視窗大小 (default: 1098, 76)
  colorMode(HSB, 360, 100, 100, 100);
  keyOnColor = color(326, 100, 100, 100); // <---- 編輯這裡換「按下時」的顏色！[HSB Color Mode] 
  pedaledColor = color(326, 70, 60, 100); // <---- 編輯這裡換「踏板踩住」的顏色！[HSB Color Mode]
  smooth(2);
  frameRate(60);
  initKeys();
  MidiBus.list(); // 啟動時會列出 MIDI Input/Output 裝置，記下你想用的 MIDI Input 裝置名稱，設定在下一行。
  myBus = new MidiBus(this, "MIDI Input device name", -1); // 將「MIDI Input device name」代換成你的 MIDI Input 裝置。
}

void draw() {
  background(0, 0, 30, 100);
  drawWhiteKeys();
  drawBlackKeys();
}

void initKeys() {
  for (int i = 0; i<128; i++) {
    isKeyOn[i] = 0;
    isFilled[i] = 0.0;
    isPedaled[i] = 0;
  }
}

void drawWhiteKeys() {
  int wIndex = 0; // white key index
  stroke(0, 0, 0);
  strokeWeight(1);
  for (int i = 21; i < 109; i++) {
    if (isBlack[i % 12] == 0) {
      // it's a white key
      if (isKeyOn[i] == 1 && !rainbowMode) {
        fill(keyOnColor); // keypressed
      } else if (isKeyOn[i] == 1 && rainbowMode) {
        fill(map(i, 21, 108, 0, 1080)%360, 100, 100, 100); // rainbowMode
      } else if (isPedaled[i] == 1 && !rainbowMode) {
        fill(pedaledColor); // pedaled
      } else if (isPedaled[i] == 1 && rainbowMode) {
        fill(map(i, 21, 108, 0, 1080)%360, 100, 70, 100); // pedaled rainbowMode
      } else {
        fill(0, 0, 100); // white key
      }
      int thisX = border + wIndex*(whiteKeyWidth+whiteKeySpace);
      rect(thisX, keyAreaY, whiteKeyWidth, keyAreaHeight, radius);
      // println(wIndex);
      wIndex++;
    }
  }
}

void drawBlackKeys() {
  int wIndex = 0; // white key index
  stroke(0, 0, 0);

  strokeWeight(1.5);

  for (int i = 21; i < 109; i++) {
    if (isBlack[i % 12] == 0) {
      // it's a white key
      wIndex++;
    }

    if (isBlack[i % 12] > 0) {
      // it's a black key
      if (isKeyOn[i] == 1 && !rainbowMode) {
        fill(keyOnColor); // keypressed
      } else if (isKeyOn[i] == 1 && rainbowMode) {
        fill(map(i, 21, 108, 0, 1080)%360, 100, 100, 100); // rainbowMode
      } else if (isPedaled[i] == 1 && !rainbowMode) {
        fill(pedaledColor); // pedaled
      } else if (isPedaled[i] == 1 && rainbowMode) {
        fill(map(i, 21, 108, 0, 1080)%360, 100, 70, 100); // pedaled rainbowMode
      } else {
        fill(0, 0, 0); // white key
      }


      int thisX = border + (wIndex-1)*(whiteKeyWidth+whiteKeySpace) + isBlack[i % 12];
      rect(thisX, keyAreaY-1, blackKeyWidth, blackKeyHeight, bRadius);
    }
  }
}

void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  isKeyOn[pitch] = 1;
  isFilled[pitch] = 100;
  if (nowPedaling) {
    isPedaled[pitch] = 1;
  }
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
  isKeyOn[pitch] = 0;
  isFilled[pitch] = 0;
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  if (number == 64 && value >= 64) {
    nowPedaling = true;
    for (int i = 0; i<128; i++) {
      // copy key on to pedal
      isPedaled[i] = isKeyOn[i];
    }
  }

  if (number == 64 && value < 64) {
    nowPedaling = false;
    for (int i = 0; i<128; i++) {
      // reset isPedaledlin
      isPedaled[i] = 0;
    }
  }
}
