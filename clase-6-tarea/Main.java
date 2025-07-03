public class Main {
    public static void main(String[] args) {
        Empleado empleados[] = new Empleado[3];
        empleados[0] = new  Gerente("Jorge", "Barrera", "Gerente", 5);
          empleados[1] = new  Programador("Luis","Sanchez","Programador","java");
            empleados[2] = new  Diseñador("Sofia","Scorenco","Diseñadora","Canva");
        for (Empleado empleado : empleados) {
            empleado.mostrarDatos();
            empleado.trabajar();
        }
    }
}
