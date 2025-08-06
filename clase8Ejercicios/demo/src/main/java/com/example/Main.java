package com.example;

import java.util.Map;
import io.javalin.Javalin;
import java.util.Map;
public class Main {
    // ejercicio 1 res:
    //el método get es solo para hacer peticiones al servidor que devuelva algo al cliente y en el ejercicio tiene un endpoint que se llama eliminarUsuario, este endpoint debería tener el método de tipo DELETE.
    // el método post es solo para hacer peticiones peticiones donde el cliente le envía datos al servidor y en el ejercicio se le pone el endpoint obtenerLibros , el cual debería tener un método de tipo GET.
    //el método delete sirve para eliminar y en el ejercicio se le pone un endpoint llamado crearNuevoUsuario,por lo cual estaría mal definido.
  public static void main(String[] args) {
    Javalin app = Javalin.create().start(8082);
    app.get("/suma/{a}/{b}", ctx -> {
        String a = ctx.pathParam("a");
        int aa = Integer.parseInt(a);
        String b = ctx.pathParam("b");
         int bb = Integer.parseInt(b);
        ctx.json(Map.of("resultado",aa+bb));
    });
        app.get("/resta/{a}/{b}", ctx -> {
      String a = ctx.pathParam("a");
        int aa = Integer.parseInt(a);
        String b = ctx.pathParam("b");
         int bb = Integer.parseInt(b);
        ctx.json(Map.of("resultado",aa-bb));
    });
        app.get("/suma/{a}/{b}", ctx -> {
      String a = ctx.pathParam("a");
        int aa = Integer.parseInt(a);
        String b = ctx.pathParam("b");
         int bb = Integer.parseInt(b);
        ctx.json(Map.of("resultado",aa*bb));
    });
    }
}