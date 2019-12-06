import processing.sound.*;
import processing.serial.*;

int lf = 10;    // Linefeed in ASCII
String serialValue;
Serial myPort; 

EcoSystem ecoSystem;
Environment environment;
SawOsc flysSound;
//SawOsc miningSound;
//SawOsc waterPumpSound;
//SinOsc treeSound;
//SqrOsc mainframeSound;
BrownNoise rainSound;
Sand[] sand = new Sand[20];
Drop[] drops = new Drop[200];
String navigationDeg;

int time = 0;

int scrollPos;
int position;
int order = 12; // 12 == [leftImg,rightImg], 12 == [rightImg, leftImg]
int yoff = 0;
int xoff = 0;
int yTopOff;
final int step = 16;
final int backgroundWidth = 2592;
boolean buttonA;

PImage grass;
PImage leftImg;
PImage rightImg;
PImage current;
PImage next;
PImage underground;
PImage leftgl;
PImage rightgl;
PImage leftNorm;
PImage rightNorm;
PImage texture;
PFont dos, dosBig;

Star[] stars = new Star[1200];
float speed = 0.035;
float theta;

void setup() {
  fullScreen(P2D);
  //size(1280, 768, P2D);
  //noSmooth();
  //noCursor();
  yTopOff = height - 768;
  println(yTopOff);
  // Objects
  ecoSystem = new EcoSystem();
  environment = new Environment();
  // Serial Communication
  //printArray(Serial.list());
  //myPort = new Serial(this, Serial.list()[5], 57600);
  //myPort.clear();
  //serialValue = myPort.readStringUntil(lf);
  //serialValue = null;

  // Images
  texture = loadImage("texture.png");
  grass = loadImage("grass2.png");
  //underground = loadImage("underground.png");
  leftNorm = loadImage("img1a.png");// current image
  rightNorm = loadImage("img1b.png"); // next image
  leftgl = loadImage("img1gla.png");
  rightgl = loadImage("img1glb.png");
  leftImg = leftNorm;
  rightImg = rightNorm;
  current = leftImg;
  next = rightImg;

  // Fonts
  dos = loadFont("ModernDOS4378x16-16.vlw");
  dosBig = loadFont("ModernDOS4378x16-36.vlw");
  textFont(dos);

  // Sound
  flysSound = new SawOsc(this);
  flysSound.play();
  rainSound = new BrownNoise(this);
  rainSound.play();
  rainSound.amp(0);
  //saw = new SawOsc(this);
  //saw.play();
  //saw.freq(200);
  //saw.amp(0);
  //sine = new SinOsc(this);
  //sine.play();
  //sine.freq(200);
  //sine.amp(0);

  for (int i = 0; i < sand.length; i++) {
    sand[i] = new Sand();
  }
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  //serialRead();
  flysSound.amp(0);
  //sine.amp(0);

  keyRead();
  background(24);
  environment.screenShake();
  environment.starField();
  scroll();
  ecoSystem.run();
  environment.run();
  //if (position + mouseX <= backgroundWidth*2) {
  //  println(position + mouseX + ":" + mouseY);
  //} else {
  //  println(-backgroundWidth*2 + position + mouseX + ":" + mouseY);
  //}
  time++;
}
//void mouseClicked() {
//}