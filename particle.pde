class Particles
{
  private double pX, pY, pAngle, pSpeed;
  private int opac;

  public double getX() { return pX; }
  public void setX(double x) { pX = x; }
  public double getY() { return pY; }
  public void setY(double y) { pY = y; }
  public double getAngle() { return pAngle; }
  public void setAngle(double a) { pAngle = a; }
  public double getSpeed() { return pSpeed; }
  public void setSpeed(double s) { pSpeed = s; }
  public void setOpac(int o) {opac =o;}

  public Particles(int x, int y){
    pX=x;
    pY=y;
    opac=255;
    pAngle=Math.random()*PI*2;
    pSpeed=.1;
  }
  public void move(){
    pX += Math.cos(pAngle) * pSpeed*20;
    pY += Math.sin(pAngle) * pSpeed*20;
    opac-=4;
  }
  public void show(){
    fill(255, opac);
    noStroke();
    rect((float)pX, (float)pY, 3, 3);
  }
}
