===============================
🧠 RESUMEN OPENGL (TRIÁNGULO SIMPLE)

🔷 IDEA GENERAL

OpenGL es una API (lenguaje) que se usa para decirle a la GPU qué dibujar.
La GPU es la que realmente hace el trabajo pesado y dibuja en pantalla.

===============================
🪟 GLFW

Crea la ventana
Maneja teclado y mouse
Crea el contexto OpenGL

Ventaja:
funciona en distintos sistemas y simplifica todo

===============================
🧠 CONTEXTO OPENGL

Es el "espacio de trabajo" de OpenGL.

Contiene:

estado actual (colores, shaders, etc.)
recursos (buffers, texturas)
conexión con la ventana

Sin contexto → OpenGL no puede hacer nada

Se activa con:

glfwMakeContextCurrent(window);

===============================
🧱 opengl32.lib

Permite iniciar OpenGL en Windows
Solo soporta funciones viejas (1.1)
Se usa en compilación

===============================
⚡ GLAD

Carga funciones modernas de OpenGL desde los drivers
Se usa en ejecución

Sin GLAD → no puedes usar OpenGL moderno

===============================
🧮 GLM

Librería de matemáticas
Maneja vectores y matrices
Sirve para mover, rotar, escalar objetos

Solo usa .hpp
(no necesita .lib ni .dll)

===============================
🧩 GPU Y DRIVERS

GPU:

hace cálculos gráficos
dibuja millones de píxeles en paralelo
ejecuta shaders

Drivers:

permiten comunicación entre OpenGL y la GPU

Flujo:

código → OpenGL → drivers → GPU → framebuffer

===============================
🖼️ FRAMEBUFFER

Memoria donde la GPU dibuja antes de mostrar en pantalla

Es como una hoja donde se pinta la imagen

Luego se muestra en el monitor

===============================
📐 VIEWPORT

Define en qué parte del framebuffer se dibuja

glViewport(x, y, width, height);

Si cambias:

más pequeño → dibujo reducido
más grande → puede recortarse
cambia posición → dibujo se mueve

===============================
🔁 CALLBACK RESIZE

glfwSetFramebufferSizeCallback(window, callback);

Ajusta el viewport cuando cambia el tamaño de la ventana

===============================
🔷 VBO (Vertex Buffer Object)

Guarda datos en la GPU

Ejemplos:

posición
color
offset
texturas

===============================
🔶 VAO (Vertex Array Object)

Define cómo OpenGL interpreta los datos del VBO

Guarda:

atributos
offsets
estructura de vértices

Relación:

VBO → datos
VAO → cómo leerlos

===============================
🧩 ATRIBUTOS DE VÉRTICES

Son datos individuales de cada vértice.

Ejemplos:

posición
color
coordenadas UV
offset

Se configuran con:

glVertexAttribPointer()

===============================
🧠 glVertexAttribPointer

Le explica a OpenGL:

dónde empieza un atributo
cuántos valores tiene
cómo están organizados los datos

Ejemplo:

posición → 3 floats
color → 3 floats
offset → 2 floats

===============================
🔓 glEnableVertexAttribArray

Activa un atributo específico.

Ejemplo:

glEnableVertexAttribArray(0);

habilita el atributo de posición.

Si no se activa:
OpenGL ignora ese atributo.

===============================
🎨 SHADER PROGRAM

Programas que corren en la GPU.

Definen cómo se procesan los datos.

Son esenciales en OpenGL moderno.

===============================
🟦 VERTEX SHADER

Shader que procesa cada vértice.

Se usa para:

mover vértices
cambiar posiciones
hacer transformaciones

Siempre debe asignar:

gl_Position

===============================
🟥 FRAGMENT SHADER

Shader que procesa fragmentos/píxeles.

Se usa para:

colores
iluminación
sombras
efectos visuales

===============================
🧩 PIPELINE PROGRAMABLE

En OpenGL moderno puedes programar partes del pipeline usando shaders.

Antes (legacy):
OpenGL hacía muchas cosas automáticamente.

Ahora:
el programador controla el comportamiento gráfico.

Ventajas:

más control
más rendimiento
más efectos visuales

===============================
🔺 DIBUJO (glDrawArrays)

glDrawArrays(mode, first, count);

mode:

GL_TRIANGLES → triángulo
GL_LINES → líneas
GL_POINTS → puntos

count:

cantidad de vértices usados

Ejemplos:

