
¿Qué pasa si?

Cambia los valores de bufferWidth y bufferHeight: divide por 2, por 4, multiplica por 2, por 4, etc. ¿Qué pasa? ¿Qué observas? ¿Qué crees que está pasando?

para guiarme a mi mismo...
``` c++
glViewport(x, y, width, height);
``` 
enmarca donde se puede dibujar

el triangulo solo aparece  en uno de los cuadrantes de la pantalla arriba a la izquierda
pequeño
pasa eso porque le estamos especificando en que parte puede dibujar 

## Resumen
###  ¿Qué es el contexto OpenGL?
-el lugar activo donde trabaja el OpenGL
- todo lo que necesita se guarda ahi y demas es donde se conecta con la ventana
- se podria decir que es el estado del programa grafico

### ¿Quién crea ese contexto?
cuando usamos
``` c++
glfwCreateWindow(...)
```
crea el contexto (ademas de la ventana)
``` c++
glfwWindowHint(...)
``` 
define como va a trabajar la gpu (especifica las versiones)

### Framebuffer
es donde se dibuja todo, no es en la pantalla directamente pero es como una hoja invisible antes de mostrarla

- la gpu dibuja-> en el framebuffer

luego se mostrara  en pantalla
(tambien tener en cuenta que el tamaño de framebuffer puede ser distinto a la ventana debido a la pantalla )

### Activar el contexto
``` c++
glfwMakeContextCurrent(mainWindow);

``` 
esto dice que en este escritorio se va a trabajar ya que OpenLG no sabe donde trabajar

### Viewport
``` c++
glViewport(0, 0, width, height);
``` 
esto define el area donde se va a dibujar 

### Callback
``` c++
glfwSetFramebufferSizeCallback(...)
``` 
para cambiar el tamaño de la ventana esto actualiza el viewport automaticamente

### VBO (Vertex Buffer Object)
bloque de memoria en la gpu
sirve para guardar datos (posiciones, coordenadas, colores)

### VAO (Vertex Array Object)
no guarda datos es para leer el VBO y de como interpretar sus datos

##### ¿Qué pasa si cambias el primer parámetro de glDrawArrays a GL_LINES? ¿Qué pasa si lo cambias a GL_POINTS? ¿Qué pasa si cambias el tercer parámetro a 2? ¿Qué pasa si lo cambias a 4?

- Cuando se cambia el primer parámetro a GL_LINES, el triángulo deja de verse como una figura rellena y en su lugar se dibujan líneas entre los vértices. 

- Al cambiarlo a GL_POINTS, se muestran únicamente los puntos correspondientes a cada vértice, osea  solo se ven tres puntos en la pantalla.
- Por otro lado, al modificar el tercer parámetro a 2, solo se utilizan dos vértices para el dibujo, por lo que no se forma un triángulo completo de hecho solo se ve el fondo.

- Si se cambia a 4, OpenGL intenta usar cuatro vértices, pero como solo se definieron tres en el ejemplo, solo se ve el fondo ya que accede a datos no correspondientes

## Preguntas

1. ¿Qué es el contexto OpenGL?

- donde debe trabajar el OpenLG

2. ¿Cuál es el rol de la biblioteca GLFW y qué ventaja tiene usarla?

- crea la ventana y maneja teclado y mouse ademas de crear el contexto, ayuda a simplificar todo y funciona igual en diferentes sistemas para no tener que programar algo extenso he inecesario.

3. ¿Por qué crees que OpenGL necesita un contexto (recuerda la analogía del taller de arte)?

- porque necesita un lugar para trabajar, como en el taller de artes donde se guardan las herramientas, configuraciones y recursos.

4. ¿En últimas qué será el framebuffer y a qué te recuerda de las dos primeras unidades del curso?
Es la memoria donde la GPU dibuja la imagen antes de mostrarla en pantalla.

- me recuerda a cuando en esamblador usabamos SCREEN y pintabamos un pixel de la pantalla en negro

5. ¿Qué relación entre en el viewport y el 
framebuffer?

- El framebuffer es toda el área donde se puede dibujar, y el viewport es una parte de ese espacio donde realmente se renderiza la imagen.

6. ¿En todo la analizado hasta ahora qué rol juega los drivers de la GPU y la GPU misma?

-En la gpu es donde se hacen los calculos y se dibuja, los drivers permiten la comunicacion entre GPU y OpenGL

7. ¿Por qué crees que sea necesario activar el VSync? ¿Si no lo activas y la imagen es estática qué crees que pase, y si es dinámica?

- Sirve para sincronizar los frames con la pantalla.

- Si no se activa y la imagen es estática, casi no se nota.
- Si es dinámica, puede haber “cortes” o desgarros (tearing) porque los frames no coinciden con la actualización del monitor.

8. En esta unidad estamos usando OpenGL moderno, pero ¿Qué es OpenGL Legacy? ¿Qué diferencias hay entre ambos?

- OpenGL Legacy es la versión antigua que tenía funciones más simples pero menos control (como glBegin, glEnd).

- OpenGL moderno usa shaders y da más control y eficiencia, pero es más complejo.

9. ¿Qué es el shader program? ¿Por qué es importante en OpenGL moderno?

- Es un conjunto de programas que se ejecutan en la GPU para procesar los datos gráficos. Es importante porque en OpenGL moderno todo el dibujo depende de ellos.

10. Trata de revisar el código setupTriangle(), intuitivamente ¿Qué crees que hace? ¿Qué crees que es el VAO y el VBO?

- prepara los datos del triángulo para que la GPU los pueda usar.

VBO ->guarda los datos (vértices)
VAO ->define cómo se interpretan esos datos

11. En el ciclo principal (game loop) de OpenGL, notaste que en cada frame (cuadro) le decimos a openGL que use el shader program y el VAO. Si le indicas esto antes del game loop ¿Será necesario seguirlo haciendo en cada loop? Si no es necesario ¿En qué casos crees que esto puede ser útil?

- No siempre, pero se hace por seguridad. Puede ser útil cuando cambias de objetos, shaders o configuraciones durante el programa.

12. Finalmente, recuerda lo que hace glfwSwapBuffers(mainWindow); ¿Por qué crees que es importante? ¿Qué pasaría si no lo llamas? ¿Cómo explicas lo que pasa si no lo llamas? (experimenta)

Intercambia lo que se dibujó con lo que se muestra en pantalla.
Si no se llama, la imagen no se actualiza y no se vería nada nuevo, como si nunca se mostrara lo que se dibuja.


