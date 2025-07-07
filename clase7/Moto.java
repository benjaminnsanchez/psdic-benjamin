package clase7;
public class Moto extends Vehiculo{
      private int cilindrada;

   
    public Moto(String patente, int año, String dueño, int cilindrada) {
        super(patente, año, dueño);  
        this.cilindrada = cilindrada;
    }

  
    @Override
        public void mostrarDatos() {
        System.out.println("La moto con patente: " + getPatente() + " del año: " + getAño() + " es de: " + getDueño());
    }
    public int calcularImpuesto(){
      
        if (cilindrada>=250) {
            return 3000;
            
        }if (cilindrada<=250) {
            return 5000;
        } return 0;
    }
}
