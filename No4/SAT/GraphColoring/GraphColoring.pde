void setup(){
  /*
  int nColors = 4;
  String inFile = "prf.txt";
  String varFile = "prf2var.txt";
  String cnfFile = "prf.cnf";
  */
  
  int nColors = 3; //関東地方の場合は3色で塗り分けることが可能
  String inFile = "kanto.txt";
  String varFile = "kanto2var.txt";
  String cnfFile = "kanto.cnf";
  
  
  makeCNF(inFile, nColors, cnfFile, varFile);
  println("done");
}

void makeCNF(String inFile, int nColors, String cnfFile, String varFile){
  
  ArrayList<String>clauses = new ArrayList<String>();
  
  String[]lines = loadStrings( inFile );
 
  String [] prefectures = new String[lines.length];  
  for(int i = 0; i < lines.length; i++){
    prefectures[i] = ( lines[i].split(" ") )[0];
    
    String str = "";
    for(int c = 0; c < nColors; c++){//一つの都道府県は一つの色
      str += idx2v(i,c, nColors)+" ";
    }
    clauses.add( str+"0" );
    for(int c1 = 0; c1 < nColors; c1++){
      for(int c2 = c1+1; c2 < nColors; c2++){
        clauses.add(""+ -idx2v(i, c1, nColors)+" "+ -idx2v(i, c2, nColors)+" 0");
      }
    }
  }
  
  //隣接関係
  for(int me = 0; me < prefectures.length; me++){
    String[] neighbours = lines[me].split(" ");
    for(int n = 1; n < neighbours.length; n++){
      int you = indexOf(prefectures, neighbours[n]);
      if(me < you){
        for(int c = 0; c < nColors; c++){
          clauses.add(""+ -idx2v(me, c, nColors)+" "+ -idx2v(you, c, nColors)+" 0");
        }
      }
    }
  }
  
  outputCNF(prefectures.length * nColors, clauses, cnfFile);
  outputVars(prefectures, nColors, varFile);
}

int idx2v(int i, int c, int nColors){
  return i*nColors + c+1;
}

int indexOf(String[]line, String s){
  for(int i = 0; i < line.length; i++){
    if(line[i].equals(s)){ return i;}
  }
  return -1;
}

void outputCNF(int n, ArrayList<String>clauses, String cnfFile){
  PrintWriter pw;
  pw = createWriter(cnfFile);
  pw.println("p cnf "+ n +" "+ clauses.size());
  for(String clause: clauses){
    pw.println(clause);
  }
  pw.flush();
  pw.close();
}

void outputVars(String[]prefectures, int nColors, String varFile){
  PrintWriter pw;
  pw = createWriter(varFile);
  for(int i = 0; i < prefectures.length; i++){
    for(int c = 0; c < nColors; c++){
      pw.println(""+idx2v(i, c, nColors)+" "+prefectures[i]+"_"+c);
    }
  }  
  pw.flush();
  pw.close();
}
