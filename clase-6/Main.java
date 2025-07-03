public class Main {
    public static void main(String[] args) {
Figura t = new Triangulo(5, 2);
Figura c = new Cuadrado(5);
Figura o = new Circulo(5);
 System.out.println("El area del triangulo es: "+ t.area() + " la del cuadrado es: "+c.area()+" y la del circulo es: "+o.area());
    }
    
}
