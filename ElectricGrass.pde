class ElectricGrass extends InfectedTree {
  boolean powerRequest;
  float powerConsumption;
  float minPower;
  float maxPower;
  int minParasite;
  int maxParasite;
  boolean stopped;
  
  ElectricGrass() {
    name = "Electric Grass";
    minParasite = 5;
    maxParasite = 30;
    powerConsumption = 0.3;
    minPower = 0;
    maxPower = 100;
    powerRequest = false;
    power = 0;
    stopped = false;
  }
  void run() {
    update();
    defence();
    light();
  }
  void defence() {
    println(ecoSystem.parasite.population);
    if ((ecoSystem.parasite.population > maxParasite || stopped ==true) && power > 0) {
      isActive = true;
      stopped = false;
    } 
    if (ecoSystem.parasite.population <= minParasite) {
      isActive = false;
      stopped = false;
    }
    if (power < 0) {
      isActive = false;
      stopped = true;
    }
  }
  void update() {
    if (isActive == true) {
      power -= powerConsumption;
    }
    if (power <= minPower) {
      powerRequest = true;
    }
    if (power > maxPower) {
      powerRequest = false;
    }
  }
  void light() {
    float tr = map(power, 0, maxPower, 20, 200);
    final int y = 260;
    if ((position >= 4352 && position <current.width*2)) {
      beginShape();
      noStroke();
      fill(255, tr);
      vertex(-position + backgroundWidth*2+572, y);
      vertex(-position + backgroundWidth*2+572 - 100, height);
      vertex(-position + backgroundWidth*2+605 + 100, height);
      vertex(-position + backgroundWidth*2 + 605, y);
      endShape(CLOSE);
    }
    if ((position >= 0 &&  position < current.width)) {
      beginShape();
      noStroke();
      fill(255, tr);
      vertex(572-position, y);
      vertex(572-position-100, height);
      vertex(605-position+100, height);
      vertex(605-position, y);
      endShape(CLOSE);
    }
  }
}