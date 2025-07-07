/* ## Proyecto: Registro de Vehículos

Desarrollar en Java un sistema que modele el registro de vehículos de una ciudad.

---

## Requisitos

### Clase abstracta `Vehiculo`
- Atributos: `patente`, `año`, `dueño` (privados)
- Métodos:
  - `mostrarDatos()` → muestra los atributos
  - `calcularImpuesto()` → abstracto

### Subclases
- `Auto` → + `cantidadPuertas`
- `Moto` → + `cilindrada`
- `Camion` → + `cargaMaxima`

Cada una debe:
- Sobrescribir `calcularImpuesto()`:
  - Auto: $5000 + $500 por puerta
  - Moto: $3000 (<250cc) / $6000 (≥250cc)
  - Camión: $8000 + $100 x tonelada

---

## Código en `Main.java`

1. Crear un arreglo de `Vehiculo[]` con objetos `Auto`, `Moto`, `Camion`
2. Recorrer el arreglo con `for`:
   - Llamar a `mostrarDatos()`
   - Llamar a `calcularImpuesto()`

---
 */
package clase7;

public abstract class Vehiculo {
    private String patente;
    private int año;
    private String dueño;

    public Vehiculo(String patente, int año, String dueño) {
        this.patente = patente;
        this.año = año;
        this.dueño = dueño;
    }
    public void mostrarDatos() {
        System.out.println("El vehiculo con patente: " + patente + " del año: " + año + " es de: " + dueño);
    }
 public String getPatente(){
      return this.patente;
 }
  public int getAño(){
      return this.año;
 }
  public String getDueño(){
      return this.dueño;
 }
   
    public abstract int calcularImpuesto();
}
