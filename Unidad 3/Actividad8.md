#### ¿Qué ocurre después de llamar a la función cambiarNombre? ¿Por qué aparece el mensaje Destructor: Punto cambiado(70, 80) destruido.?
Después de llamar a cambiarNombre, el objeto original no cambia porque la función recibe una copia diferente como ocurria en los primeros acercamiento de c++. El mensaje del destructor aparece porque la copia p se destruye al salir de la funcion

#### ¿Por qué original sigue existiendo luego de llamar cambiarNombre?
original sigue existiendo porque nunca fue modificado directamente. Solo se modificó una copia local dentro de la función cambiar nombre
#### ¿En qué parte del mapa de memoria se encuentra original y en qué parte se encuentra p? ¿Son el mismo objeto? (recuerda usar siempre el depurador para responder estas preguntas).
original y p están en el stack, pero en contextos distintos. No son el mismo objeto; p es una copia independiente. en este caso original esta en el stack main y p esta en el stack cambiar nombre

### Modificar la función `cambiarNombre`:
 #### ¿Qué ocurre ahora? ¿Por qué?
 Ahora sí cambia el nombre de original, porque la función trabaja directamente sobre el mismo objeto. No se crea copia ni destructor adicional. p se convierte en una referencia
 
 ### Modifica ahora a cambiarNombre y a main 
 #### 1. ¿Qué ocurre ahora? ¿Por qué?
El nombre de original cambia correctamente porque la función recibe su dirección y modifica el objeto original directamente.
 #### 2. En este caso ¿Cuál es la diferencia entre pasar un objeto por valor, por referencia y por puntero?
 por valor genera una copia independiente, en referencia se usa el mismo objeto, y puntero apunta valgame la rebundancia al objeto modifica indirectamente el mismo objeto
