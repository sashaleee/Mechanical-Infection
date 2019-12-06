class Fly {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector attraction;
  int life;
  int food;
  Fly() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    life = 5;
    food = 0;
  }
  void update(PVector target) {
    attraction = target.copy();
    attraction.sub(location);
    attraction.setMag(0.03);
    acceleration = attraction.add(PVector.random2D().setMag(0.3));
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(2);
    acceleration.mult(0);
    // eat
    if ((location.x > 355) && (location.x < 365) 
      && (location.y > 460) && (location.y < 480) && ecoSystem.electricGrass.isActive == false) {
      food++;
      life++;
    }
    // damage
    if ((location.x > 355) && (location.x < 365) 
      && (location.y > 490) && (location.y < 510) && ecoSystem.electricGrass.isActive == true) {
      stroke(255);
      strokeWeight(3);
      if (position >= 0 && position < backgroundWidth) {
        line(355-position, 495, 360-position, 510);
      } else {
        line(355 + xoff, 495, 360 + xoff, 510);
      }
      //saw.freq(random(200, 220));
      //saw.amp(0.1);
      life--;
    }
  }
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  void display() {
    noStroke();
    fill(255);
    if (position >= 0 && position <= backgroundWidth) {
      ellipse(location.x - position, location.y, 6, 6);
      //println(location.x - position);
    } else {
      ellipse(location.x + xoff, location.y, 6, 6);
    }
  }
  boolean isDead() {
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
  boolean isBreeding() {
    if (food >= 10) {
      return true;
    } else {
      return false;
    }
  }
}


class Parasite {
  ArrayList<Fly> flys = new ArrayList<Fly>();
  int population;
  PVector target;
  int isSent;

  Parasite() {
    population = 30;
    target = new PVector(360, 510);
    for (int i = 1; i <= population; i++) {
      flys.add(new Fly());
    }
  }
  void update() {
    for (int i = flys.size()-1; i >= 0; i--) { 
      Fly n = flys.get(i);
      n.update(target);
      n.display();
      if (n.isBreeding() && population < 50) {
        //saw.freq(2000);
        //saw.amp(0.2);
        flys.add(new Fly());
        n.food = 0;
        population++;
      }
      if (n.isDead()) {
        //saw.freq(1000);
        //saw.amp(0.2);
        population--;
        flys.remove(i);
      }
      if (population < 5) {
        flys.add(new Fly());
        population++;
      }
    }
    //println(population);
  }
  void send() {
    //if (uglyTree.charge < 50 && isSent != 1) {
    //  flysState = 1;
    //  //myPort.write(33);
    //  println("not enough charge");
    //  isSent = 1;
    //}
    //if (uglyTree.charge > 50 && isSent !=2) {
    //  flysState = 2;
    //  //myPort.write(34);
    //  println("can activate");
    //  isSent = 2;
    //}
    //if (showFlys == true && isSent != 3) {
    //  //myPort.write(35);
    //  flysState = 3;
    //  println("scroll to continoue");
    //  isSent = 3;
    //}
  }
}