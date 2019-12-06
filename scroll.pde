void scroll() {
  if (scrollPos == 0 && order == 12) {
    order = 12;
    scrollPos = 0;
  }
  if (scrollPos == -backgroundWidth && order == 12) {
    order = 21;
    scrollPos = 0;
  }
  if (scrollPos == -backgroundWidth && order == 21) {
    order = 12;
    scrollPos = 0;
  }
  if (scrollPos == backgroundWidth && order == 21) {
    order = 12;
    scrollPos = 0;
  }
  if (scrollPos == backgroundWidth && order == 12) {
    order = 21;
    scrollPos = 0;
  }
  if (order == 12) {
    image(leftImg, -scrollPos, 0+yoff);
  } 
  if (order == 21) {
    image(rightImg, -scrollPos, 0+yoff);
  }
  if (scrollPos >= 0) {
    if (order == 12) {
      image(rightImg, backgroundWidth-scrollPos, 0+yoff);
    }
    if (order == 21) {
      image(leftImg, backgroundWidth-scrollPos, 0+yoff);
    }
    // calculate global position
    if (order == 12) {
      position = scrollPos;
    }
    if (order == 21) {
      position = scrollPos + backgroundWidth;
    }
  }
  if (scrollPos < 0) {
    if (order == 12) {
      image(rightImg, -backgroundWidth-scrollPos, 0+yoff);
    }
    if (order == 21) {
      image(leftImg, -backgroundWidth-scrollPos, 0+yoff);
    }
    // calculate global position
    if (order == 12) {
      position = backgroundWidth*2+scrollPos;
    }
    if (order == 21) {
      position = scrollPos + backgroundWidth;
    }
  }
  if (position > backgroundWidth) {
    xoff = backgroundWidth*2-position;
  }
}