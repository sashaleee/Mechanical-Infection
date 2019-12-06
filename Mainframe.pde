class Mainframe extends InfectedTree {
  float powerConsumption;
  float coalConsumption;
  boolean glitch;
  boolean isGlitchActive;
  boolean coalRequest;
  Mainframe() {
    super();
    name = "Mainframe";
    glitch = false;
    isGlitchActive = false;
    powerConsumption = 0.5;
    coal = 0;
    power = 0;
  }
  void run() {
    //glitch();
  }
  void glitch() {
    if (buttonA == true) {
      glitch = true;
    } else {
      isGlitchActive = false;
      glitch = false;
    }
    if (glitch == true) {
      yoff = 0;
      leftImg = leftgl;
      rightImg = rightgl;
    } else {
      leftImg = leftNorm;
      rightImg = rightNorm;
    }
  }
}
//class Mainframe {
//  boolean glitch;
//  int block;
//  int isSent;
//  int state;
//  // state 1 == can scann, state 2 == scanning now, state 3 == not enough coal

//  Mainframe() {
//    glitch = false;
//    isSent = 1;
//    state = 0;
//    block = 0;
//  }

//  void run() {
//    //vision();
//    state();
//    block();
//    //send();
//  }

//  void vision() {
//    //if ((position >= 1200 && position < 1760 && coalMiningTree.coal > 30 && buttonA == true) || uglyTree.charge <= 100) {
//    //    glitch = true;
//    //    block = 2;
//    //} else {
//    //  if (buttonA == true || coalMiningTree.coal < 30) {
//    //    glitch = false;
//    //    if (block == 2) {
//    //      block = 1;
//    //    }
//    //  }
//    //}
//    ////if (uglyTree.charge <= 100) {
//    ////  glitch = true;
//    ////  //block = 2;
//    ////}
//    ////if (position >= 1200 && position < 1760 && coalMiningTree.coal > 30
//    ////  && buttonA == true && glitch == false && block == 1) {
//    ////  glitch = true;
//    ////  block = 2;
//    ////} 
//    ////if ((glitch == true && buttonA == true && block == 2) || coalMiningTree.coal < 30) {
//    ////  glitch = false;
//    ////  if (block == 2) {
//    ////    block = 1;
//    ////  }
//    ////}

//if (glitch == true) {
//  yoff = 0;
//  leftImg = leftgl;
//  rightImg = rightgl;
//  coalMiningTree.coal -= 0.2;
//} else {
//  leftImg = leftNorm;
//  rightImg = rightNorm;
//}
//    //if (coalMiningTree.coal < 300 && uglyTree.charge > 30) {
//    //  coalMiningTree.coalRequest = true;
//    //}
//    //if (coalMiningTree.coal > 500 || uglyTree.charge < 30) {
//    //  coalMiningTree.coalRequest = false;
//    //}
//  }
//  void state() {
//    if (glitch == false && position >= 1200 && position < 1760 && coalMiningTree.coal > 30 ) {
//      state = 1; // state 1 == can scann
//    } else {
//      if (coalMiningTree.coal < 30) {
//        state = 3; // state 3 == not enough coal
//      } else {
//        state = 1;
//      }
//    }
//    if (coalMiningTree.coal < 30) {
//      state = 3;
//    }  
//    if (glitch == true) {
//      state = 2; // state 2 == scanning now
//    }
//  }
//  void block() {
//    if (glitch == false && buttonA == false && block == 1) {
//      block = 3;
//    }
//    //println(mainframe.block);
//  }
//  void send() {
//    if (state == 1 && isSent != 2) {
//      myPort.write(25);
//      println("can scann");
//      isSent = 2;
//    }
//    if (state == 2 && isSent != 1) {
//      myPort.write(26); // deactivate button
//      println("scanning..");
//      isSent = 1;
//    }
//    if (state == 3 && isSent != 3) {
//      myPort.write(29);
//      println("not enough coal");
//      isSent = 3;
//    }
//  }
//}