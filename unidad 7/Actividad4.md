 ## Reporta en tu bitácora:
Luego de estudiar las unidades 1 y 2 de este curso y ver el video, escribe con tus propias palabras ¿Cuál es la diferencia entre una CPU y una GPU?

### CPU
La cpu está diseñada para hacer tareas complejas una por una buena para ejecutar sistemas operativos, abrir programas, tomar desiciones logicas

- Tiene pocos núcleos (cores) pero muy potentes.
### GPU
la gpu es lo opuesto, está diseñada para manejar muchísimas tareas simples al mismo tiempo.
se usa para videojuegos, Gráficos 3D, inteligencia artificial

- Tiene cientos o miles de núcleos pequeños.

1. ¿Cuáles son los tres pasos claves del pipeline de OpenGL? Explica en tus propias palabras cuál es el objetivo de cada paso.

el procesamiento de vertices que toma los vertices del objeto y calcula su posicion en pantalla
unsado el vertex shader

Rasterización Convierte las figuras en fragmentos que representan posibles pixeles 

procesamiento de fragmentos  en el que se decide el color final de cada fragmento, aplicandole, colores, texturas e iluminación.

2. La gran novedad que introduce OpenGL moderno es el pipeline programable. ¿Qué significa esto? ¿Qué diferencia hay entre el pipeline fijo y el programable? ¿Qué ventajas le ves a esto? y si el pipeline es programable, ¿Qué tengo que programar?

significa que ahora los programadores pueden escribir pequeños programs llamados shaders para controlar como trabaja la gpu

Antes, en el pipeline fijo OpenGL hacía todo automáticamente y casi no se podía modificar.

En el programable, uno puede decidir cómo transformar vértices o calcular colores e iluminación.

3. Si fueras a describir el proceso de rasterización ¿Qué dirías?

La rasterización es el proceso donde la GPU toma las figuras geométricas (como triángulos) y determina qué partes ocupan espacio en la pantalla, generando fragmentos para cada zona cubierta.

4. ¿Qué son los fragmentos? ¿Es lo mismo un fragmento que un pixel? ¿Por qué?

 con lo que entendi no, un fragmento es un candidato a pixel generado durante una rasterización contiene la info de color, profundidad, textura.

 luego de algunos calculos puede convertirse en un pixel final visible.

5. Explica qué problema resuelve el Z-buffer y ¿Qué es el depth test?

El Z-buffer guarda la profundidad de los objetos para saber cuál está más cerca de la cámara.

El depth test compara la profundidad de los fragmentos

6. ¿Por qué se presenta el problema de la aliasing? ¿Qué es el anti-aliasing?

El aliasing aparece porque las figuras son continuas pero la pantalla usa píxeles cuadrados discretos.
Eso produce bordes “dentados”.

El anti-aliasing intenta suavizar esos bordes usando muestras adicionales o mezclando colores para que las líneas se vean más suaves.

7. ¿Qué relación hay entre la iluminación y el fragment shader? Siempre es necesario tener en cuenta la iluminación en un fragment shader? o puedo hacer un fragment shader sin iluminación? Explica que implicaciones tiene esto.

El fragment shader normalmente calcula la iluminación final de cada fragmento. Ahí se decide cómo afecta la luz al color.

No siempre es obligatorio usar iluminación se puede hacer un fragment shader simple con un color fijo.
pero la escena se verá plana y menos realista

pero cuando se usa iluminación aumenta el realismo,
pero también aumenta el trabajo de la GPU.

8. ¿Qué implica para la GPU que una aplicación tenga múltiples fuentes de iluminación?

La GPU debe hacer más cálculos para cada fragmento porque tiene que evaluar cómo afecta cada luz al objeto.
Entre más luces mayor uso de GPU, más operaciones matemáticas, menor rendimiento posible

Por eso en videojuegos normalmente se optimiza la cantidad de luces activas al mismo tiempo. 

como hace el ejemplo del video renderizando solo las partes que se encuentran en la vision de la pantalla.

---

que es vertex shader?

Un vertex shader es un pequeño programa que corre en la GPU y se ejecuta para cada vértice de un objeto.

 Su trabajo principal es:

tomar la posición del vértice
transformarla
decidir dónde aparece en pantalla

