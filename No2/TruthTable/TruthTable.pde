/* 
与えられた命題論理式の真理値表を表示するプログラム

拡張してみよう
(1)すべてのモデルを表示する関数を作ってみよう 
(2)文が充足可能かチェックする関数を作ってみよう 
(3)文がトートロジーかチェックする関数を作ってみよう 
*/

void setup(){
  /*
  Var r = new Var("r"); 
  Var w = new Var("w"); 
  Var s = new Var("s");
  Exp exp = new ImpExp( new AndExp( new ImpExp(r,w), new AndExp(new ImpExp(s,w),new OrExp(r,s))),w);
    
  Var[] vars = { r,s,w }; //命題変数を配列に入れる
  */
  /*
  Var p = new Var("p");
  Var q = new Var("q");
  Exp exp = new ImpExp( new AndExp(p,q), new OrExp(p,q) );
  Var[] vars = { p,q };
  */
  
  Var p = new Var("p");
  Var q = new Var("q");
  Var r = new Var("r");
  Exp exp = new ImpExp( new AndExp(p, new ImpExp(p,q)), new OrExp(q,r));
  Var[]vars = {p,q,r};
  showTruthTable(vars, exp); //真理値表を表示する  
}

void showTruthTable(Var[]vars, Exp exp) {
  /* 命題変数と論理式を表示 */
  for(int i = 0; i < vars.length; i++) {
    print(vars[i]+" ");
  }
  println("| "+ exp+" |" );
  
  printTruthTable(0, vars, exp);  /* 真理値表を出力 */
} 

void printTruthTable(int idx, Var[]vars, Exp exp){
  /* 命題変数への割当てが完了した場合 */
  if(idx >= vars.length) {
    for(int i = 0; i < vars.length; i++) {
      print(vars[i].getValue()+" ");//各命題変数の真理値を出力
    }
    exp.setValue();//割当て（解釈）の下で真理値を計算する
    print("| "+exp.getValues()+" | "); // 真理値の計算過程の出力
    println(exp.getValue()); //最終的な真理値を出力
    return;
  }  
  vars[idx].assignValue(false); printTruthTable(idx+1, vars, exp); //falseを割り当てた場合
  vars[idx].assignValue(true);  printTruthTable(idx+1, vars, exp); // trueを割り当てた場合
}

/* 以下，命題文を表すクラス */ 
abstract class Exp {
  boolean value;                //文が持つ真理値
  abstract void setValue();     //真理値を計算する関数 
  abstract String getValues(); //真理値の計算過程を返す関数
  
  boolean getValue() { //真理値を返す関数
    return value;
  } 
}

class Var extends Exp {//命題変数
  String label;
  
  Var(String label){
    this.label = label;
  }
  void assignValue(boolean value) {
    this.value = value;
  }

  public String toString() {
    return label;
  }
  void setValue() {}//Do Nothing
  
  String getValues() {
    return getValue()+"";
  }
}

class NegExp extends Exp{//否定文
  Exp exp;
  NegExp(Exp exp){
    this.exp = exp;
  }
  public String toString() {
    return "￢ "+exp.toString();
  }
  void setValue() {
    exp.setValue();
    value = !exp.getValue();
  }
  String getValues() {
    return getValue()+" "+exp.getValues();
  }
}

abstract class BinaryExp extends Exp {//2項結合
  Exp exp1, exp2;
  String operator;
  BinaryExp(Exp e1, Exp e2, String op){
    exp1 = e1;
    exp2 = e2;
    operator = op;
  }
  public String toString() {
    return "("+exp1.toString()+" "+operator+" "+exp2.toString()+")";
  }
  String getValues() {
    return exp1.getValues()+" "+getValue()+" "+exp2.getValues();
  }  
}
    
class AndExp extends BinaryExp{//連言文
  AndExp(Exp e1, Exp e2){
    super(e1, e2, "∧");
  }
  void setValue() {
    exp1.setValue();
    exp2.setValue();
    value = exp1.getValue() && exp2.getValue();    
  }
}

class OrExp extends BinaryExp{//選言文
  OrExp(Exp e1, Exp e2){
    super(e1, e2, "∨");
  }
  void setValue() {
    exp1.setValue();
    exp2.setValue();
    value = exp1.getValue() || exp2.getValue();    
  }
}

class ImpExp extends BinaryExp{//含意文
  ImpExp(Exp e1, Exp e2){
    super(e1, e2, "⇒");
  }
  void setValue() {
    exp1.setValue();
    exp2.setValue();
    value = !exp1.getValue() || exp2.getValue();    
  }
}

class EqExp extends BinaryExp{//同値文
  EqExp(Exp e1, Exp e2){
    super(e1, e2, "⇔");
  }
  void setValue() {
    exp1.setValue();
    exp2.setValue();
    value = exp1.getValue() == exp2.getValue();    
  }
}
