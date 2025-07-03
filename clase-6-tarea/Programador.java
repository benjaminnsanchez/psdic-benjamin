public class Programador extends Empleado{
    private String lenguaje;
    public Programador(String nombre,String apellido,String cargo,String lenguaje){
      super(nombre,apellido,cargo);
      this.lenguaje = lenguaje;
    }
    @Override
    public void mostrarDatos(){
        System.out.println("hola soy "+nombre+" "+apellido+" , mi cargo es "+cargo+" y programo en "+lenguaje);
    };
    public void trabajar(){
         System.out.println("Hola codeando un sistema de votos");
    };
    
}