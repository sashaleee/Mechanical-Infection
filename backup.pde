//void dayNight() {
//  if (day == true && time >= 0 && time<130) {
//    fill(0, time);
//    rect(0, 0, width, height);
//  }
//  if (day == false && time >= 0 && time<130) {
//    fill(0, 130-time);
//    rect(0, 0, width, height);
//  }
//  if (time > 130) {
//    fill(0);
//    rect(0, 0, width, height);
//    time = 0;
//    day = !day;
//  }
//}

//class Seed {
//  PVector location;
//  PVector velocity;
//  PVector acceleration;
//  PVector attraction;

//  int life;
//  Seed() {
//    location = new PVector(0, height/2);
//    velocity = new PVector(random(-3, 3), random(-3, -1));
//    acceleration = new PVector(0, 0.05);
//    //attraction = new PVector(0, 10);
//    life = 100;
//  }
//  void move() {
//    if (trees.size() < 5) {

//      //attraction.sub(location);
//      //attraction.setMag(0.03);
//      velocity.add(acceleration);
//      location.add(velocity);
//      if (location.y > height  && (trees.size() < 15)) {
//        seed = new Seed();
//      }
//      if (location.y > height && (location.x < 3160+width/2-30 || location.x > 3160-width/2+30)) {
//        trees.add(new Tree(3160-location.x));
//      }
//    }
//  }
//  void show() {
//    fill(255);
//    ellipse(3160+location.x-position, location.y, 5, 5);
//    //println(3160+location.x-position);
//  }
//}

//int scroll() {
//  //if (scrollPos == 0 && current == leftNorm) {
//  //  current = leftNorm;
//  //  next = rightNorm;
//  //  scrollPos = 0;
//  //}

//  //if (scrollPos == -backgroundWidth && current == leftNorm) {
//  //  current = rightNorm;
//  //  next = leftNorm;
//  //  scrollPos = 0;
//  //}

//  //if (scrollPos == -backgroundWidth && current == rightNorm) {
//  //  current = leftNorm;
//  //  next = rightNorm;
//  //  scrollPos = 0;
//  //}

//  //if (scrollPos == backgroundWidth && current == rightNorm) {
//  //  current = leftNorm;
//  //  next = rightNorm;
//  //  scrollPos = 0;
//  //}

//  //if (scrollPos == backgroundWidth && current == leftNorm) {
//  //  current = rightNorm;
//  //  next = leftNorm;
//  //  scrollPos = 0;
//  //}
//  //image(current, -scrollPos, 0+yoff);

//  //if (scrollPos >= 0) {
//  //  image(next, backgroundWidth-scrollPos, 0+yoff);
//  //  // calculate global position
//  //  if (current == leftNorm) {
//  //    position = scrollPos;
//  //  }
//  //  if (current == rightNorm) {
//  //    position = scrollPos + backgroundWidth;
//  //  }
//  //}

//  //if (scrollPos < 0) {
//  //  image(next, -backgroundWidth-scrollPos, 0+yoff);
//  //  // calculate global position
//  //  if (current == leftNorm) {
//  //    position = backgroundWidth*2+scrollPos;
//  //  }
//  //  if (current == rightNorm) {
//  //    position = scrollPos + backgroundWidth;
//  //  }
//  //}
//  leftImg = leftNorm;
//  rightImg = rightNorm;
//  if (scrollPos == 0 && order == 12) {
//    side = true;
//    current = leftImg;
//    next = rightImg;
//    scrollPos = 0;
//  }

//  if (scrollPos == -backgroundWidth && order == 12) {
//    side = false;
//    current = rightImg;
//    next = leftImg;
//    scrollPos = 0;
//  }

//  if (scrollPos == -backgroundWidth && order == 21) {
//    side = true;
//    current = leftImg;
//    next = rightImg;
//    scrollPos = 0;
//  }

//  if (scrollPos == backgroundWidth && order == 21) {
//    side = true;
//    current = leftImg;
//    next = rightImg;
//    scrollPos = 0;
//  }

//  if (scrollPos == backgroundWidth && order == 12) {
//    side = false;
//    current = rightImg;
//    next = leftImg;
//    scrollPos = 0;
//  }
//  image(current, -scrollPos, 0+yoff);

//  if (scrollPos >= 0) {
//    image(next, backgroundWidth-scrollPos, 0+yoff);
//    // calculate global position
//    if (order == 12) {
//      position = scrollPos;
//    }
//    if (order == 21) {
//      position = scrollPos + backgroundWidth;
//    }
//  }

//  if (scrollPos < 0) {
//    image(next, -backgroundWidth-scrollPos, 0+yoff);
//    // calculate global position
//    if (order == 12) {
//      position = backgroundWidth*2+scrollPos;
//    }
//    if (order == 21) {
//      position = scrollPos + backgroundWidth;
//    }
//  }

//  //Objects position
//  // electric grass
//  if ((position >= 64  && position < 256)) {
//    BottomText(-position+465, "Electric Grass");
//  }

//  // Ugly Fruit
//  if (position >= 512 && position < 768) {
//    BottomText(-position+512+700, "Hairy Stroberry Tree");
//  }
//  if ((position >= 4069 && position <4608)) {
//    BottomText(-position+4069+655, "Water Tree");
//    yoff = -256;
//  } else {
//    yoff = 0;
//  }
//  if ((position >= 1024 && position <2096)) {
//    BottomText(-position+1024+768, "Mainframe Wreckage");
//  }
//  if ((position >= 2000 && position <2464)) {
//    BottomText(-position+2000+650, "Ore Mining Tree");
//  } else {
//  }



//  if ((position >= 2592 && position <3400)) {
//    BottomText(-position+2592+460, "New Life");
//  }
//  if ((position >= 3264 && position <3648)) {
//    BottomText(-position+3264+320, "Ponter Tree");
//  }

//  return position;
//}