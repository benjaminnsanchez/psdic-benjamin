public abstract class Empleado{
        protected String nombre;
    protected String apellido;
    protected String cargo;
    public Empleado(String nombre,String apellido,String cargo){
        this.nombre =nombre;
        this.apellido=apellido;
        this.cargo = cargo;
    }
    public String getNombre(){
        return this.nombre;
    }
        public String getApellido(){
        return this.apellido;
    }
        public String getCargo(){
        return this.cargo;
    }
    public void mostrarDatos(){
        
    };
        public void trabajar(){
        
    };
}
