(use en algunas partes chatgpt)
```.asm
// a = 10
@10
D=A
@a
M=D

// b = 5
@5
D=A
@b
M=D

// p = &a
@a
D=A
@p
M=D

// b = *p
@p
A=M   // ir a la dirección de a
D=M   // D = valor de a
@b
M=D   // b = valor de a
```
