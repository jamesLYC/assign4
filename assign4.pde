int m = 0;
int n = -640;
int nbrFl = 5;
int timer = 0;
int flame_time = 0;
float a = random(122,297);
float [] ewave1x = new float[5];
float [] ewave1y = new float[5];
float [] ewave2x = new float[5];
float [] ewave2y = new float[5];
float [] ewave3x = new float[8];
float [] ewave3y = {a,a-61,a+61,a-122,a+122,a-61,a+61,a};
float enemyx = 0;
float enemyy = 0;
float k = random(0,599);
float s = random(0,439);
float l = 38;
float fighterx = 589;
float fightery = 240;
float speed = 5;
float flameX = 10000;
float flameY = 10000;
boolean GameState;
boolean GameOver;
boolean upPressed;
boolean downPressed;
boolean leftPressed;
boolean rightPressed;
boolean wave1;
boolean wave2;
boolean wave3;
boolean crush1;
boolean crush2;
boolean crush3;
PImage bg1;
PImage bg2;
PImage enemy;
PImage fighter;
PImage hp;
PImage treasure;
PImage start;
PImage start2;
PImage end;
PImage end2;
PImage [] flame;
void setup () {
   size(640, 480) ;
   bg2 = loadImage("img/bg2.png");
   bg1 = loadImage("img/bg1.png");
   enemy = loadImage("img/enemy.png");
   fighter = loadImage("img/fighter.png");
   hp = loadImage("img/hp.png");
   treasure = loadImage("img/treasure.png");
   start = loadImage("img/start2.png");
   start2 = loadImage("img/start1.png");
   end = loadImage("img/end2.png");
   end2 = loadImage("img/end1.png");
   flame = new PImage[nbrFl];
   for(int b = 0;b < nbrFl;b++){
   flame[b] = loadImage("img/flame"+(b+1)+".png");
   }
   GameState = false;
   wave1 = false;
   wave2 = false;
   wave3 = false;
   crush1 = false;
   crush2 = false;
   crush3 = false;
}

