// ===============================
// Programa: Lectura de teclado y dibujo en pantalla
// Plataforma: Hack (Nand2Tetris)
// ===============================

// i guardará la posición actual en la memoria de la pantalla
@SCREEN
D=A
@i
M=D          // i = dirección inicial de la pantalla

// ===============================
// BUCLE PRINCIPAL
// ===============================
(READKEYBOARD)

    // Leer el teclado
    @KBD
    D=M

    // Si hay una tecla presionada, saltar a KEYPRESSED
    @KEYPRESSED
    D;JNE

    // -------- NO HAY TECLA PRESIONADA --------
    // Comenzamos a borrar la pantalla hacia atrás

    @i
    D=M
    @SCREEN
    D=D-A     // Verifica que i no sea menor que SCREEN
    @READKEYBOARD
    D;JLE     // Si ya llegamos al inicio, volver a leer teclado

    @i
    M=M-1     // i--

    A=M
    M=0       // Borra el píxel actual

    @READKEYBOARD
    0;JMP     // Repite el ciclo


// ===============================
// TECLA PRESIONADA
// ===============================
(KEYPRESSED)

    @i
    D=M
    @KBD
    D=D-A     // Verifica que no se salga del límite
    @READKEYBOARD
    D;JGE

    @i
    A=M
    M=-1     // Dibuja (enciende píxeles)

    @i
    M=M+1    // i++

    @READKEYBOARD
    0;JMP    // Repite el ciclo
