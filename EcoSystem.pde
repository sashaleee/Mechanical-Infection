class EcoSystem {
  ArrayList<InfectedTree> infectedTrees;
  Parasite parasite;
  ElectricGrass electricGrass;
  MiningTree miningTree;
  WaterTree waterTree;
  Mainframe mainframe;
  PowerTree powerTree;
  DeadTree deadTree;

  EcoSystem() {
    infectedTrees = new ArrayList<InfectedTree>();
    parasite = new Parasite();
    infectedTrees.add(electricGrass = new ElectricGrass());
    infectedTrees.add(miningTree = new MiningTree());
    infectedTrees.add(mainframe = new Mainframe());
    infectedTrees.add(waterTree = new WaterTree());
    infectedTrees.add(powerTree = new PowerTree());
    infectedTrees.add(deadTree = new DeadTree());
    electricGrass.id = 0;
    miningTree.id = 1;
    mainframe.id = 2;
    waterTree.id = 3;
    powerTree.id = 4;
    deadTree.id = 5;
  }
  void run() {
    //update();
    request();
    for (InfectedTree i : infectedTrees) {
      i.run();
    }
    parasite.update();
    info();
  }
  void request() {
    if (electricGrass.powerRequest == true && powerTree.power > 0) {
      powerTree.power -= 1;
      electricGrass.power += 1;
    }

    if (powerTree.waterRequest == true && waterTree.water > 0) {
      waterTree.water -= 1;
      powerTree.water += 0.8;
    }
  }
  void update() {
  }
  void info() {
    textFont(dos);
    if ((position >= 2976 && position <3648)) {
      BottomText(-position+2976+565, "Dead Tree");
    }
    if ((position >= 64  && position < 256)) {
      BottomText(-position+465, "Electric Grass");
    }
    // Ugly Fruit
    if (position >= 512 && position < 768) {
      BottomText(-position+512+700, "Hairy Stroberry Tree");
    }
    if ((position >= 4069 && position <4608)) {
      BottomText(-position+4069+655, "Water Tower Tree");
      //image(underground, -position+4069+8, height-256);

      //yoff = -256;
    } else {
      //yoff = 0;
    }
    if ((position >= 1200 && position <1760)) {
      BottomText(-position+1024+768, "Mainframe");
    }
    if ((position >= 2000 && position <2464)) {
      BottomText(-position+2000+650, "Coal Mining Tree");
    } 
    navigationDeg = nf(map(position, 0, backgroundWidth*2, 0, 360), 3, 2);
    textAlign(LEFT);
    fill(255);
    text("longitude:"+navigationDeg + "ø", 10, 20);
    text("position:" +position, 10, 40);
    text("time "+ time, 10, 60);
    text("water tank:"+int(waterTree.water) + " m^3", 10, 80);
    text("charge:" +int(powerTree.power)+" Ah", 10, 100);
    text("coal:" +int(miningTree.coal)+" kg", 10, 120);
    text(waterTree.name + " water: " + waterTree.water, 10, 140);
    text(powerTree.name + " power: " + powerTree.power, 10, 160);
    text(powerTree.name + " water: " + powerTree.water, 10, 180);

    text(powerTree.name + " water request: " + powerTree.waterRequest, 10, 200);
    text(electricGrass.name + " power: " + electricGrass.power, 10, 220);
    text(electricGrass.name + " power request: " + electricGrass.powerRequest, 10, 240);
    text(miningTree.name + " coal: " + miningTree.coal, 10, 260);
  }
}