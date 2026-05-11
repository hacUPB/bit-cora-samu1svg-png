(utilice chatgpt para esta actividad debido a su duracion)
#### 1) Explica el ciclo de vida de un objeto en el stack vs heap
   Un objeto en el stack se crea al entrar al bloque y se destruye automáticamente al salir de él.
Un objeto en el heap se crea con new y permanece en memoria hasta que se libera manualmente con delete.
### Primera modificación
#### 1) ¿Compila? ¿Por qué?
No compila porque pBloque2 fue declarada dentro del bloque y no es visible fuera de él.
### 2) Declararla fuera y asignarla dentro
Ahora sí funciona porque el puntero fue declarado fuera del bloque y sigue existiendo después. El objeto en el heap también sigue existiendo hasta que se haga delete.
### Segunda modificación
#### 1) ¿Por qué pBloque se destruye y pBloque2 no?
pBloque se destruye porque es un objeto en el stack y su alcance termina.
pBloque2 no se destruye porque es solo un puntero, y el objeto real está en el heap, que solo se libera con delete.
#### ¿En qué parte de la memoria se almacena el objeto al que apunta pBloque2?
en heap porque fue creado en new
### Actividad de integracción
entre los problemas que vi estan:
fuga de memoria en "estadisticas =new int[3];" ya que es un tipo heat y no hay un "delete[] estadisticas" que hace que se crean miles de npcs y la ram sube hasta que crashea

una copia rara en "Personaje copiaHeroe = heroe;" no crea un nuevo objeto genera una copia de este lo que hace que si uno quiere modificar sus estadisticas afecta al otro. el compilador copia el puntero mas no el contenido

no hay destructor genera fugas porque nada se borra

para solucionar la clase se uso el siguiente codigo 

```.asm
#include <iostream>
#include <string>
#include <array>

class Personaje {
public:
    std::string nombre;
    std::array<int, 3> estadisticas; // vida, ataque, defensa

    Personaje(std::string n, int vida, int ataque, int defensa)
        : nombre(n), estadisticas{vida, ataque, defensa}
    {
        std::cout << "Constructor: nace " << nombre << std::endl;
    }

    ~Personaje() {
        std::cout << "Destructor: muere " << nombre << std::endl;
    }

    void imprimir() {
        std::cout << "Personaje " << nombre
                  << " [Vida: " << estadisticas[0]
                  << ", ATK: " << estadisticas[1]
                  << ", DEF: " << estadisticas[2]
                  << "]" << std::endl;
    }
};
```
ya el constructor es mas dinamico y se utilizo un cambio en el arreglo de estadisticas, ademas de no utilizar new para no usar memoria heap al arreglarlo con array se copia es el arreglo y no un puntero que era lo que provocaba mayormente errores, tambien se usa solo stack y no heap, haciendo el destructor inecesario sin embargo es mas de demostración.
