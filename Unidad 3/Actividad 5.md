# Actividad 5: Copia de objetos y su ubicación en memoria (ayuda de chatgpt en entender el codigo )
1. ¿Qué ocurre al copiar un objeto en C++ y en C#? ¿Qué diferencias encuentras?

En C++, cuando hago:

Punto copia = original;

lo que pasa es que se crea otro objeto completamente nuevo en memoria. Es como si hiciera un clon con los mismos valores. Los dos existen por separado. Entonces, si cambio algo en "copia", el "original" no se ve afectado porque cada uno tiene su propio espacio en memoria.

En cambio, en C#, cuando hago lo mismo:

Punto copia = original;

realmente no se crea un nuevo objeto. Lo que se copia es la referencia, o sea, la dirección del objeto que ya existe en el Heap. Eso significa que "copia" y "original" están apuntando al mismo objeto. Si modifico uno, el otro también cambia porque en realidad es el mismo.

La diferencia principal es que en C++ la copia es independiente (se duplica el objeto), mientras que en C# solo se duplica la referencia.


2. ¿Qué es `copia` en C++ y en C#? ¿Es una copia independiente de `original`?

En C++, "copia" sí es un objeto nuevo e independiente de "original". Son dos objetos distintos aunque tengan los mismos valores al inicio.

En C#, "copia" no es un objeto nuevo. Es simplemente otra variable que apunta al mismo objeto que "original". No es independiente.

Conclusión personal:
En C++ se copia el objeto.
En C# se copia la referencia.
# Actividad integradora de investigación

## A. Predicción

### Salida esperada en consola

--- Experimento con paso de parámetros ---
Valor inicial de val_A: 20
  -> Dentro de sumaPorValor, 'a' ahora es: 30
Valor final de val_A: 20

Valor inicial de val_B: 20
  -> Dentro de sumaPorReferencia, 'a' ahora es: 30
Valor final de val_B: 30

Valor inicial de val_C: 20
  -> Dentro de sumaPorPuntero, '*a' ahora es: 30
Valor final de val_C: 30

--- Experimento con variables estáticas ---
  -> Llamada a ejecutarContador. Valor de contador_estatico: 1
  -> Llamada a ejecutarContador. Valor de contador_estatico: 2
  -> Llamada a ejecutarContador. Valor de contador_estatico: 3

---

### Mapa conceptual de memoria antes de terminar main

Código:
- main
- sumaPorValor
- sumaPorReferencia
- sumaPorPuntero
- ejecutarContador

Datos globales / estáticos:
- contador_global
- contador_estatico

Stack (main):
- val_A
- val_B
- val_C

Stack (cuando se llaman funciones):
- a (copia en sumaPorValor)
- a (referencia en sumaPorReferencia)
- a (puntero en sumaPorPuntero)

---

## B. Verificación y análisis

Al ejecutar paso a paso se confirma que:

- En paso por valor, val_A no cambia porque solo se modifica una copia.
- En paso por referencia, val_B sí cambia porque la función trabaja sobre la misma variable.
- En paso por puntero, val_C también cambia porque se modifica mediante su dirección.
- contador_estatico aumenta 1, 2, 3 porque no se reinicia; conserva su valor entre llamadas.

contador_estatico “recuerda” su valor porque es static: se inicializa una sola vez y vive durante toda la ejecución del programa. A diferencia de una variable local normal, no se destruye al salir de la función.

---

## ⚠ Parte que debo completar manualmente

- Capturas del depurador mostrando:
  - Valores antes y después de cada llamada.
  - Direcciones de memoria en paso por valor vs referencia.
  - Cómo cambia contador_estatico en cada llamada.
- Captura del breakpoint al inicio de main.
- Evidencia visual del mapa de memoria desde la ventana Watch o Autos.

Estas partes requieren ejecución en Visual Studio y no se pueden completar solo con el código.
