package clase7;
public class Camion extends Vehiculo{
     private int cargaMaxima;

   
    public Camion(String patente, int año, String dueño, int cargaMaxima) {
        super(patente, año, dueño);  
        this.cargaMaxima = cargaMaxima;
    }

  
    @Override
        public void mostrarDatos() {
        System.out.println("El camion con patente: " + getPatente() + " del año: " + getAño() + " es de: " + getDueño());
    }
    public int calcularImpuesto(){
      return 8000 + 100 *cargaMaxima;
    }
}
