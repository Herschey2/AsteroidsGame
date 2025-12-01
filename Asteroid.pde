class Asteroids extends Floater  
{   
  private double rotationSpeed, mySize;
  public Asteroids(){
      corners=8;
      mySize = (Math.random())+.5;
      xCorners = new int[]{16,11,0,-11,-16,-11,0,11};
      yCorners = new int[]{0,11,16,11,0,-11,-16,-11};
      for (int i = 0; i < corners; i++) {
        xCorners[i]*=mySize;
        yCorners[i]*=mySize;
        xCorners[i] +=((int)(Math.random()*10)-10)*mySize;
        yCorners[i] +=((int)(Math.random()*10)-10)*mySize;
      }
      myCenterX=(int)(Math.random()*width);
      myCenterY=(int)(Math.random()*height);
      myXspeed=(Math.random()*3-1.5);
      myYspeed=(Math.random()*3-1.5);
      myPointDirection=(Math.random()*10);
      myColor=255;
      rotationSpeed=Math.random()*3-1.5;
  }
  public Asteroids(int x, int y, double size){
    corners=8;
      mySize = size;
      xCorners = new int[]{16,11,0,-11,-16,-11,0,11};
      yCorners = new int[]{0,11,16,11,0,-11,-16,-11};
      for (int i = 0; i < corners; i++) {
        xCorners[i]*=mySize;
        yCorners[i]*=mySize;
        xCorners[i] +=((int)(Math.random()*5)-10)*mySize;
        yCorners[i] +=((int)(Math.random()*5)-10)*mySize;
      }
      myCenterX=x;
      myCenterY=y;
      myXspeed=(Math.random()*3-1.5);
      myYspeed=(Math.random()*3-1.5);
      myPointDirection=(Math.random()*10);
      myColor=255;
      rotationSpeed=Math.random()*3-1.5;
  }
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public double getMySize(){return mySize;}
  public void setSize(double s){mySize = s;}
  public void move(){
    turn(rotationSpeed);
    super.move();
  }
}
