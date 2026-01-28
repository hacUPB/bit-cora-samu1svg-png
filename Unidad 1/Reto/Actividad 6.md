## Actividad 6

### Pregunta 1:
Fetch es buscar la siguiente instrucción de memoria, la direccion de la instruccion lo dal el PC counter, la cpu interpreta el tipo de instruccion,por ultimo se hace la operación indicada que es el Execute.
### Pregunta 2:
una instruccion A sirve para cargar un valor o una direccion de registro A ysiempre empieza con @
su uso es
- Direccion de memoria
- constantes
- Etiquetas
Las instrucciones C se usa para hacer operaciones, asignar o hacer saltos, se involucran registros como D,A,M y la ALU
### Pregunta 3:
Registro D: es un registro de datos temporales 
Registro A: guarda valores numericos o una direccion de memoria
Alu: es la que se encarga de los procesos aritmeticos
### Pregunta 4:
se hacen con una instrucción c  que incluye una condición (en este caso usaremos JGT)
(SALTO)
@10
D=A     // le asignamos a D el valor 10
@SALTO
D;JGT   // si D es mayor que cero hace un salto hacia el inicio

### Pregunta 5:
un loop se logra combinando una etiqueta  con un salto condicional o incodicional
(LOOP)
@contador
 D=M
 @FIN
 D;JEQ     // si es 0;  sale del loop
 @Contador
 M=M-1
 @LOOP
 0;JUMP   // vuelve al inicio
 (FIN)
### Pregunta 6:
D=M toma el valor que se encuentre en ese registro particular M=D Asigna el valor de D al Registro seleccionado
### Pregunta 7:

## Parte 2: Reflexión sobre tu proceso (metacognición)
-1 Aprender el funcionamiento de @KBD y @ SCREEN cuando lo invetigue por fuera de clase no comprendi su funcionamiento, no fue hasta la clase que el profe explico y comprendi un poco mejor.
-2 al momento de usar el cpu emulator donde antes de iniciarlo buscaba predecir y comprender que ocurriria a continuación.
-3 Cuando le desconecte el cable de internet a miranda y desde eso no le funciono el computador momento ¡Aha!
-4 gracias a los aprendizajes de esta unidad creo poder enfocarme de manera mas productiva en la materia ya que conozco el flujo basico de la clase.