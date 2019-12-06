class WaterTree extends InfectedTree {
  float maxWater;
  WaterTree() {
    super();
    name = "Water Tree";
    maxWater = 1000;
  }
  void run() {
    show();
    if (environment.rain.isRaining == true && water < maxWater) {
      water += 1;
    }
  }
  void show() {
    if ((position >= 4069 && position <4608)) {
      float w = 265 - map(water, 0, 1000, 0, 150);
      float w1 = map(water, 0, 1000, 0, 150);
      fill(255, 200);
      rect(4608-position+198, 265, 90, -w1);
      fill(255);
      text(water, 4608-position+310, w+5);
    }
  }
}
//class WaterTree {
//  float water;
//  int isSent;
//  WaterTree() {
//    water = 0;
//    isSent = 0;
//  }
//  void run() {
//    update();
//    supply();
//    //send();
//  }
//  void update() {
//    if (rain.isRaining == true && water < 1000) {
//      water +=0.3;
//    }
//  }
//  void supply() {
//    if (water > 2) {
//      if (uglyTree.empty == true) {
//        water -= 1.5;
//        uglyTree.charge++;
//        //saw.freq(random(100, 120));
//        //saw.amp(0.1);
//      }
//    }
//  }
//  void send() {
//    if (uglyTree.empty == false && water > 3 && isSent != 2) {
//      myPort.write(30);
//      //println("not pumping");
//      isSent = 2;
//    }
//    if (uglyTree.empty == true && isSent != 1) {
//      myPort.write(31); // deactivate button
//      //println("pumping");
//      isSent = 1;
//    }
//    if (water < 3 && isSent != 3) {
//      myPort.write(32); // deactivate button
//      //println("empty");
//      isSent = 3;
//    }
//  }
//}