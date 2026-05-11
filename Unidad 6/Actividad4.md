
 

 ### 1. Explica con tus propias palabras el propósito del patrón State. ¿Cuándo es útil aplicarlo?

- El patrón State sirve para que un objeto pueda cambiar su comportamiento dependiendo del estado en el que se encuentre, sin necesidad de usar muchos if o switch.

 - Es útil aplicarlo cuando un objeto tiene varios comportamientos diferentes según su estado, como en el caso de las partículas, que pueden estar en modo normal, atraer, repeler o detenerse. En lugar de manejar todo eso en una sola clase, se separa cada comportamiento en diferentes estados.


### 2. Dibuja un diagrama de estados simple para la clase Particle. Muestra los diferentes estados (Normal, Attract, Repel, Stop) como nodos y las transiciones entre ellos como flechas etiquetadas con el evento que las causa (p. ej., la tecla presionada: ‘n’, ‘a’, ‘r’, ‘s’).

# Diagrama de Estados – Particle (Patrón State)

```
                (n)
             ┌──────────────┐
             │    Normal    │
             └──────────────┘
         ↑            ↑                         ↑
        /             |                          \
     (a)             (r)                         (s)
      |               |                            |
      v               v                            v

┌──────────────┐  ┌──────────────┐         ┌──────────────┐
│   Attract    │  │    Repel     │         │     Stop     │
└──────────────┘  └──────────────┘         └──────────────┘

      ↑               ↑                               ↑
      └────── (n) ────┴────────────────────── (n) ────┘
````
### 3. Describe las ventajas de usar el patrón State en Particle en lugar de tener un miembro std::string estadoActual y usar un gran if/else if/else o switch dentro de Particle::update() para cambiar el comportamiento. Piensa en cohesión, extensibilidad (añadir nuevos estados) y el Principio Abierto/Cerrado (Open/Closed Principle).

- El código está mejor organizado porque cada estado tiene su propia clase (mejor cohesión).

- Es más fácil agregar nuevos estados sin modificar el código existente, solo se crea una nueva clase.

- Se cumple el principio abierto/cerrado, ya que el código está abierto a extensiones pero cerrado a modificaciones.

- Se evita tener un bloque grande de if/else que sería difícil de leer y mantener.

### 4. ¿Qué responsabilidad tienen los métodos onEnter y onExit en el patrón State? Proporciona un ejemplo de por qué podrían ser útiles (incluso si no se usan mucho en todos los estados de este caso de estudio). Por ejemplo, ¿Qué podrías hacer en onEnter para AttractState o en onExit para StopState?

Los métodos onEnter y onExit sirven para ejecutar acciones cuando una partícula entra o sale de un estado.

onEnter-> se ejecuta al entrar a un estado
onExit-> se ejecuta al salir de un estado

Son útiles para inicializar o limpiar valores.

#### Ejemplos:

En AttractState::onEnter se podría aumentar la velocidad o cambiar el color de la partícula para indicar que está siendo atraída.
En StopState::onExit se podría restaurar la velocidad original de la partícula para que vuelva a moverse normalmente.

Esto ayuda a mantener el código organizado y evitar poner esa lógica dentro del update.
