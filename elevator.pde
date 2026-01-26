Elevator elevator1;
Elevator elevator2;
People2 people1;
void setup() {
  size(600, 600);
  elevator1= new Elevator(425, 505, 2);
  elevator2=new Elevator(175, 505, 3);
  people1 = new People2();
}

void draw() {
  background(255);
  rectMode(CENTER);
  //一階
  line(0, 580, width, 580);
  //二階
  line(0, 375, width, 375);
  //三階
  line(0, 170, width, 170);
  elevator1.show();
  elevator2.show();
  elevator1.stop();
  elevator2.stop();
  for (People p : people1) {
    p.show(elevator1,elevator2);
  }
}

void keyPressed() {
  if (key == 'a') {
    people1.addOnePerson();
  }
}

class People extends Object {
  int speed=1;
  People(int x, int y, int n) {
    super(x, y, n);
    this.isRaised=false;
  }
  void show(Elevator e,Elevator e2) {
    pushMatrix();
    translate(this.x, this.y);
    fill(0);
    circle(0, 0, 20);
    line(0, 0, 0, 65);
  //手
  if(n==2){
    line(0,20,10,50);
    line(0,20,-10,50);
  }else{
    line(0,30,30,0);
    line(0,30,-30,0);}
    //脚
    line(0,65,10,75);
    line(0,65,-10,75);
    
    boolean isBlocked = false;
  for (People other : people1) {
    if (other != this && other.y == this.y) { // 同じ階にいる他の人をチェック
      float distance = this.x - other.x;
      if (distance > 0 && distance < 40) { // 40px以内に前の人がいたら
        isBlocked = true;
        break;
      }
    }
  }

  if (!isBlocked) {
    x = x - speed; // 前が空いている時だけ進む
  }
  
    popMatrix();
    if (n==2 && x==e.x) {
      x=e.x;
      speed=0;
      if (e.y==505|| isRaised==true) {
       this.stop();
       e.isEmpty=false;
      }
      if (y==300) {
        e.isEmpty=true;
        speed=1;
      }
    } else if (n==3 && x==e2.x) {
      x=e2.x;
      speed=0;
      if (e2.y==505 || isRaised==true) {
        this.stop();
        e2.isEmpty=false;
      }
      if (y==95) {
        e2.isEmpty=true;
        speed=1;
      }
    }
  }
}

class People2 extends ArrayList<People> {
  People2() {
    super();
  }
  void addOnePerson() {
    int n=2+int(random(2));
    this.add(new People(width, 505, n));
  }
}

class Object {
  int x, y, n;
  boolean isRaised;
  Object(int x, int y, int n) {
    this.x = x;
    this.y = y;
    this.n = n;
    this.isRaised = true;
  }
  void stop() {
    if (this.isRaised) {
      y-=1;
    } else {
      y+=1;
    }
    if (n==1 && y==505 || n==2 && y==300 || n==3 && y==95 ) {
      isRaised=false;
    }
    if (y>505) {
      isRaised=true;
    }
  }
}

class Elevator extends Object {
  boolean isEmpty;
  Elevator(int x, int y, int n) {
    super(x, y, n);
    this.isEmpty=true;
  }
  void show() {
    if (n==2) {
      x=425;
    } else {
      x=175;
    }
    if(isEmpty==false){
    fill(100);}
    else{
    fill(255);
    }
    square(x, y, 150);
  }
}
