void serialRead() {
  if (myPort.available() > 0) {
    serialValue = myPort.readStringUntil(lf);
    if (serialValue != null) {
      if (float(serialValue) == 0) {
        scrollPos += step;
      }
      if (float(serialValue) == 1) {
        scrollPos -= step;
      }
      if (float(serialValue) == 11) {
        buttonA = true;
      } else {
        buttonA = false;
      }
    }
  }
}