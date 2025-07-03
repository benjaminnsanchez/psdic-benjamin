public class Gerente extends Empleado{
    private int empleadosACargo;
    public Gerente(String nombre,String apellido,String cargo,int empleadosACargo){
      super(nombre,apellido,cargo);
      this.empleadosACargo = empleadosACargo;
    }
    @Override
    public void mostrarDatos(){
        System.out.println("hola soy "+nombre+" "+apellido+" , mi cargo es: "+cargo+" y tengo a "+empleadosACargo+" empleados a cargo");
    };
    public void trabajar(){
         System.out.println("Hola estoy dirigiendo a los programadores");
    };
    
}