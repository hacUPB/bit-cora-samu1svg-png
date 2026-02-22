// sum = 0
@sum
M=0

// j = 0
@j
M=0

// ----- arreglo desde RAM[16] -----
@11
D=A
@16
M=D

@233
D=A
@17
M=D

@23
D=A
@18
M=D

@77
D=A
@19
M=D

@112
D=A
@20
M=D

@61
D=A
@21
M=D

@67
D=A
@22
M=D

@98
D=A
@23
M=D

@900
D=A
@24
M=D

@810
D=A
@25
M=D


// ----- ciclo -----
(LOOP)
@j
D=M
@10
D=D-A
@END
D;JGE

// sum += arr[j]
@16
D=A
@j
A=D+M
D=M
@sum
M=M+D

// j++
@j
M=M+1

@LOOP
0;JMP


(END)
@END
0;JMP
