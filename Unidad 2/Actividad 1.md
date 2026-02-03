poner un pixel en la pantalla:
lenguaje ensamblador
```.asm
@16384
M=1
```
Lenguaje en C#
```.asm
// Simulación de la memoria RAM del Hack
int[] RAM = new int[32768];

// Dirección inicial de la pantalla
int SCREEN = 16384;

// Dibujar un punto negro en la esquina superior izquierda
RAM[SCREEN] = 1;
```
