public class Diseñador extends Empleado{
    private String herramientaDiseño;
    public Diseñador(String nombre,String apellido,String cargo,String herramientaDiseño){
      super(nombre,apellido,cargo);
      this.herramientaDiseño = herramientaDiseño;
    }
        public void mostrarDatos(){
        System.out.println("hola soy "+nombre+" "+apellido+" , mi cargo es: "+cargo+" y diseño en  "+herramientaDiseño);
    };
    public void trabajar(){
         System.out.println("Hola estoy diseñando en front de la app");
    };
    
}