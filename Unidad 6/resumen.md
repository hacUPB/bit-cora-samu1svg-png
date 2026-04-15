# Resumen General – Actividades (Factory Method + State)

---

# 1. Patrón Factory Method (Actividad 3)

## ¿Qué es?

Es un patrón creacional que permite crear objetos sin especificar directamente su clase concreta.  
En lugar de usar `new` en muchas partes del código, se usa una fábrica que se encarga de crear los objetos.

---

## Problema que resuelve

- Evita tener código de creación repetido
- Evita depender de clases concretas
- Mejora la organización del código

---

## Idea clave

El código no crea objetos directamente, los solicita a una fábrica.

---

## Componentes

### Factory → `ParticleFactory`
- Clase encargada de crear objetos

### Método Factory → `createParticle`
```c++
Particle* createParticle(string type);
```
- Recibe un tipo (ej: "star")
- Devuelve una partícula configurada

## ¿Quién define cuántos objetos se crean?

La fábrica NO define la cantidad.

Ejemplo:
```c++
for (int i = 0; i < 100; i++) {
    particles.push_back(ParticleFactory::createParticle("star"));
}
```
- for → define la cantidad

- Factory → define el tipo y configuración

## Ventajas
- Código más limpio
- Centraliza la creación
- Fácil agregar nuevos tipos
- No se modifica el código cliente
## Ejemplo de extensión

Agregar "black_hole":
```c++
if (type == "black_hole") {
    Particle* p = new Particle();
    p->size = grande;
    p->color = negro;
    p->velocity = lenta;
    return p;
}
```
No se modifica ofApp::setup.

## Método estático
### Ventajas
- Fácil de usar
- No necesita instancia
### Desventajas
- Menos flexible
- No permite herencia fácilmente
---
# 2. Patrón State (Actividad 4)
¿Qué es?

Es un patrón que permite que un objeto cambie su comportamiento dependiendo de su estado interno.

### Problema que resuelve

Evita usar grandes bloques de:
```c++
if (state == ...)
```
---
## Idea clave

El objeto no cambia su código, cambia el estado que utiliza.
---
## Componentes
Context → Particle
```c++
State* currentState;
 ```
 - Guarda el estado actual
- Delega el comportamiento
```c++
void update() {
    currentState->update(this);
}
```
---
## State (interfaz)
```c++
class State {
    virtual void update(Particle* p) = 0;
    virtual void onEnter(Particle* p) {}
    virtual void onExit(Particle* p) {}
};
```
## ConcreteState
- NormalState
- AttractState
- RepelState
- StopState

Cada uno define su propio comportamiento.

## Funcionamiento 
```c++
currentState->update(this);
```
El comportamieto depende del estado actual
## Cambio de estado
```c++
void setState(State* newState) {
    currentState->onExit(this);
    currentState = newState;
    currentState->onEnter(this);
}
```
## onEnter y onExit
### onEnter
- Se ejecuta al entrar a un estado
- Inicializa valores
```c++
p->color = rojo;
```
## onExit
- Se ejecuta al salir
- Limpia o restaura valores
```c++
p->velocity = original;
```
## Diferencia con update
- update() → comportamiento continuo
- onEnter() → se ejecuta una vez al entrar
- onExit() → se ejecuta una vez al salir
## Ventajas
- Elimina if/else
- Código más organizado
- Fácil agregar estados
- Cumple principio abierto/cerrado
## Ejemplo de estados
- Normal → movimiento normal
- Attract → se acercan
- Repel → se alejan
- Stop → se detienen
## Transiciones
- tecla n → Normal
- tecla a → Attract
- tecla r → Repel
- tecla s → Stop
# 3. Relación entre Factory y State
- Factory → crea objetos
- State → define comportamiento de esos objetos
## Idea final global
- Factory controla la creación
- State controla el comportamiento
# Resumen corto
- Factory → crea objetos sin usar new directamente
- State → cambia comportamiento sin usar if/else
- Ambos ayudan a organizar, escalar y mantener el código