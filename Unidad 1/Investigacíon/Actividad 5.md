## Actividad 5
-“Crea un programa que use un ciclo para sumar los números del 1 al 5 
y guarde el resultado en la dirección de memoria 12.”

``` .asm 
@0
M=0
@1
M=1
(LOOP)
@1
D=M
@5
D=D-A
@END
D;JGT
@1
D=M
@0
M=M+D
@1
M=M+1
@LOOP
0;JMP
(END)
@0
D=M
@12
M=D
@END
0;JMP

```
### Foto evidencia
<img width="1216" height="815" alt="image" src="https://github.com/user-attachments/assets/54e3bb72-9bd0-4a55-af11-29be7479ddd6" />
