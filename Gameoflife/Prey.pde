class Prey{
  int[][] board;
  int w =10;
  int columns,rows;

  Prey(){
    columns = 500/w;
    rows =400/w;
  
    board = new int[columns][rows];
    init();
  }


  void init(){

    for (int i =1; i< columns-1;i++){
      for(int j=1;j<rows-1;j++){
        double test =Math.random();
        if(test<=0.05) board[i][j]=4; // the probility of disease
        else if(test<0.4) board[i][j]=0; // the probility of dead prey
        else if(test<0.6) board[i][j]=-1; // the probility of dead predator
        else if(test<0.75) board[i][j]=1; // the probility of alive predator
        else if(test<=1) board[i][j]=3;  // the probility of alive prey
      }
    }


  }

int[] generate(){

    int[][] next = new int[columns+1][rows+1];
    int count_predator=0;
    int count_ipredator=0;
    int count_prey=0;
    int count_iprey=0;
    int[] array_D= new int[4];

    for(int i=1;i<columns-1;i++){
      for(int j=1;j<rows-1;j++){
        if(board[i][j]==1)
          count_predator++;
        if(board[i][j]==2)
          count_ipredator++;
        if(board[i][j]==3)
          count_prey++;
        if(board[i][j]==-2)
          count_iprey++;
      }
    }

     array_D[0] = count_predator;
     array_D[1] = count_ipredator;
     array_D[2] = count_prey;
     array_D[3] = count_iprey;


    for(int x =0;x<columns;x++){
      for(int y =0;y<rows;y++){

        int neighbors = 0;
        int neighbors2 =0;
        int anti_neighbors =0;
        int anti_neighbors2 =0;
        int food =0;
        int food2 =0;
        int competitor =0;
        int competitor2 =0;
        int host=0;
        int a_prey =0;
        int a_predator =0;
        int i_prey =0;
        int i_predator=0;
        int sign =0;
        int sign2 =0;
        int sign3 =0;
        int sign4 =0;
        int e_infected =0;
        //int count =0;


        if((board[x][y]==0)||(board[x][y]==3)){//0 dead prey, 3 alive prey.
          for (int i = -1;i<=1;i++){
            for(int j = -1; j<=1;j++){
              if(board[(x+i+columns)%columns][(y+j+rows)%rows]==3){
                neighbors += 1;           //to increase the neighbor prey
                sign4=1;
              }
              if(board[(x+i+columns)%columns][(y+j+rows)%rows]==-2){
                neighbors ++;             // to increase the neighbor prey
              }
            }
          }
          if((sign4 == 1)&&(board[x][y]==3)){// to delete its ownself if the center is alive prey
            neighbors--;
          }    
        
          for (int k = -1;k<=1;k++){
            for (int l = -1; l <= 1;l++){
              if((board[(x+k+columns)%columns][(y+l+rows)%rows]==1)||(board[(x+k+columns)%columns][(y+l+rows)%rows]==2)){
                anti_neighbors +=1;     // to show the number of predators around it.
              }
            }
          }

          if(board[x][y]==3){
            for(int m =-1;m<=1;m++){
              for(int n =-1;n<=1;n++){
                if((board[(x+m+columns)%columns][(y+n+rows)%rows]==4)||(board[(x+m+columns)%columns][(y+n+rows)%rows]==-2)){
                  i_prey=1;           // to show it will be infected
                }
              }
            }
          }
        }

        else if((board[x][y]==-1)||(board[x][y]==1)){// 1 alive predator -1 dead predator
          //if(board[x][y]==1){
            for(int o =-1;o<=1;o++){
              for(int p =-1;p<=1;p++){
                if(board[(x+o+columns)%columns][(y+p+rows)%rows]==3){
                  food ++;        // the number of prey
                }
                if(board[(x+o+columns)%columns][(y+p+rows)%rows]==-2){
                  food ++;        // the number of prey
                  i_predator=1;     // the predator is being infected.
                }
              }
            }
          //}
          //if (board[x][y]==1){
            for (int q = -1;q<=1;q++){
              for (int r =-1;r<=1;r++){
                if(board[(x+q+columns)%columns][(y+r+rows)%rows]==1){
                  competitor++;     // the number of predator around the predator +1;
                  sign=1;   
                }
                if(board[(x+q+columns)%columns][(y+r+rows)%rows]==2){
                  competitor++;     // the number of predator around the predator
                  i_predator=1;
                }
                if(board[(x+q+columns)%columns][(y+r+rows)%rows]==4){
                  e_infected=1;       //the predator is being infected
                }

              }
            }
            if((sign==1)&&(board[x][y]==1)){
              competitor --;        //to decrease the predator itself
            }
         }  
        
        else if(board[x][y]==2){// 2 infected alive predator
          for (int s = -1;s<=1;s++){
            for (int t =-1;t<=1;t++){
              if(board[(x+s+columns)%columns][(y+t+rows)%rows]==1){
                competitor2 +=1; // the number of predators around  the infected predator itself
              }
              if(board[(x+s+columns)%columns][(y+t+rows)%rows]==2){
                competitor2 +=1;// the number of infected predators around the infected predator itself.
                sign2=1;
              }
            }
          }
          if(sign2==1){
            competitor2--; // to decrease the infected predator itself.
          }
        

          for (int u = -1;u<=1;u++){
            for(int v= -1;v<=1;v++){
              if((board[(x+u+columns)%columns][(y+v+rows)%rows]==3)||(board[(x+u+columns)%columns][(y+v+rows)%rows]==-2)){
                food2++;// the number of prey increased.
              }
            }
          }
    }

    else if(board[x][y]==-2){// -2 infected alive prey
      for(int i1=-1;i1<=1;i1++){
        for(int j1=-1;j1<=1;j1++){
          if(board[(x+i1+columns)%columns][(y+j1+rows)%rows]==3){
            neighbors2++;// the number of prey increases
          }
          if(board[(x+i1+columns)%columns][(y+j1+rows)%rows]==-2){
            neighbors2++; // the number of infected prey increases.
            sign3=1;
          }
        }
      }
      if(sign3==1){
        neighbors2--;// decrease the infected prey itself.
      }

      for(int k1=-1;k1<=1;k1++){
        for(int l1=-1;l1<=1;l1++){
          if((board[(x+k1+columns)%columns][(y+l1+rows)%rows]==1)||(board[(x+k1+columns)%columns][(y+l1+rows)%rows]==2)){
            anti_neighbors2++; // the number of predators around the prey itself increases.
          }
        }
      }
    }

           
        else if(board[x][y]==4){ // 4 disease
          for(int m1=-1;m1<=1;m1++){
            for(int n1=-1;n1<=1;n1++){
              if((board[(x+m1+columns)%columns][(y+n1+rows)%rows]==1)||(board[(x+m1+columns)%columns][(y+n1+rows)%rows]==-2)||(board[(x+m1+columns)%columns][(y+n1+rows)%rows]==2)||(board[(x+m1+columns)%columns][(y+n1+rows)%rows]==3)){
                host++;// if there are alive prey/predator around the disease, it will not die.
              }
            }
          }
        }
        //if(board[x][y]==3){
        //      count++;
        //    } 
        //if(count>=columns*rows/100)
        //  next[x][y]=board[x][y];
        //else{ 
        if ((board[x][y] == 3) && (neighbors<  2)) next[x][y] = 0;           // Loneliness(alive prey bcome dead prey)
            else if ((board[x][y] == 3) && (neighbors >  3)) next[x][y] = 0;        // Overpopulation
            else if ((board[x][y] == 0) && (neighbors == 3)) next[x][y] = 3;           // prey reproduction
            else if ((board[x][y] == 3) && (anti_neighbors >neighbors)) next[x][y]=0;       // Be eaten
            else if ((board[x][y] == 3) && (i_prey == 1)) next[x][y] = -2;        // prey be infected
            //else if ((board[x][y] == 1) && (food > competitor)) next[x][y] =1;       // eat prey
            else if ((board[x][y] == 1) && (i_predator==1)) next[x][y] = 2;            //be infected by around predator
            else if ((board[x][y] == 1) && (food <= competitor)) next[x][y] =-1;       // hungury to death
            else if ((board[x][y] == 1) && (e_infected ==1)) next[x][y] =2;        // eat the infected prey
            else if ((board[x][y] == -1) && (food== 3)) next[x][y] = 3;          // prey reproduction
            else if ((board[x][y] == -1) && (competitor==2) && (food >3) ) next[x][y]=1;  // born (which is pretty hard compared to prey )
            else if ((board[x][y] == -2) && (neighbors2 >2)) next[x][y] =0;      // Overporpulation of infected prey;
            else if ((board[x][y] == -2) && (anti_neighbors2>neighbors2)) next[x][y]=0;    // Be eaten;
            else if ((board[x][y] == -2) && (neighbors2 <2)) next[x][y]=0;      //Loneliness
            //else if ((board[x][y] == 2) && (food2>2*competitor2)) next[x][y]=2;    // infected predator eat prey
            else if ((board[x][y] == 2) && (food2<= 2*competitor2)) next[x][y]=-1;  // hungury to death
            else if ((board[x][y] == 4) && (host == 0)) next[x][y] =0;        // disease died because of no host
            else                                            next[x][y] = board[x][y];  // Stasis  

        
      }
      
    }board = next;


    return(array_D);
  }
  void display(){
    for(int i =0; i<columns;i++){
      for(int j =0; j<rows;j++){

        stroke(0);
        //rect(i*w,j*w,w,w);
        if(board[i][j] == 1){
          fill(255);
          rect(i*w,j*w,w,w);
          fill(0,0,255);
          ellipse(i*w+w/2, j*w+w/2, w,w);
        } //use blue circle to represent alive predator 
        else if(board[i][j] == 4){ 
          fill(255,0,0); //disease
          rect(i*w,j*w,w,w);
        }
        else if(board[i][j] == 3){ 
          fill(255); 
          rect(i*w,j*w,w,w);
          fill(0,255,0);
          triangle(i*w, j*w, i*w+w, j*w, i*w+w/2, j*w+w);
        }//alive prey
        else if(board[i][j] == 2){
          fill(255); 
          rect(i*w,j*w,w,w);
          fill(255,0,255);
          ellipse(i*w+w/2, j*w+w/2, w, w);
        } //infected predator
        else if(board[i][j] == -2){
          fill(255); //infected prey
          rect(i*w,j*w,w,w);
          fill(255,255,0);
          triangle(i*w, j*w, i*w+w, j*w, i*w+w/2, j*w+w);
        }
        else{ 
          fill(255);
          rect(i*w,j*w,w,w);
        }
       
      }
    }
  }
}



