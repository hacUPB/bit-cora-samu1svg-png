# Actividad 5

## Captura
![alt text](<Captura de pantalla 2026-03-22 143243.png>)

al analizar la jerarquia de clases con la memoria se ve que coinciden
en memoria el objeto aparece dividido en partes que corresponden a cada clase

primero aparece CircularExplosion, luego ExplosionParticle y luego Particle

esto muestra que el objeto contiene todas las clases de las que hereda. el depurador muestra como esta organizado el objeto internamente

la herencia en c++ se implementa agregando las clases base dentro del objeto derivado

es decir, el objeto final contiene todos los datos de sus clases padres.
## parte 2
la herencia se puede aplicar facilmente  usando la sintasix
``` c++
class Hija : public Padre
```
esto permite que la clase hija herede los atributos y metodos de la clase padre

## parte 3 
(le pedi a chat ayuda con el ejemplo para motrarlo)

``` c++
class A {
public:
    int a;
};

class B {
public:
    int b;
};

class C : public A, public B {
public:
    int c;
};
```
en este caso el objeto C tiene a, b y c