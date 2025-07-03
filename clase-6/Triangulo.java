class Triangulo extends Figura {
    int base;
    int altura;
Triangulo(int base,int altura){
    super("triangulo");
    this.base=base;
    this.altura=altura;
}
@Override
 public float area(){
    return base * altura /2;
}
    
}