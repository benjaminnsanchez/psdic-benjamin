public class Pelicula {
    private String titulo;
    private String director;
    private int duracion;
public Pelicula(String titulo,String director,int duracion){
this.titulo=titulo;
this.director=director;
this.duracion=duracion;
}
public Pelicula(String titulo,String director){
this.titulo=titulo;
this.director=director;

}
public Pelicula(String titulo,int duracion){
this.titulo=titulo;
this.duracion=duracion;
}
public void mostrarInfo(){
    System.out.println("la pelicula es: "+ titulo+ " del director: "+director+" y dura: "+duracion);
}
}

