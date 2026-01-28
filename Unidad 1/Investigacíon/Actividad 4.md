## Actividad 4
- Escribe un programa que compare el valor almacenado en la dirección de memoria 5 con el valor 10.
- Si el valor es menor que 10, guarda el valor 1 en la dirección 7.
- Si el valor es mayor o igual a 10, guarda el valor 0 en la dirección 7.

@5
D=M
@10
D=D-A
@MENOR
D;JLT
@7
M=0
@FIN
0;JMP
(MENOR)
@7
M=1
(FIN)
@FIN
0;JMP
