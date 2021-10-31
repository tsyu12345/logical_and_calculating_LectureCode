
void setup(){
  int N = 20;
  
  //nqueen(N); //バックトラック法
  
  makeCNF(N,"queen_"+N+".cnf", "queen_var_"+N+".txt");
  println("done");
}

/* バックトラック法によるnQueenの求解 */
void nqueen(int N){
  int[]queen = new int[N];
  for(int i = 0; i < queen.length; i++){
    queen[i] = (i+1); //queen[i] は．添え字が行，値が列{1...n}　
  } 
  int ms = millis();
  queen(0, queen);
  println( (millis()-ms)+" msec.");
}  

boolean queen(int idx, int[]queen){
  if(idx >= queen.length){
    for(int i = 0; i < queen.length; i++){
      print(queen[i]+" ");
    }
    println();
    return true; 
  }  
  for(int i = idx; i < queen.length; i++){
    swap(i,idx, queen);
    if(noAttack(idx,queen) && queen(idx+1,queen) ){
      return true;
    }
    swap(i,idx, queen);
  }
  return false;
}
void swap(int i, int j, int[]array){
  int t = array[i];
  array[i] = array[j];
  array[j] = t;
}

boolean noAttack(int idx, int[]array){
  for(int i = 1; idx-i >= 0;  i++){
    if(abs(array[idx] - array[idx-i]) == i ){
      return false;
    }
  }
  return true;
}


/* nQueen求解用CNFファイルの作成 */
void makeCNF(int N, String cnfName, String varName){
  ArrayList<String> clauses = new ArrayList<String>();

  /* 変数： N*N */
  for(int row = 0; row < N; row++){
    /* 各行で最低一つはクイーンが存在 */
    String clause="";
    for(int col = 0; col < N; col++){
      clause += cell2var(row,col,N)+" ";
    }
    clause+="0";
    clauses.add(clause);
    
    /* 各行でクイーンの重複はNG */
    for(int ci = 0; ci < N; ci++){
      for(int cj = ci+1; cj < N; cj++){
        clauses.add("" + -cell2var(row,ci,N) +" "+ -cell2var(row,cj,N)+" 0");
      }
    }
  }
  //各列で，クイーンの重複はNG;
  for(int col = 0; col < N; col++){
    for(int ri = 0; ri < N; ri++){
      for(int rj = ri+1; rj < N; rj++){
        clauses.add("" + -cell2var(ri,col,N) +" "+ -cell2var(rj,col,N)+" 0");
      }
    }
  }
  //斜めの制約，各セル左下，右下に重複がない
  for(int row = 0; row < N; row++){
    for(int col = 0; col < N; col++){
      for(int k = 1; (row+k)<N && (col+k) < N;k++){//右下
        clauses.add("" + -cell2var(row,col,N) +" "+ -cell2var((row+k),col+k,N)+" 0");
      }
      for(int k = 1; (row+k)<N && (col-k) >= 0;k++){//左
        clauses.add("" + -cell2var(row,col,N) +" "+ -cell2var((row+k),col-k,N)+" 0");
      }
    }
  }
      
  //出力
  PrintWriter output = createWriter(cnfName);
  output.println("p cnf "+(N*N)+" "+clauses.size());
  for(String clause : clauses){
    output.println(clause);
  }
  output.flush();
  output.close();
  
  output = createWriter(varName);
  for(int row = 0; row < N; row++){
    for(int col = 0; col < N; col++){
      output.println( cell2var(row,col,N)+" --> ( "+row+", "+col+" )" );
    }
  }
  output.flush();
  output.close();
}

int cell2var(int row, int col, int N){
  return row*N + col + 1;
}
