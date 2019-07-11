int h = hour();
int min = minute();
int seg = second();
float f = h*PI/6 + 3*PI/2;
float fm = min*PI/30 +3*PI/2;
float fs = seg*PI/30 +3*PI/2;
float ang = 2*PI / 60;
 
void setup() {
  size(500,500);
}

void draw() {
  background(255);
  
  stopWatch(height/2,width/2,350);
  horas(height/2, width/2, 100, f);
  minutos(height/2,width/2, 150, fm);
  segundos(height/2,width/2, 190, fs);
  
 

  if(h != hour()){
    h=hour();
    f = h*PI/6 + 3*PI/2;
  }
  if(seg != second()){
    seg=second();
    fs = seg*PI/30 +3*PI/2;
  }
 
}

//cria ponteiro de horas
void horas(float x, float y, float raio, float f) {
  noFill(); 
    float Vx = x + cos(f) * raio;
    float Vy = y + sin(f) * raio;
    stroke(0,255,0);
    strokeWeight(5);
    line(x,y,Vx,Vy);
   
}

// cria ponteiro dos minutos
void minutos(float x, float y, float raio, float f) {
  noFill(); 
    float VxM = x + cos( ((minute()*60 + second())*PI/1800)+ 3*PI/2 ) * raio;
    float VyM = y + sin( ((minute()*60 + second())*PI/1800)+ 3*PI/2  ) * raio;
    stroke(255,0,0);
    strokeWeight(5);
    line(x,y,VxM,VyM);
}

//cria ponteiro dos segundos
void segundos(float x, float y, float raio, float f) {
  noFill(); 
    float VxS = x + cos(f) * raio;
    float VyS = y + sin(f) * raio;
    stroke(0,0,255);
    strokeWeight(5);
    line(x,y,VxS,VyS);
}


//gera a imagem do relogio

void stopWatch(int x, int y, int raio){
  noStroke();
  fill(125);
  fill(0);
  circle(x, y, raio+70);
 
 //indicador de cada segundo
 for (float f = 0; f < 2*PI; f += ang) {
    float Vx = x + cos(f) * (raio-150);
    float Vy = y + sin(f) * (raio-150);
    fill(255);
    ellipse(Vx, Vy, 3, 3);
 }
 
 // indicador dos pontos 12, 3, 6 e 9
 for (float i = 0; i < 2*PI; i+= PI/2){
   float Px = x + cos(i) * (raio-150);
   float Py = y + sin(i) * (raio-150);
   fill(255,0,0);
   ellipse (Px, Py, 8,8);
 }
 
 //indicadores das casas principais do relogio, do 1 ao 12
 for (float i = 0; i < 2*PI; i+= PI/6){
   float Px = x + cos(i) * (raio-150);
   float Py = y + sin(i) * (raio-150);
   fill(255,0,0);
   ellipse (Px, Py, 3,3);
 }
 
  fill(255);
  textSize(20);
  text(h+ " : "+min+" : "+seg, x-50, y+150);
}
