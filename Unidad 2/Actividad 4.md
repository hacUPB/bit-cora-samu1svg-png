Los ciclos while y for son equivalentes a nivel de ensamblador, ya que ambos se traducen en inicialización de variables, evaluación de una condición, ejecución del cuerpo y saltos condicionales. El ciclo for es solo una forma más compacta de escribir un while.
(se hizo mayormente en chatgpt)
``` .asm
// Adds 1 + ... + 100 usando for

@sum
M=0        // sum = 0

@i
M=1        // i = 1  (inicialización del for)

(LOOP)
@i
D=M        // D = i
@100
D=D-A      // D = i - 100
@END
D;JGT      // si i > 100 termina el ciclo

@i
D=M        // D = i
@sum
M=D+M      // sum = sum + i  (cuerpo del for)

@i
M=M+1      // i++  (actualización del for)

@LOOP
0;JMP      // repetir ciclo

(END)
@END
0;JMP      // bucle infinito final

```
