Prey prey;
int[] array_test = new int[4];
int[] p_predator =new int[2];
int[] p_prey =new int[2];
int[] p_ipredator = new int[2];
int[] p_iprey =new int[2];
int i =0;
int[] temp1 = {600,50};
int[] temp2 = {600,50};
int[] temp3 = {600,50};
int[] temp4 = {600,50};
void setup() {
  size(1400,400);
  frameRate(1);
  prey = new Prey();
  }


void draw() {
    smooth();
    prey.generate();
    array_test=prey.generate();
    //if(keyPressed){
    //    if (key =='l'){
    line(600, 50, 600, 350);
    line(600,350,950,350);
    textSize(10);
    fill(0, 102, 153);
    text("100", 590, 50);
    text("80", 590, 110);
    text("60", 590, 170);
    text("40", 590, 230);
    text("20", 590, 290);
    text("0", 590, 350);
    p_predator[1]=(int)(array_test[0]*(-3)+350);
    p_predator[0]=610+i;
    p_ipredator[1]=(int)(array_test[1]*(-3)+350);
    p_ipredator[0]=610+i;
    p_prey[1]=(int)(array_test[2]*(-3)+350);
    p_prey[0]=610+i;
    p_iprey[1]=(int)(array_test[3]*(-3)+350);
    p_iprey[0]=610+i;
    i +=10;
    
    stroke(0, 0, 255);
    point(p_predator[0],p_predator[1]);
 
    stroke(255, 0, 255);
    point(p_ipredator[0],p_ipredator[1]);

    stroke(0, 255, 0);
    point(p_prey[0],p_prey[1]);

    stroke(255, 255, 0);
    point(p_iprey[0],p_iprey[1]);

    stroke(0, 0, 255);
    line(temp1[0], temp1[1], p_predator[0], p_predator[1]);
    temp1[0] = p_predator[0];
    temp1[1] = p_predator[1];

    stroke(255,0,255);
    line(temp2[0],temp2[1],p_ipredator[0],p_ipredator[1]);
    temp2[0] =p_ipredator[0];
    temp2[1] =p_ipredator[1];

    stroke(0, 255, 0);
    line(temp3[0],temp3[1],p_prey[0],p_prey[1]);
    temp3[0]=p_prey[0];
    temp3[1]=p_prey[1];

    stroke(255,255,0);
    line(temp4[0],temp4[1],p_iprey[0],p_iprey[1]);
    temp4[0]=p_iprey[0];
    temp4[1]=p_iprey[1];
    //}
//}  
    strokeWeight(0);
    bar_chart();
    fill(0);
    rect(1040,350,30,-2*array_test[0]);
    fill(255);
    rect(1040,350-2*array_test[0],30,-400);
    fill(0);
    rect(1110,350,30,-2*array_test[1]);
    fill(255);
    rect(1110,350-2*array_test[1],30,-400);
    fill(0);
    rect(1180,350,30,-2*array_test[2]);
    fill(255);
    rect(1180,350-2*array_test[2],30,-400);
    fill(0);
    rect(1250,350,30,-2*array_test[3]);
    fill(255);
    rect(1250,350-2*array_test[3],30,-400);
    
    textSize(16);
    if(mouseX>1040 && mouseX<1070) {  
        fill(0, 102, 153);
        text(array_test[0], 1050, 300);
    }
    if(mouseX>1110 && mouseX<1140) {
        fill(0, 102, 153);
        text(array_test[1],1120,300);
    }
    if(mouseX>1180 && mouseY<1210){
        fill(0, 102, 153);
        text(array_test[2],1190,300);
    }
    if(mouseX>1250 && mouseY<1280){
        fill(0, 102, 153);
        text(array_test[3],1260,300);
    }

    
        


    strokeWeight(1);
    prey.display();
  //}
}

void bar_chart(){
    line(1000, 50, 1000, 350);
    line(1000,350,1350,350);
    textSize(10);
    fill(0, 102, 153);
    text("150", 990, 50);
    text("120", 990, 110);
    text("90", 990, 170);
    text("60", 990, 230);
    text("30", 990, 290);
    text("0", 990, 350);
    text("predator",1040,355);
    text("ipredator",1100,355);
    text("prey",1160,355);
    text("iprey",1220,355);
}

void mousePressed(){
  prey.init();
  background(255);
  i=0;
  temp1[0] = 600;
  temp1[1] = 50;
  temp2[0] = 600;
  temp2[1] = 50;
  temp3[0] = 600;
  temp3[1] = 50;
  temp4[0] = 600;
  temp4[1] = 50;
  }


