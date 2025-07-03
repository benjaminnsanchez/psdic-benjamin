 class Circulo extends Figura {
    int radio;
Circulo(int radio){
    super("circulo");
    this.radio=radio;
}
@Override
public float area(){
    return 2.14159f * radio* radio;
}
    
}
