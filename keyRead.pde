void keyRead() {
  if (keyPressed) {
    if (keyCode == RIGHT) {
      scrollPos += step;
    } 
    if (keyCode == LEFT) {
      scrollPos -= step;
    }
    if (key == ' ') {
      buttonA = true;
    }
  }
}

void keyReleased() {
  buttonA = false;
}