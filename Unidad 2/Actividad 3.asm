
// Inicializar i = SCREEN
@20496
D=A
@i
M=D

// Dibujar línea inicial
@i
A=M
M=-1

// Bucle principal
(LOOP)
    @KBD
    D=M          // Leer teclado

    @100         // 'd'
    D=D-A
    @RIGHT
    D;JEQ

    @105         // 'i'
    D=D-A
    @LEFT
    D;JEQ

    @LOOP
    0;JMP

// Mover a la derecha
(RIGHT)
    @i
    A=M
    M=0          // borrar línea

    @i
    M=M+1        // i++

    @i
    A=M
    M=-1         // dibujar línea

    @LOOP
    0;JMP

// Mover a la izquierda
(LEFT)
    @i
    A=M
    M=0          // borrar línea

    @i
    M=M-1        // i--

    @i
    A=M
    M=-1         // dibujar línea

    @LOOP
    0;JMP

