## Experimento 1: modificar el segmento de texto
¿Qué ocurre? ¿Por qué?
se le asigna la direccion de main al puntero ptr y luego se resdeferencia y intenta colocar el numero cero en la direccion de memoria de main lo cual no es posible.

```.asm
 void* ptr = reinterpret_cast<void*>(&main);

 cout << "Voy a modificar la memoria en la dirección: " << ptr << endl;

*reinterpret_cast<int*>(ptr) = 0;
```
## Experimento 2: modificar el segmento de datos 
¿Qué ocurre? ¿Por qué?
ocurre lo mismo de la anterior con lo de reinterpret, solo que en la pasada se utilizaba tipo  int como modificador de memoria, en este caso, es tipo  char y lo que aparece al copilar es la interpretación de lo que un char representa. en este caso quiere colocar un cero en la zona de lectura que tampoco es posible
```.asm
const char* const mensaje_ro = "Hola, memoria de solo lectura";

 char* ptr = (char*)&mensaje_ro;
 cout << "Voy a modificar la memoria en la dirección: " << ptr << endl;
 *ptr = 0;
```
## Experimento 3: Modificar el segmento de datos (variables globales):
Al ejecutar el programa, la variable global inicializada imprime 42 y la no inicializada imprime 0 porque las variables globales no inicializadas se asignan automáticamente en 0 en el segmento BSS. Luego, al modificar sus valores, estos cambian correctamente porque las variables globales permanecen en memoria durante toda la ejecución del programa.
## Experimento 4: modificar la variable local estatica de una función por fuera de ella:
El programa no compila porque var_estatica es una variable local estática declarada dentro de una función, por lo tanto no puede ser accedida desde main().
Las variables locales normales se crean al entrar a la función y se destruyen al salir.
En cambio, las variables locales estáticas conservan su valor entre llamadas a la función porque permanecen en memoria durante toda la ejecución del programa, aunque su alcance sigue siendo local a la función.

## Experimento 5: variables locales estática vs no estática:
En el experimento, la variable local no estática siempre imprime 100 porque se crea y se destruye en cada llamada a la función. En cambio, la variable local estática conserva su valor entre llamadas, por eso va aumentando en cada iteración.
La diferencia principal es que las variables normales viven solo durante la ejecución de la función, mientras que las estáticas existen durante toda la ejecución del programa, aunque su alcance sigue siendo local.

## Experimento 6: modificar el segmento de heap:

El programa presenta comportamiento indefinido porque intenta acceder a memoria del heap después de haber sido liberada con delete[], generando un puntero colgante.
El heap requiere gestión manual de memoria, a diferencia del stack que se libera automáticamente.
No liberar memoria dinámica produce fugas de memoria.
Es importante usar delete[] cuando se reserva memoria con new[] para liberar correctamente todo el arreglo.
