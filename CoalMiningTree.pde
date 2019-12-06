class MiningTree extends InfectedTree {
  PVector coalPos;
  float powerConsumption;
  MiningTree() {
    super();
    coal = 200;
    name = "Coal Mining Tree";
    powerConsumption = 1;
    power = 200;
    leftPos = 2176;
    centerPos = 2725;
    rightPos = 2976;
    coalPos = new PVector(2925, 360);
  }
  void run() {
    mine();
    show();
  }
  void mine() {
    if (coal < 1000 && position >= 2000 && position < 2464 && ecoSystem.powerTree.power > 30) {
      if (buttonA == true) {
        isActive = true;
      }
    }
    if (buttonA == false || coal >= 1000) {
      isActive = false;
    }
    if (isActive == true && power > 30) {
      coal++;
      for (int i = 0; i < sand.length; i++) {
        sand[i].update();
        sand[i].show();
      }
    }
  }
  void show() {
    beginShape();
    noStroke();
    texture(texture);
    float ax = 1904-position+1020;
    float ay = 505-coal/8;
    float bx = 1904-position+1020-coal/8;
    float cx = 1904-position+1020+coal/8;
    vertex(ax, ay, 75, 0);
    vertex(bx, 505, 0, 150);
    vertex((bx+cx)/2, 505+coal/100, 75, 150);
    vertex(cx, 505, 150, 150);
    endShape(CLOSE);
  }
}
//class CoalMiningTree {
//  //float coal;
//  //boolean isMining;
//  //boolean coalRequest;
//  //int isSent;

//  CoalMiningTree() {
//    //coal = 100;
//    //isMining = false;
//    //isSent = 1;
//    //coalRequest = false;
//  }
//  void mine() {
//    //if (coal < 1000 && position >= 2000 && position < 2464 && uglyTree.charge > 30
//    //  && coalRequest == false && (mainframe.block == 3 || mainframe.block == 0)) {
//    //  if (buttonA == true) {
//    //    isMining = true;
//    //  }
//    //}
//    //if (buttonA == false || coal >= 1000) {
//    //  isMining = false;
//    //}
//    //if (isMining == true || (coalRequest == true && uglyTree.charge > 30)) {
//    //  coal++;
//    //  uglyTree.charge -=0.4;
//    //  for (int i = 0; i < sand.length; i++) {
//    //    sand[i].update();
//    //    sand[i].show();
//    //  }
//    //}
//  }
//  void show() {
//    //beginShape();
//    //noStroke();
//    //texture(texture);
//    //float ax = 1904-position+1020;
//    //float ay = 505-coal/8;
//    //float bx = 1904-position+1020-coal/8;
//    //float cx = 1904-position+1020+coal/8;
//    //vertex(ax, ay, 75, 0);
//    //vertex(bx, 505, 0, 150);
//    //vertex((bx+cx)/2, 505+coal/100, 75, 150);
//    //vertex(cx, 505, 150, 150);
//    //endShape(CLOSE);
//  }

//  void send() {
//    if (uglyTree.charge > 30 && coal < 1000 && isMining == false && coalRequest == false && isSent != 2) {
//      //myPort.write(23); // press to mine
//      println("press to mine");
//      isSent = 2;
//    }
//    if ((isMining == true || coalRequest == true) && isSent != 1) {
//      //myPort.write(24); // mining now
//      //println("mining now");
//      isSent = 1;
//    }
//    if (coal >= 1000 && isSent != 5) {
//      //myPort.write(27); // Full
//      //println("full");
//      isSent = 5;
//    }
//    if (uglyTree.charge < 30 && coal < 1000 && isSent != 4) {
//      //myPort.write(28); // not enought power
//      //println("not enought power");
//      isSent = 4;
//    }
//  }
//  void run() {
//    mine();
//    show();
//    send();
//  }
//}

////void mine() {
////  if (coal < 1000 && position >= 2000 && position < 2464 && uglyTree.charge > 30
////    && coalRequest == false && (mainframe.block == 3 || mainframe.block == 0)) {
////    if (buttonA == true) {
////      isMining =true;
////    }
////  } else {
////    isMining = false;
////  }
////  if (isMining == true || (coalRequest == true && uglyTree.charge > 30)) {
////    coal++;
////    uglyTree.charge -=0.4;
////    for (int i = 0; i < sand.length; i++) {
////      sand[i].update();
////      sand[i].show();
////    }
////  }
////}