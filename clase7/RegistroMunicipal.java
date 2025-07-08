package clase7;

public class RegistroMunicipal {
    
    public void buscarPorAño(Vehiculo[] arr, int año) {
        for (Vehiculo vehiculo : arr) {
            if (vehiculo.getAño() == año) {
                System.out.println("Patente: " + vehiculo.getPatente() +", Año: " + vehiculo.getAño() +", Dueño: " + vehiculo.getDueño());
            }
        }
    }
        public void buscarPorDueño(Vehiculo[] arr, String dueño) {
        for (Vehiculo vehiculo : arr) {
            if (vehiculo.getDueño() == dueño) {
                System.out.println("Patente: " + vehiculo.getPatente() +", Año: " + vehiculo.getAño() +", Dueño: " + vehiculo.getDueño());
            }
        }
    }
}
