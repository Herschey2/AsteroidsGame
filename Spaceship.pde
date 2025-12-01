class Spaceship extends Floater  
{   
    private float thrust;
    private boolean isThrusting;
    public Spaceship(){
      corners=5;
      xCorners = new int[]{-8,16,-8,-4,-4};
      yCorners = new int[]{-8,0,8,5,-5};
      myCenterX=width/2;
      myCenterY=height/2;
      myXspeed=0;
      myYspeed=0;
      myPointDirection=0;
      myColor=255;
    }
    public void setThrusting(boolean t) {
      isThrusting = t;
    }
  
    public void thruster() {
      if (isThrusting) {
        thrust += 0.5; 
        if (thrust > 20) thrust = 20; 
      } else {
        thrust -= 0.5;
        if (thrust < 0) thrust = 0;
      }
      float pulse = 0;
      if (isThrusting) {
        pulse = sin(millis() * 0.02) * (float)Math.random()*3;
      }
  
      if (thrust > 0) {
        pushMatrix();
        translate((float)myCenterX, (float)myCenterY);
        rotate(radians((float)myPointDirection));
        float flameLength = thrust + pulse; 
        triangle(-4, -3, -4, 3, -8-flameLength, 0);
  
        popMatrix();
      }
    }
    public void setX(int x){myCenterX=x;}  
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY=y;}   
    public int getY(){return (int)myCenterY;}   
    public void setXspeed(double x){myXspeed = x;}   
    public double getXspeed(){return myXspeed;}   
    public void setYspeed(double y){myYspeed = y;}   
    public double getYspeed(){return myYspeed;}  
    public void setPointDirection(double degrees){myPointDirection = degrees;}   
    public double getPointDirection(){return myPointDirection;}
}
