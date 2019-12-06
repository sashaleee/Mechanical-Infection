class Tree {
  float theta;
  float location;
  float len;
  float ang;
  float life;
  float water;
  float l;
  float y;
  float lastBirth;
  float birthTime;

  Tree(float location_) {
    location = location_;
    water = 0;
    ang = random(1, 4);
    l = random(120, 250);
    y = random(30, 150);
    lastBirth = 0;
    birthTime = time;
  }

  void grow() {
    if (environment.rain.isRaining == true && water < 1000) {
      water += 0.8;
      //sine.freq(water/2);
      //sine.amp(0.1);
    }
    if (environment.rain.isRaining == true && life <1000) {
      life +=5;
    }
    if (environment.rain.isRaining == false && life > 0) {
      water--;
      life -= 6;
      //sine.amp(0);
    }
  }
  void show() {
    stroke(255);
    strokeWeight(int(map(water, 0, 1000, 1, 4)));
    float b = map(life, 0, 1000, 15, 35 );
    len = map(water, 0, 1000, 10, l);
    theta = radians(b);
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    translate(location-position, height-y);
    // Draw a line 120 pixels
    line(0, 0, 0, -len);
    // Move to the end of that line
    translate(0, -len);
    // Start the recursive branching!
    branch(len);
    popMatrix();
    //println("life:"+life);
  }
  void multiply() {
    if (environment.trees.size() < 4 && time - lastBirth > 1000 && water >= 998) {
      environment.trees.add(new Tree(location+random(random(-300, -50), random(50, 300))));
      lastBirth = time;
    }
    //println(trees.size());
  }
  boolean death() {
    if (time-birthTime > 6000) {
      //sine.freq(2000);
      //sine.amp(0.5);
      return true;
    } else {
      return false;
    }
  }

  void branch(float h) {
    float a = map(water, 0, 1000, 0.26, 0.46); 
    h *= a;
    if (h > 2) {
      pushMatrix();    // Save the current state of transformation (i.e. where are we now)
      rotate(theta);   // Rotate by theta
      line(0, 0, 0, -h/ang);  // Draw the branch
      translate(0, -h/ang); // Move to the end of the branch
      branch(h);       // Ok, now call myself to draw two new branches!!
      popMatrix();     // Whenever we get back here, we "pop" in order to restcoal the previous matrix state

      // Repeat the same thing, only branch off to the "left" this time!
      pushMatrix();
      rotate(-theta);
      line(0, 0, 0, -h);
      translate(0, -h);
      branch(h);
      popMatrix();
    }
  }
}