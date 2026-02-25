# 📘 Resumen de Memoria en C++ (Stack, Heap, Globales y Static)

Este documento resume los conceptos clave sobre manejo de memoria en C++ vistos en los experimentos.

---

# 🧠 1. Segmentos de Memoria en C++

Un programa en C++ se divide en diferentes segmentos de memoria:

## 🔹 Stack (Pila)
- Almacena variables locales normales.
- Gestión automática.
- Se libera al salir del bloque o función.
- Más rápido pero limitado en tamaño.

Ejemplo:
```cpp
void ejemplo() {
    int x = 10; // Vive en el stack
}
```
 ### Características:

Se crea al entrar a la función.

Se destruye al salir.

Se reinicia cada vez que se llama la función.

## 2. Heap (Montículo)

Memoria dinámica.

Se reserva con new.

Se libera manualmente con delete.

Más flexible pero más lento.

 #### Ejemplo correcto:

```
int* ptr = new int(5);
delete ptr;
```
Si no se libera → ocurre memory leak (fuga de memoria).

Para arreglos dinámicos:
```
int* arr = new int[5];
delete[] arr;
```
 #### Regla importante:

new → delete

new[] → delete[]

 ## 3. Segmento de Datos

Aquí viven las variables globales y las variables static.

📌 .data

Variables globales inicializadas.
```
int global = 42;
```
📌 .bss

Variables globales no inicializadas.
El sistema las pone automáticamente en 0.
```
int global_no_init; // Vale 0 al iniciar
```
 ### 🔁 Variables Locales vs Locales Static
#### 🔹 Variable Local Normal
```
void f() {
    int x = 100;
}
```
Vive en el stack.

Se crea al entrar.

Se destruye al salir.

Se reinicia en cada llamada.

##### 🔹 Variable Local Static
```
void f() {
    static int x = 100;
}
```
Se guarda en el segmento de datos.

Se crea una sola vez.

Conserva su valor entre llamadas.

Su alcance sigue siendo local.

Importante:

static cambia el tiempo de vida, NO el alcance.

🧩 Comparación General
Tipo de Variable	Memoria	Tiempo de Vida	Se Reinicia	Gestión
Local normal	Stack	Dentro función	Sí	Automática
Local static	Datos	Todo programa	No	Automática
Global inicializada	.data	Todo programa	No	Automática
Global no inicializada	.bss	Todo programa	No (vale 0)	Automática
Dinámica (new)	Heap	Hasta delete	No	Manual
⚠ Errores Comunes
🔹 Dangling Pointer

Acceder a memoria después de hacer delete.
```
delete ptr;
cout << *ptr; // ❌ Comportamiento indefinido
```
Puede:

Imprimir basura

Caerse el programa

Parecer que funciona (pero está mal)

🔹 Memory Leak

No liberar memoria dinámica.
```
int* ptr = new int(10);
// Falta delete ptr;
```
Consecuencias:

Consumo innecesario de memoria

Programa más lento

Posible agotamiento de memoria

🎯 Ideas Clave Para Recordar

Stack = automático y temporal.

Heap = manual y flexible.

Globales viven todo el programa.

Static conserva valor entre llamadas.

Siempre emparejar new con delete.

Nunca usar memoria después de liberarla.

📌 Regla Mental Rápida

Stack → rápido y automático
Heap → manual y peligroso si se usa mal
Static → vida larga, alcance corto

Palabras claves:
-El recolector de basura (Garbage Collector) decide cuándo destruirlo.
-memoria contigua

