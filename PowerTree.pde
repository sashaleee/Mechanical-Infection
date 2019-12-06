class PowerTree extends InfectedTree {
  int maxPower;
  float maxWater;
  boolean waterRequest;
  boolean charging;
  PowerTree() {
    super();
    name = "Power Tree";
    //powerConsumption = 0.5;
    maxPower = 400;
    maxWater = 100;
    charging = false;
    waterRequest = false;
    leftPos = 512;
    rightPos = 768;
  }
  void charging() {
    if (environment.rain.isRaining == true && water < maxWater) {
      water += 2;
    }
    if (water > 0 && power <= maxPower) {
      water -= 2;
      power += 1.5;
    }
  }
  void update() {
    if (water < 20 && environment.rain.isRaining == false) {
      waterRequest = true;
    }
    if (water > 50 && waterRequest == true) {
      waterRequest = false;
    }
    if (power < 0) {
      power = 0;
    }
    if (water < 0) {
      water = 0;
    }
  }
  void showInfo() {
    if (buttonA == true && (position >= leftPos && position < rightPos)) {
      textFont(dosBig);
      fill(255);
      rect(-position+leftPos+480,300,290,40);
      fill(0);
      text("power: "+power+" AH", -position+leftPos+490, 330);
    }
  }
  void run() {
    update();
    charging();
    showInfo();
  }
}
//class UglyTree {
//  float charge;
//  String onoff;
//  boolean empty;

//  UglyTree() {
//    charge = 0;
//    onoff = "OFF";
//  }

//  void charging() {
//    if (rain.isRaining == true && charge <= 200) {
//      charge += 0.8;
//    }
//    if (charge < 0) {
//      charge = 0;
//    }
//  }
//  void lightOn() {
//    if (charge > 0) {
//      if ((position >= 4608 && position <current.width*2)) {
//        beginShape();
//        noStroke();
//        fill(255, charge);
//        vertex(-position+current.width*2+572, 230);
//        vertex(-position+current.width*2+572-charge/2, height);
//        vertex(-position+current.width*2+605+charge/2, height);
//        vertex(-position+current.width*2+605, 230);
//        endShape(CLOSE);
//      }
//      if ((position >= 0 &&  position < current.width)) {
//        beginShape();
//        noStroke();
//        fill(255, charge);
//        vertex(572-position, 230);
//        vertex(572-position-charge/2, height);
//        vertex(605-position+charge/2, height);
//        vertex(605-position, 230);
//        endShape(CLOSE);
//      }  
//      if (rain.isRaining == false) {
//        charge -=0.2;
//      }
//    }
//    if (charge > 30) {
//      onoff = "ON";
//    } else {
//      onoff = "OFF";
//    }
//    if (rain.isRaining == false && charge == 0) {
//      empty =true;
//    } 
//    if ((rain.isRaining == false && charge >=200) || rain.isRaining == true || waterTree.water < 3) {
//      empty = false;

//    }
//  }
//}