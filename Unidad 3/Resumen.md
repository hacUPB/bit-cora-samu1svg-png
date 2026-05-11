# 📘 Resumen Completo – Manejo de Memoria en C++

Este documento resume y complementa los conceptos fundamentales sobre manejo de memoria en C++: stack, heap, variables globales, static, objetos y errores comunes.

---

# 🧠 1. Mapa de Memoria de un Programa

Un programa en C++ se divide en varios segmentos:

```
+---------------------+
|   Código (.text)    |  ← Instrucciones del programa
+---------------------+
|   Datos (.data)     |  ← Globales inicializadas
+---------------------+
|   BSS (.bss)        |  ← Globales no inicializadas
+---------------------+
|   Heap              |  ← Memoria dinámica (new)
|         ↑ crece     |
|                     |
|         ↓ crece     |
|   Stack             |  ← Variables locales
+---------------------+
```

📌 Importante:
- El **stack crece hacia abajo**
- El **heap crece hacia arriba**
- Si se encuentran → *Stack Overflow*

---

# 🔹 2. Stack (Pila)

- Almacena variables locales normales.
- Gestión automática.
- Se libera al salir del bloque o función.
- Es rápido pero limitado en tamaño.

### Ejemplo

```cpp
void ejemplo() {
    int x = 10; // Vive en el stack
}
```

### Características

- Se crea al entrar a la función.
- Se destruye al salir.
- Se reinicia cada vez que se llama la función.

---

# 🔹 3. Heap (Montículo)

- Memoria dinámica.
- Se reserva con `new`.
- Se libera manualmente con `delete`.
- Más flexible pero más lenta.

### Ejemplo correcto

```cpp
int* ptr = new int(5);
delete ptr;
```

Si no se libera → ocurre **Memory Leak (fuga de memoria)**.

### Para arreglos dinámicos

```cpp
int* arr = new int[5];
delete[] arr;
```

📌 Regla importante:

- `new` → `delete`
- `new[]` → `delete[]`

📌 `new` siempre devuelve un puntero.

```cpp
Punto* puntero = new Punto();
```

---

# 🔹 4. Segmento de Datos

Aquí viven:

- Variables globales
- Variables `static`

## 📌 .data

Globales inicializadas:

```cpp
int global = 42;
```

## 📌 .bss

Globales no inicializadas (valen 0 automáticamente):

```cpp
int global_no_init;
```

---

# 🔁 5. Variables Locales vs Static

## 🔹 Variable Local Normal

```cpp
void f() {
    int x = 100;
}
```

- Vive en el stack.
- Se reinicia en cada llamada.
- Se destruye al salir.

---

## 🔹 Variable Local Static

```cpp
void f() {
    static int x = 100;
}
```

- Vive en el segmento de datos.
- Se crea una sola vez.
- Conserva su valor entre llamadas.
- Su alcance sigue siendo local.

📌 `static` cambia el tiempo de vida, NO el alcance.

---

# 🧠 6. Ciclo de Vida de un Objeto

## 🔹 Objeto en Stack

```cpp
void f() {
    Enemigo e(100);
}
```

- Se reserva memoria.
- Se llama al constructor.
- Al salir:
  - Se llama al destructor automáticamente.
  - Se libera memoria.

---

## 🔹 Objeto en Heap

```cpp
Enemigo* e = new Enemigo(100);
delete e;
```

- Se reserva memoria en heap.
- Se llama constructor.
- `delete` llama al destructor.
- Libera memoria.

Si no se hace `delete` → fuga de memoria.

---

# 🧩 7. ¿Qué es realmente un objeto?

Un objeto es:

> Un bloque contiguo de memoria que contiene sus atributos.

Ejemplo:

```cpp
class Jugador {
    int vida;
    int ataque;
};
```

En memoria:

```
[ vida ][ ataque ]
```

📌 Los métodos NO viven dentro del objeto.  
Están en el segmento de código (.text).

---

# 🏷 8. Miembros Static en Clases

```cpp
class A {
    static int contador;
    int x;
};
```

- `x` vive dentro del objeto.
- `contador` vive en el segmento global.
- Solo existe UNA copia compartida.

---

# 🧨 9. Regla de los Tres

Si una clase usa:

- Punteros
- Memoria dinámica
- Recursos externos

Debe implementar:

1. Destructor
2. Constructor de copia
3. Operador de asignación

Evita:
- Copia superficial
- Double delete
- Dangling pointers

---

# 🔁 10. Copia Superficial vs Profunda

## 🔹 Copia Superficial

Copia solo la dirección del puntero.

```
obj1.armas → 0x1000
obj2.armas → 0x1000
```

Ambos apuntan al mismo lugar.

---

## 🔹 Copia Profunda

Reserva nueva memoria y copia valores.

```
obj1.armas → 0x1000
obj2.armas → 0x2000
```

Son independientes.

---

# ⚠ 11. Errores Comunes

## 🔹 Dangling Pointer

```cpp
delete ptr;
cout << *ptr; // ❌ Comportamiento indefinido
```

---

## 🔹 Memory Leak

```cpp
int* ptr = new int(10);
// Falta delete
```

---

## 🔹 Double Delete

```cpp
delete ptr;
delete ptr; // ❌
```

---

## 🔹 Puntero no inicializado

```cpp
int* ptr;
*ptr = 10; // ❌
```

Siempre usar:

```cpp
int* ptr = nullptr;
```

---

## 🔹 Stack Overflow

Recursión infinita:

```cpp
void f() {
    f();
}
```

---

# 🚀 12. Buenas Prácticas Modernas

Evitar `new` manual cuando sea posible.

Usar:

- `std::vector`
- `std::array`
- `std::string`

O smart pointers:

```cpp
#include <memory>

std::unique_ptr<Enemigo> e = std::make_unique<Enemigo>(100);
```

Ventaja:
- Liberación automática
- Evita fugas

---

# 🧠 13. Diferencia C++ vs C#

| Concepto | C++ | C# |
|----------|------|------|
| Memoria | Manual | Automática (GC) |
| Objetos | Stack o Heap | Heap |
| Destructor | Manual (~Clase) | Finalizer poco usado |
| Control | Total | Parcial |

---

# 🎯 Ideas Clave Finales

- Stack → rápido y automático.
- Heap → manual y peligroso si se usa mal.
- Static → vida larga, alcance puede ser corto.
- Si usas `new`, probablemente necesitas destructor.
- Si tu clase tiene punteros, piensa en la Regla de los Tres.
- Entender memoria evita crashes reales.

---

# 🔍 Tips de Depuración

Para ver direcciones:

- Usar `&variable`
- Ventana **Locals**
- Inspección rápida

---

# 🏁 Regla Mental Rápida

```
Stack  → Automático
Heap   → Manual
Static → Vive todo el programa
```

---
