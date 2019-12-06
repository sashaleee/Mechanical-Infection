void BottomText(int x, String text) {
  fill(255);
  rect(x, height - 30 + yoff, 200, 30);
  fill(0);
  textAlign(CENTER);
  text(text, x + 100, height - 10 + yoff);
}