## Identifica una instrucción que use la ALU y explica qué hace.
D=D-A
se realiza una resta entre el valor que está en el registro D y el valor que esta en el registro A y se guarda el resultado nuevamente en D
que se puede usar para comparar valores, verificar los limites o tomar decisiones de salto
## ¿Para qué sirve el registro PC?
para indicar cual es la siguiente instruccion que se debe ejecutar en la cpu
##  ¿Cuál es la diferencia entre @i y @READKEYBOARD?
la @i se usa para almacenar datos y busca el espacio en la RAM se al mientras que el @READKEYBOARD  para controlar el flujo del programa como los saltos y bucles y busca el espacio en la ROM
##  Describe qué se necesita para leer el teclado y mostrar información en la pantalla.
 - para leer el teclado se necesita acceder al registro especial de KBD leer los valores desde su memoria y compararse con cero  para saber si hay una tecla presionada 
 - para mostrar infomación en pantalla se necesita  acceder a la memoria de video  usando SCREEN 
##  Identifica un bucle en el programa y explica su funcionamiento.
el que comienza en el (READKEYBOARD) 
- El programa vuelve constante esa etiqueta 
- lee el estado del teclado
- decide que ocurre si si hay o no una tecla presionada 
- y se ejecuta de mandera indefinida
## Identifica una condición en el programa y explica su funcionamiento.
 el D;JNE se evalua el valor del registro D 
 - Si D es distinto de cero, el programa salta a otra parte
 - Si  D es cero, el programa continua normalmente.