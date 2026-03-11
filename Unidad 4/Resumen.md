
# Resumen Teórico — Cola (Queue) con Nodos en C++

## Estructuras de Datos

Una **estructura de datos** es una forma de organizar y almacenar información en memoria para poder acceder a ella y modificarla de manera eficiente.

Algunas estructuras de datos comunes son:

- Arrays
- Listas enlazadas
- Pilas (Stack)
- Colas (Queue)

En este proyecto se utiliza una **cola implementada con nodos enlazados**.

---

## Cola (Queue)

Una **cola** es una estructura de datos que sigue el principio:

**FIFO — First In First Out**

Esto significa que:

> El primer elemento que entra es el primero que sale.

Un ejemplo cotidiano es una fila de personas.

Ejemplo de cola:

front                rear
↓                    ↓
[A] → [B] → [C]

Si se elimina un elemento:

[B] → [C]

Se elimina **A** porque fue el primero en entrar.

---

## Operaciones Principales

### enqueue()

Agrega un elemento **al final de la cola**.

Ejemplo:

enqueue(A)

[A]

enqueue(B)

[A] → [B]

enqueue(C)

[A] → [B] → [C]

---

### dequeue()

Elimina **el primer elemento de la cola**.

Ejemplo:

[A] → [B] → [C]

dequeue()

[B] → [C]

---

### isEmpty()

Verifica si la cola está vacía.

Implementación típica:

```cpp
return front == nullptr;

Resultados:
	•	true → la cola está vacía
	•	false → la cola tiene elementos
```
⸻

clear()

Elimina todos los elementos de la cola.

Ejemplo de lógica:

while(!isEmpty()){
    dequeue();
}


⸻

Nodo (Node)

Un nodo es una estructura que contiene datos y un puntero al siguiente nodo.

Ejemplo de estructura:

struct Node {
    float x, y;
    float radius;
    Node* next;
};

Representación visual:

Node1 → Node2 → Node3 → nullptr

nullptr significa fin de la lista.

⸻

Punteros

Un puntero es una variable que guarda la dirección de memoria de otra variable.

Ejemplo:

Node* front;

Significa que front apunta a un nodo.

front
 ↓
[Node]


⸻

Variables de la Cola

La cola normalmente utiliza:

Node* front
Node* rear
int size
int maxSize

front

Apunta al primer nodo de la cola.

front
 ↓
[A] → [B] → [C]


⸻

rear

Apunta al último nodo.

[A] → [B] → [C]
               ↑
              rear

Esto permite insertar elementos rápidamente.

⸻

size

Cantidad actual de nodos en la cola.

⸻

maxSize

Número máximo de nodos permitidos.

Si se supera el límite, normalmente se elimina el nodo más antiguo.

⸻

Memoria Dinámica

Los nodos se crean usando memoria dinámica.

Ejemplo:

Node* newNode = new Node(...);

Esto reserva memoria en el heap.

Cuando se elimina un nodo se debe liberar memoria:

delete node;

Si no se libera memoria se produce un memory leak.

⸻

Recorrer la Cola

Para recorrer todos los nodos se usa un puntero auxiliar.

Ejemplo:

Node* current = front;

while(current != nullptr){
    current = current->next;
}

Representación:

front → A → B → C → nullptr
          ↑
       current


⸻

Programación Orientada a Objetos

La cola se implementa dentro de una clase.

Conceptos importantes:

Concepto	Significado
Clase	Plantilla para crear objetos
Objeto	Instancia de una clase
Constructor	Se ejecuta al crear el objeto
Destructor	Se ejecuta al destruir el objeto

Ejemplo:

class BrushQueue {
public:
    void enqueue();
};


⸻

Flujo del Programa

En openFrameworks el programa sigue este ciclo:

setup()
update()
draw()

setup()

Se ejecuta una vez al iniciar el programa.

⸻

update()

Actualiza la lógica del programa.

⸻

draw()

Dibuja en pantalla.

⸻

Aplicación en el Proyecto

En este proyecto cada nodo almacena un trazo del mouse.

Cada nodo guarda:
	•	posición X
	•	posición Y
	•	radio del círculo
	•	color
	•	opacidad

Durante draw() se recorren los nodos y se dibujan círculos usando:

ofDrawCircle()


⸻

Controles de Teclado

El programa usa:

keyPressed(int key)

Controles:

Tecla	Acción
c	limpiar cola
a	cambiar máximo de trazos (50 / 100)
s	guardar captura de pantalla


⸻

Resumen

Una cola es una estructura de datos FIFO donde:
	•	los elementos se agregan al final (enqueue)
	•	los elementos se eliminan desde el inicio (dequeue)
	•	se usan punteros para conectar nodos
	•	se utiliza memoria dinámica (new y delete)
	•	front apunta al primer nodo
	•	rear apunta al último nodo

Esto permite manejar datos en orden de llegada de forma eficiente.
