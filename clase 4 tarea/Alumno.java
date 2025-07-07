public class Alumno{
    String nombre;
    String curso;
    float promedio;
    public Alumno(String nombre, String curso, Float promedio){
       this.nombre = nombre;
       this.curso = curso;
       this.promedio = promedio;
    }
    void saludar(){
   System.out.println("Hola "+ nombre+" tu curso es: "+curso);
    }
    void mostrarPromedio(){
        System.out.println("tu promedio "+nombre+" es de: "+promedio);
    }
    void aumentarPromedio(float prom){
    promedio=prom;
    System.out.println("tu nuevo promedio "+nombre+" es de: "+promedio);
    }

}
