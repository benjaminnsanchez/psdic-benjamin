package clase7;

public class Main {
    public static void main(String[] args) {
        Vehiculo vehiculos[] = new Vehiculo[3];
        vehiculos[0] = new Auto("123",2001,"jorge",3);
        vehiculos[1] = new Moto("13ff23",2021,"luis",500);
         vehiculos[2] = new Camion("1ao23",2020,"jose",100);
         for (Vehiculo vehiculo : vehiculos) {
            vehiculo.mostrarDatos();
              System.out.println("el impuesto es de: "+  vehiculo.calcularImpuesto());
              
         }
                 RegistroMunicipal registro = new RegistroMunicipal();
        registro.buscarPorAño(vehiculos, 2020);
        registro.buscarPorDueño(vehiculos, "luis");
        
    }
    
}
