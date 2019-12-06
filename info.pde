void info() {

    navigationDeg = nf(map(position, 0, current.width*2, 0, 360), 3, 2);
    textAlign(LEFT);
    fill(255);
    text("longitude:"+navigationDeg + "ø", 10, 20);
    text("position:" +position, 10, 40);
    text("time "+ time, 10, 60);
    text("water tank:"+int(ecoSystem.waterTree.water) + " m^3", 10, 80);
    text("charge:" +int(ecoSystem.powerTree.power)+" Ah", 10, 100);
    text("coal:" +int(ecoSystem.miningTree.coal)+" kg", 10, 120);
  //} else {

  //  ////GLITCH
  //  textFont(dosBig);
  //  fill(255);
  //  if ((position >= 64  && position < 320)) {
  //    text("light" +uglyTree.onoff, -position+530, 200); //200
  //  }
  //  // Ugly Fruit
  //  if (position >= 512 && position < 1168) {
  //    text("charge " +uglyTree.charge+" AmpHour", -position+512+512, 300); //300
  //  }
  //  if ((position >= 4069 && position <4608)) {
  //    text("water "+waterTree.water + " m^3", -position+4069+600, 120); //120
  //    text("water supply "+uglyTree.empty, -position+4069+600, 160); //120
  //  }
  //  if ((position >= 1200 && position <1760)) {
  //    text("SCANNING", -position+1024+800, 700); //300
  //  }
  //  if ((position >= 2000 && position <2464)) {
  //    text("coal "+coalMiningTree.coal/200 + " ton", -position+2000+650, 420);
  //  } 

  //  //if ((position >= 2592 && position <3400)) {
  //  //  BottomText(-position+2592+460, "New Forest");
  //  //}
  //  if ((position >= 3008 && position <3696)) {
  //    text("NullPointerException", -position+3264+200, 500); //500
  //  }

  //  navigationDeg = nf(map(position, 0, current.width*2, 0, 360), 3, 2);
  //  textAlign(LEFT);
  //  fill(255);
  //  text("longitude "+navigationDeg + "ø", 15, 40);
  //  //text("position " +position, 20, 40);
  //  text("time "+ time, 20, 80);
  //  //text("water "+int(waterTree.water) + " cubic metre", 10, 80);
  //  //text("charge " +int(uglyTree.charge)+" Ah", 10, 100);
  //  //text("iron coal " +int(coalMiningTree.coal)+" kg", 10, 120);
  //  textFont(dos);
  //}
}