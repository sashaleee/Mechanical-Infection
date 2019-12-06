class InfectedTree {
  String name;
  int id;
  int leftPos;
  int rightPos;
  int centerPos;
  boolean isActive;
  int sentState;
  boolean isDead;
  ///////test////
  float water;
  float power;
  float coal;
  boolean powerRequest;
  boolean waterRequest;
  ///////////////
  InfectedTree() {
    isDead = false;
    isActive = false;
    sentState = 0;
  }
  void run() {
  }

  void transmitWater(InfectedTree source, float amount) {
    if (water < amount && source.water > 0) {
      water++;
      source.water--;
    }
  }

  void transmitPower(InfectedTree source, float amount) {
    if (power < amount && source.power > 0) {
      power++;
      source.power--;
    }
  }
  void transmitoal(InfectedTree source, float amount) {
    if (coal < amount && source.power > 0) {
      coal++;
      source.coal--;
    }
  }
  void send() {
  }
}