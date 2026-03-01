##cConceptos pasados
### 1) ¿Qué es el stack y el heap?
el stack es la memoria automatica del programa ahi se almacenan variables globales y objetos que se crean dentro de funciones o bloques y se elimina cuando el bloque se termina
el heap es memoria dinamica se usa al crear objetos con new, se tiene que elimar manualmente ya que si no ocurren las fugas de memoria.
### 2) Tres formas de pasar parámetros
por valor se crea una copia del argumento
por referencia la funcion trabaja directamente con la original
por puntero se pasa la direccion de memoria y la funcion accede al objeto mediante la direccion
### 3) Variable local ,global, local estática
local vive en el stack y se destruye al salir del bloque
global vive en el segmento de datos globales y existen en todo el programa
estaticas estan en el segmento estatico pero solo es posible en la funcion y conserva su valor entre llamadas.
### 4) ¿Qué es un objeto en memoria?
Un objeto es un bloque de memoria que contiene sus miembros de instancia. Los miembros de estancia se almacenan junto al objeto sea stack o heap
los objetos estaticos no pertenecen al objet, se almacenan en la seccion de global/estatica y se comportan por todos

## Analisis del codigo
#### problemas de memoria
1. fuga de memoria en "armas = new int[3];" ya que no hay ningun destructor tipo heap
2. como en la actividad anterior puede ocurrir un riesgo de copia superficial por mala referencia
3. codigo corregido:
   ```.asm
   #include <iostream>
   #include <array>
   using namespace std;

    class Enemigo {
    public:
    static int totalEnemigos;
    int vida;
    std::array<int,3> armas;

    Enemigo(int v) : vida(v), armas{10,15,20} {
        totalEnemigos++;
    }

    ~Enemigo() {
        totalEnemigos--;
    }
   };

    int Enemigo::totalEnemigos = 0;
   ```
la solución implementada sigue los principios utlizados en la anterior actividad, se elimino el new y se reemplazo por un array se agrego un destructor y ya no hay riesgo de fuga

## reflexión
### Conceptos criticos
a mi parecer la forma de mandar parametros ya que es critico a la hora de enviar o acceder a un valor de forma correcta. sin esta pueden llevar a errores bastante graves.

### C++ y C#
En C++ un objeto puede vivir en stack o heap y tú controlas la memoria.
en C# casi todo está en heap y el recolector de basura limpia automáticamente.

###  Explicación en 3 oraciones
   se debe entender el concepto pq en caso de no comprender la memoria muchos programas pueden crashear o consumir ram de forma inecesaria
