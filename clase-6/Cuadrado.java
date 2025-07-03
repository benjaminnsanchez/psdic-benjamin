class Cuadrado extends Figura {
    int lado;
Cuadrado(int lado){
    super("cuadrado");
    this.lado=lado;
}
@Override
 public float area(){
    return lado * lado;
}
    
}