void draw() {
  image(bg2,m,0);
  image(bg1,n,0);
  image(fighter,fighterx,fightery);
  fill(225,0,0);
  rect(13,5,l,15);
  image(hp,0,0);
  image(treasure,k,s);
  if(GameState == false){
    image(start,0,0);
    enemyx = 0;
  }
  m++;
  n++;
  while(m>640){
    m = -640;
  }
  while(n>640){
    n = -640;
  }
    
  if(GameState == false && mouseX > 200 && mouseX < 440 && mouseY >360&& mouseY <420){
   image(start2,0,0);
   if(mousePressed){
   GameState = true;
   wave1 = true;
   enemyy = random(0,419);
   }
  }
  
  
 
  if(wave1 == true && crush1 == false){
    for(int i = 0 ; i < ewave1x.length ; i++){
      ewave1x[i] = enemyx - (i*61);
      ewave1y[i] = enemyy;
      image(enemy,ewave1x[i], ewave1y[i]);
    }
  }
    if(wave1 == true){
    for(int i = 0 ; i < ewave1x.length ; i++){
    if(ewave1x[i]-fighterx<=61&&ewave1x[i]-fighterx>=-61&&ewave1y[i]-fightery<=61&&ewave1y[i]-fightery>=-61){
      crush1 = true;
    ewave1y[i]+=1000;
    l = l-38;
    flameX = ewave1x[i];
    flameY = ewave1y[i]-1000;
    flame_time = 0;
    }
     
     image(enemy,ewave1x[i], ewave1y[i]);
     ewave1x[i] += 6;
     }
    }
  if(wave1 == true && enemyx > 884){
  wave1 = false;
  wave2 = true;
  crush2 = false;
  enemyx = 0;
  enemyy = random(0,175);
  }
  if(wave2 == true && crush2 == false){
     for(int i = 0 ; i < ewave2x.length ; i++){
       ewave2x[i] = enemyx - (i*61);
       ewave2y[i] = enemyy + (i*61);
       image(enemy, ewave2x[i], ewave2y[i]);
     }
  }
     if(wave2 == true){
      for(int i = 0 ; i < ewave2x.length ; i++){
     if(ewave2x[i]-fighterx<=61&&ewave2x[i]-fighterx>=-61&&ewave2y[i]-fightery<=61&&ewave2y[i]-fightery>=-61){
      crush2 = true;
      ewave2y[i]+=1000;
      l = l-38;
    flameX = ewave2x[i];
    flameY = ewave2y[i]-1000;
    flame_time = 0;
     }
     image(enemy, ewave2x[i], ewave2y[i]);
     ewave2x[i] += 6;
  }
  
  } 
  if(wave2 == true && enemyx > 884){
  wave2 = false;
  wave3 = true;
  crush3 = false;
  enemyx = 0;
  }
   if(wave3 == true && crush3 == false){
     float k=0;
      for(int i = 0 ; i < ewave3x.length ; i++){
        if(ewave3y[i] > 1000){
        ewave3y[i] -= 1000;
        }
      ewave3x[i] = enemyx-ceil(k/2)*61;
      k++;
      image(enemy, ewave3x[i], ewave3y[i]);
      }
   }
    if(wave3 == true){
      for(int i = 0 ; i < ewave3x.length ; i++){
     if(ewave3x[i]-fighterx<=61&&ewave3x[i]-fighterx>=-61&&ewave3y[i]-fightery<=61&&ewave3y[i]-fightery>=-61){
      crush3 = true;
      ewave3y[i]+=1000;
      l = l-38;
    flameX = ewave3x[i];
    flameY = ewave3y[i]-1000;
    flame_time = 0;
     }
     image(enemy, ewave3x[i], ewave3y[i]);
     ewave3x[i] += 6;
  }
  
  }
  if(wave3 == true && enemyx > 884){
  wave3 = false;
  wave1 = true;
  crush1 = false;
  enemyx = 0;
  enemyy = random(0,419);
  }
  image(flame[flame_time],flameX,flameY,60,60);
  timer++;
  if(timer>6){
    flame_time++;
    timer = 0;
  }
  if(flame_time>=flame.length){
             flameX=10000;
             flameY=10000;
             flame_time=0;
           }
   
  if(GameOver == true){
    image(end,0,0);
    wave1 = true;
    wave2 = false;
    wave3 = false;
    crush1 = false;
    crush2 = false;
    crush3 = false;
    fighterx = 589;
    fightery = 240;
    enemyx = 0;
    enemyy = random(0,429);
    l = 38;
    m = 0;
    n = -640;
   }
  if(GameOver == true && mouseX > 200 && mouseX < 440 && mouseY >300&& mouseY <360){
   image(end2,0,0);
   if(mousePressed){
   GameOver = false;
   }
  }
  

  if(upPressed){
    fightery -= speed;;
  }
  if(downPressed){
    fightery += speed;
  }
  if(leftPressed){
    fighterx -= speed;
  }
  if(rightPressed){
    fighterx += speed;
  }
  if (fighterx > 589 ){
    fighterx = 589;
  }
  if (fighterx < 0){
    fighterx = 0;
  }
  if (fightery > 429){
    fightery = 429;
  }
  if (fightery < 0){
   fightery = 0;
  }
  if(m > 640){
    m = 0;
  }

 
  if(k-fighterx<=41&&k-fighterx>=-41&&s-fightery<=41&&s-fightery>=-41){
    k = random(0,599);
    s = random(0,439);  
    l = l+19;
  }
  if(l > 190){
    l = 190;
  }
  if(l <= 0){
  GameOver = true;
  }
  enemyx+=6;
}
void keyPressed(){
  
  
  if (key == CODED){
    switch(keyCode){
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
}
}
void keyReleased(){
    if (key == CODED){
    switch(keyCode){
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
      }
      }
}
