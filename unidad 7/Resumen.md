===============================
🧠 RESUMEN OPENGL (TRIÁNGULO SIMPLE)
===============================

🔷 IDEA GENERAL
OpenGL es una API (lenguaje) que se usa para decirle a la GPU qué dibujar.
La GPU es la que realmente hace el trabajo pesado y dibuja en pantalla.

===============================
🪟 GLFW
===============================
- Crea la ventana
- Maneja teclado y mouse
- Crea el contexto OpenGL
Ventaja: funciona en distintos sistemas y simplifica todo

===============================
🧠 CONTEXTO OPENGL
===============================
Es el "espacio de trabajo" de OpenGL.
Contiene:
- estado actual (colores, shaders, etc.)
- recursos (buffers, texturas)
- conexión con la ventana
Sin contexto → OpenGL no puede hacer nada

Se activa con:
glfwMakeContextCurrent(window);

===============================
🧱 opengl32.lib
===============================
- Permite iniciar OpenGL en Windows
- Solo soporta funciones viejas (1.1)
- Se usa en compilación

===============================
⚡ GLAD
===============================
- Carga funciones modernas de OpenGL desde los drivers
- Se usa en ejecución
Sin GLAD → no puedes usar OpenGL moderno

===============================
🧮 GLM
===============================
- Librería de matemáticas
- Maneja vectores y matrices
- Sirve para mover, rotar, escalar objetos
- Solo usa .hpp (no necesita .lib ni .dll)

===============================
🧩 GPU Y DRIVERS
===============================
GPU:
- hace los cálculos
- dibuja en paralelo

Drivers:
- permiten que OpenGL se comunique con la GPU

Flujo:
código → OpenGL → drivers → GPU → framebuffer

===============================
🖼️ FRAMEBUFFER
===============================
- Memoria donde la GPU dibuja antes de mostrar en pantalla
- Es como una hoja donde se pinta la imagen
- Luego se muestra en el monitor

===============================
📐 VIEWPORT
===============================
Define en qué parte del framebuffer se dibuja

glViewport(x, y, width, height);

Si cambias:
- más pequeño → dibujo reducido
- más grande → puede recortarse
- cambia posición → dibujo se mueve

===============================
🔁 CALLBACK RESIZE
===============================
glfwSetFramebufferSizeCallback(window, callback);

Ajusta el viewport cuando cambia el tamaño de la ventana

===============================
🔷 VBO (Vertex Buffer Object)
===============================
- Guarda datos en la GPU
- Ej: posiciones de vértices

===============================
🔶 VAO (Vertex Array Object)
===============================
- Define cómo leer los datos del VBO
- Configura atributos

Relación:
VBO → datos
VAO → cómo interpretarlos

===============================
🎨 SHADER PROGRAM
===============================
- Programas que corren en la GPU
- Definen cómo se procesan los datos
- Son esenciales en OpenGL moderno

===============================
🔺 DIBUJO (glDrawArrays)
===============================
glDrawArrays(mode, first, count);

mode:
- GL_TRIANGLES → triángulo
- GL_LINES → líneas
- GL_POINTS → puntos

count:
- cantidad de vértices usados

Ejemplos:
count = 2 → no forma triángulo
count = 4 → comportamiento inesperado

===============================
🔁 GAME LOOP
===============================
Se repite constantemente:
- limpiar pantalla
- usar shader
- usar VAO
- dibujar

Aunque se puede configurar antes,
se repite en cada frame por flexibilidad
(cambiar objetos, shaders, etc.)

===============================
🔄 DOUBLE BUFFER (SwapBuffers)
===============================
glfwSwapBuffers(window);

- intercambia imagen dibujada con la visible
- evita parpadeos

Si no se usa:
- no se actualiza la pantalla
- no ves cambios

===============================
⚡ VSYNC
===============================
- sincroniza FPS con el monitor
- evita tearing (imagen cortada)

Sin VSync:
- estático → casi no afecta
- dinámico → imagen se rompe

===============================
🆚 OPENGL LEGACY VS MODERNO
===============================
Legacy:
- funciones viejas (glBegin, glEnd)
- menos control

Moderno:
- usa shaders
- más eficiente
- más complejo

===============================
🎯 IDEA FINAL
===============================
- Tú → escribes código
- OpenGL → da instrucciones
- Drivers → traducen
- GPU → dibuja
- Framebuffer → guarda imagen
- Pantalla → muestra resultado