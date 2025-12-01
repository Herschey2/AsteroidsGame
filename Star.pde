class Star {
  private int myX, myY, blinkSpeed;
  private float blink = 255;
  private boolean fadingOut = false;
  private boolean blinking = false;

  public Star() {
    myX = (int)(Math.random() * width);
    myY = (int)(Math.random() * height);
    blinkSpeed = (int)(Math.random()*5);
  }
  public void show() {
      if (!blinking && Math.random() > 0.99) {
        blinking = true;
        fadingOut = true;
      }

      if (blinking) {
        if (fadingOut) {
          blink -= blinkSpeed;
          if (blink <= 50) {
            fadingOut = false;
          }
        } else {
          blink += blinkSpeed;
          if (blink >= 255) {
            blinking = false;
            blink = 255;
          }
        }
      }
    noStroke();
    fill(255, blink);
    ellipse(myX, myY, 2, 2);
    }
}