count = 2 → no forma triángulo
count = 4 → comportamiento raro

===============================
🔁 GAME LOOP

Se repite constantemente:

limpiar pantalla
usar shader
usar VAO
dibujar
intercambiar buffers

Aunque algunas cosas podrían configurarse antes,
se repiten por flexibilidad.

===============================
🔄 DOUBLE BUFFER (SwapBuffers)

glfwSwapBuffers(window);

intercambia:

buffer oculto ↔ buffer visible

Evita parpadeos.

Si no se usa:

la imagen no se actualiza
no ves cambios

===============================
⚡ VSYNC

Sincroniza FPS con el monitor.

Evita:

screen tearing
(imagen partida)

Sin VSync:

estático → casi no afecta
dinámico → se rompe la imagen

===============================
🆚 OPENGL LEGACY VS MODERNO

Legacy:

usa glBegin y glEnd
menos control
más simple
más lento

Moderno:

usa shaders
usa VAO/VBO
más rápido
más flexible

===============================
🧠 RASTERIZACIÓN

Proceso donde la GPU convierte figuras
(triángulos, líneas, etc.)
en fragmentos/píxeles.

===============================
🧩 FRAGMENTOS

Un fragmento es un candidato a píxel.

Todavía no es un píxel final porque:

puede descartarse
puede fallar depth test
puede mezclarse

===============================
🧱 Z-BUFFER

Memoria que guarda profundidad.

Sirve para saber qué objeto está más cerca de la cámara.

===============================
🔍 DEPTH TEST

Compara profundidades usando el Z-buffer.

Evita que objetos lejanos se dibujen encima de objetos cercanos.

===============================
〰️ ALIASING

Efecto de bordes "dentados".

Pasa porque los píxeles son cuadrados
y las diagonales no encajan perfecto.

===============================
✨ ANTI-ALIASING

Técnicas para suavizar bordes.

Hace que los objetos se vean menos pixelados.

===============================
💡 ILUMINACIÓN

Normalmente se calcula en el fragment shader.

No siempre es necesaria.

Sin iluminación:
objetos planos/simple color.

Con iluminación:
más realismo.

===============================
💡 MUCHAS LUCES

Más luces = más cálculos para la GPU.

Puede bajar rendimiento si hay demasiadas.

===============================
🌐 UNIFORMS

Variables globales dentro de shaders.

Se envían desde C++.

Son iguales para todos los vértices o fragmentos durante un draw call.

Ejemplos:

tiempo
color
posición global

===============================
📍 glGetUniformLocation

Busca la ubicación de un uniform dentro del shader.

===============================
📤 glUniform

Envía datos desde C++ al shader.

Ejemplos:

glUniform1f → float
glUniform2f → vec2
glUniform4f → vec4

===============================
🖱️ COORDENADAS DEL MOUSE

El mouse trabaja en píxeles.

Ejemplo:

0 → 400

OpenGL usa NDC:

-1 → 1

Por eso hay que convertir coordenadas.

===============================
📏 NORMALIZACIÓN

Convierte coordenadas del mouse:

de:
0 → ancho/alto ventana

hacia:
0 → 1

Ejemplo:

x = xpos / width;

===============================
🎯 NDC (Normalized Device Coordinates)

Sistema de coordenadas de OpenGL.

Horizontal:

-1 izquierda
0 centro
1 derecha

Vertical:

1 arriba
-1 abajo

===============================
🔄 CONVERSIÓN A NDC

Para pasar de 0→1 a -1→1:

x * 2 - 1

Para Y:

1 - y * 2

porque el eje Y está invertido.

===============================
⏱️ glfwGetTime()

Devuelve el tiempo en segundos desde que GLFW inició.

Sirve para:

animaciones
movimientos
cambios dinámicos

===============================
〰️ sin(time)

Genera valores cíclicos suaves entre:

-1 y 1

Muy útil para:

animaciones
colores pulsantes
movimiento suave

===============================
🎨 COLOR PULSANTE

Ejemplo:

(sin(time)+1)/2

Convierte:

-1 → 1

en:

0 → 1

perfecto para colores.

===============================
🎯 IDEA FINAL

Tú → escribes código
OpenGL → da instrucciones
Drivers → traducen
GPU → dibuja
Framebuffer → guarda imagen
Pantalla → muestra resultado

OpenGL moderno funciona principalmente usando:

VAO
VBO
Shaders
Uniforms
Pipeline programable
