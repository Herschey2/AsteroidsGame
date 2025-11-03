class Spaceship extends Floater  
{   
    public Spaceship(){
      corners=5;
      xCorners = new int[]{-8,16,-8,-4,-4};
      yCorners = new int[]{-8,0,8,5,-5};
      myCenterX=width/2;
      myCenterY=height/2;
      myXspeed=0;
      myYspeed=0;
      myPointDirection=1;
      myColor=255;
    }
    public void setX(int x){myCenterX=x;}  
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY=y;}   
    public int getY(){return (int)myCenterY;}   
    public void setXspeed(double x){myXspeed = x;}   
    public double getXspeed(){return myXspeed;}   
    public void setYspeed(double y){myYspeed = y;}   
    public double getYspeed(){return myYspeed;}   
    public void setPointDirection(int degrees){myPointDirection = degrees;}   
    public double getPointDirection(){return myPointDirection;}
}
