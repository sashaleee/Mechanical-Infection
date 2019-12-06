class Environment {
  Rain rain;
  ArrayList<Tree> trees;
  Environment() {
    rain = new Rain();
    trees = new ArrayList<Tree>();
    trees.add(new Tree(3075));
  }
  void run() {
    for (Tree t : trees) {
      t.grow();
      t.show();
      //t.multiply();
    }
    rain.update();
    rain.show();
  }
  void screenShake() {
    if (ecoSystem.miningTree.isActive == true && position >= 2000 && position < 2464) {
      translate(random(-2, 2), random(-2, 2));
      //saw.freq(random(40, 70));
      //saw.amp(0.3);
    }  else {
      translate(0, 0);
      //saw.amp(0);
    }
  }
  void starField() {
    pushMatrix();
    theta = map(position, 0, 5168, -500, 500); 
    //theta = 200;
    translate(theta, height/2);
    for (int i = 0; i < stars.length; i++) {
      stars[i].update();
      stars[i].show();
    }
    popMatrix();
  }
}
/////////////////////////////////////////////////////////////////
class Rain {
  boolean isRaining;
  float rainStartTime;
  float rainDuration;
  float interval;
  int nextRainTime;
  float tr;
  Rain() {
    isRaining = false;
    rainStartTime = time;
    rainDuration = random(800, 2000); // 800 2000
    interval = random(1000, 3500); 
    nextRainTime = int(rainStartTime + rainDuration + interval);
    for (int i = 0; i < drops.length; i++) {
      drops[i] = new Drop();
      //println(rainDuration);
      //println(nextRainTime);
    }
  }
  void update() {
    if (time > rainStartTime && time < rainStartTime + rainDuration) {
      isRaining = true;
    } else {
      isRaining = false;
    }
    if (time >= nextRainTime) {
      isRaining = false;
      environment.rain = new Rain();
    }
  }
  void show() {
    if (isRaining == true) {
      //rain noise
      if (time-rainStartTime < 30) {
        float a = map(time-rainStartTime, 0, 30, 0, 0.1);
        rainSound.amp(a);
      } else if (rainDuration+rainStartTime-time < 100) {
        float a = map(rainDuration+rainStartTime-time, 100, 0, 0.1, 0);
        rainSound.amp(a);
      } else {
        rainSound.amp(0.1);
      }
      // drops transparency
      if ((time-rainStartTime < 150)) {
        tr = (time-rainStartTime)*4;
      } else if (rainDuration+rainStartTime-time < 150) {
        tr = rainDuration+rainStartTime-time;
      } else {
        tr = 255;
      }
      for (int i = 0; i < drops.length; i++) {
        drops[i].fall();
        drops[i].show(tr);
      }
    }
  }
}
//////////////////////////////////
class Star {
  float x;
  float y;
  float z;
  float pz;

  Star() {
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width/2);
    pz = z;
  }

  void update() {
    z = z - speed;
    if (z < 1) {
      z = width/2;
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      pz = z;
    }
  }
  void show() {
    //fill(255);
    noStroke();
    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/1.2);
    float r = map(z, 0, width/2, 5, 0);
    fill(255);
    ellipse(sx, sy, r, r);
    pz = z;

    //    stroke(255);
    //  line(px, py, sx, sy);
  }
}

class Sand {
  PVector location;
  PVector velocity;
  PVector acceleration;
  color c;
  Sand() {
    c = int(random(128, 255));
    location = new PVector(random(-3, 3), 385);
    velocity = new PVector(random(-0.5, 0.5), random(1.9, 2));
    acceleration = new PVector(0, 0.1);
  }
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(8);

    if (location.y > 500) {
      location = new PVector(random(-3, 3), 385);
      velocity = new PVector(random(-0.5, 0.5), random(1.9, 3));
    }
  }
  void show() {
    fill(c);
    stroke(c);
    rect(location.x+1904-position+1020, location.y, 5, 5);
  }
}

class Drop {
  float x;
  float y;
  float z;
  float len;
  float yspeed;
  Drop() {
    x  = random(0, width);
    y  = random(-500, -50);
    z  = random(0, 30);
    len = map(z, 0, 20, 1, 10);
    yspeed  = map(z, 0, 30, 10, 30);
  }
  void fall() {
    y = y + yspeed;
    float grav = map(z, 0, 20, 0, 0.2);
    yspeed = yspeed + grav;
    if (y > height) {
      y = random(-200, -100);
      yspeed = map(z, 0, 20, 4, 10);
    }
  }
  void show(float tr_) {
    stroke(255, tr_);
    float thick = map(z, 0, 30, 1, 2);
    strokeWeight(thick);
    line(x, y, x, y+len);
  }
}