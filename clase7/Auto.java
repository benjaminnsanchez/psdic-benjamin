package clase7;
public class Auto extends Vehiculo {
    private int cantidadPuertas;

   
    public Auto(String patente, int año, String dueño, int cantidadPuertas) {
        super(patente, año, dueño);  
        this.cantidadPuertas = cantidadPuertas;
    }

  
    @Override
        public void mostrarDatos() {
        System.out.println("El auto con patente: " + getPatente() + " del año: " + getAño() + " es de: " + getDueño());
    }
    public int calcularImpuesto() {

        return 5000 + 500 *cantidadPuertas;
        
    }
}
