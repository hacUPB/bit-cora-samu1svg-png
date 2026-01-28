## Actividad 4
- Escribe un programa que compare el valor almacenado en la dirección de memoria 5 con el valor 10.
- Si el valor es menor que 10, guarda el valor 1 en la dirección 7.
- Si el valor es mayor o igual a 10, guarda el valor 0 en la dirección 7.
``` .asm 
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
```

## Caso 1 (Valor menor de 10)
<img width="1236" height="552" alt="Captura de pantalla 2026-01-28 102439" src="https://github.com/user-attachments/assets/ab15b185-42ba-4386-a9eb-5a1bf799c968" />


## Caso 2 (Valor mayor o igual a 10)
<img width="1207" height="475" alt="Captura de pantalla 2026-01-28 102532" src="https://github.com/user-attachments/assets/b03d1ed5-ce4e-4969-b7f3-5333a946a52a" />
