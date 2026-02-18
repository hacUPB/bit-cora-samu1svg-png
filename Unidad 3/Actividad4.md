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