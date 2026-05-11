

utilice el codigo corregido de la actividad 5 para llevar a cabo la aplicación el triangulo sigue el cursor mientras que cambia de color utilizando sin para varias entre valores de -1 y 1

1. Describe brevemente los cambios que realizaste en el código C++ (dónde obtienes el tiempo, cómo y dónde actualizas el uniform).

En C++ agregué glfwGetTime() para obtener el tiempo en segundos. Después hice un uniform llamado timeValue y lo actualicé dentro del game loop usando glUniform1f() para mandarle el tiempo al shader en cada frame.

2. Pega el código modificado de tu fragment shader.

```c++
#version 460 core

out vec4 FragColor;

uniform vec4 ourColor;
uniform float timeValue;

void main() {

    float pulse = (sin(timeValue) + 1.0) / 2.0;

    FragColor = vec4(
        ourColor.r * pulse,
        ourColor.g * pulse,
        0.0,
        1.0
    );
}
```

3. Explica cómo usaste la función de tiempo (sin, cos, u otra) para lograr el efecto de cambio de color cíclico. ¿Qué rango de valores produce tu cálculo y cómo afecta eso al color final?

Usé sin(timeValue) porque genera un cambio suave y repetitivo. El seno normalmente da valores entre -1 y 1, entonces con (sin(timeValue) + 1.0) / 2.0 los valores quedan entre 0 y 1. Eso hace que el color aumente y disminuya poco a poco en vez de cambiar bruscamente.

4. Incluye una captura de pantalla o UN ENLACE a un video mostrando el resultado del triángulo con color cambiante.

![alt text](<Captura de pantalla 2026-05-11 004145.png>)
  - cambiando dependiendo del valor de seno

![alt text](<Captura de pantalla 2026-05-11 004154.png>)
5. Reflexión: ¿Qué otros efectos visuales simples podrías lograr usando el tiempo como uniform? Piensa en la posición, el tamaño o la rotación (aunque no hemos visto rotaciones formalmente, ¡intuitivamente podrías intentarlo!). Anota al menos una idea.

También se podría usar el tiempo para mover el triángulo solo, hacerlo más grande y pequeño o hasta girarlo. Básicamente cualquier cosa que cambie constantemente se puede hacer usando tiempo como uniform.

### codigo completo de triangle:

```c++
#include <iostream>
#include <glad/glad.h>
#include <GLFW/glfw3.h>


// Callback: ajusta el viewport cuando cambie el tamaño de la ventana
void framebuffer_size_callback(GLFWwindow* window, int width, int height) {
	glViewport(0, 0, width, height);
}

// Procesa entrada simple: cierra con ESC
void processInput(GLFWwindow* window) {
	if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
		glfwSetWindowShouldClose(window, true);
}

// Tamaño de las ventanas
const unsigned int SCR_WIDTH = 400;
const unsigned int SCR_HEIGHT = 400;

// Fuentes de los shaders
const char* vertexShaderSrc = R"glsl(
    #version 460 core

    layout(location = 0) in vec3 aPos;

    uniform vec2 offset;

    // correccion
    uniform float timeValue;

    void main() {

        vec3 newPos = aPos;

       

        newPos.x += offset.x;
        newPos.y += offset.y;

        gl_Position = vec4(newPos, 1.0);
    }

)glsl";

const char* fragmentShaderSrc = R"glsl(
    #version 460 core

    out vec4 FragColor;

    uniform vec4 ourColor;

    // correccion
    uniform float timeValue;

    void main() {

        // correccion
        float pulse = (sin(timeValue) + 1.0) / 2.0;

        // correccion
        FragColor = vec4(
            ourColor.r * pulse,
            ourColor.g * pulse,
            0.0,
            1.0
        );
    }

)glsl";

// IDs globales
unsigned int VAO, VBO;
unsigned int shaderProg;

// Compila y linkea un programa de shaders, retorna su ID
unsigned int buildShaderProgram() {

	int success;
	char log[512];

	unsigned int vs = glCreateShader(GL_VERTEX_SHADER);

	glShaderSource(vs, 1, &vertexShaderSrc, nullptr);

	glCompileShader(vs);

	glGetShaderiv(vs, GL_COMPILE_STATUS, &success);

	if (!success) {

		glGetShaderInfoLog(vs, 512, nullptr, log);

		std::cerr << "ERROR VERTEX SHADER:\n" << log << "\n";
	}

	unsigned int fs = glCreateShader(GL_FRAGMENT_SHADER);

	glShaderSource(fs, 1, &fragmentShaderSrc, nullptr);

	glCompileShader(fs);

	glGetShaderiv(fs, GL_COMPILE_STATUS, &success);

	if (!success) {

		glGetShaderInfoLog(fs, 512, nullptr, log);

		std::cerr << "ERROR FRAGMENT SHADER:\n" << log << "\n";
	}

	unsigned int prog = glCreateProgram();

	glAttachShader(prog, vs);
	glAttachShader(prog, fs);

	glLinkProgram(prog);

	glGetProgramiv(prog, GL_LINK_STATUS, &success);

	if (!success) {

		glGetProgramInfoLog(prog, 512, nullptr, log);

		std::cerr << "ERROR LINKING PROGRAM:\n" << log << "\n";
	}

	glDeleteShader(vs);
	glDeleteShader(fs);

	return prog;
}

// Crea un VAO/VBO con los datos de un triángulo
void setupTriangle() {

	float vertices[] = {

		-0.5f, -0.5f, 0.0f,
		 0.5f, -0.5f, 0.0f,
		 0.0f,  0.5f, 0.0f
	};

	glGenVertexArrays(1, &VAO);

	glGenBuffers(1, &VBO);

	glBindVertexArray(VAO);

	glBindBuffer(GL_ARRAY_BUFFER, VBO);

	glBufferData(
		GL_ARRAY_BUFFER,
		sizeof(vertices),
		vertices,
		GL_STATIC_DRAW
	);

	glVertexAttribPointer(
		0,
		3,
		GL_FLOAT,
		GL_FALSE,
		3 * sizeof(float),
		(void*)0
	);

	glEnableVertexAttribArray(0);

	glBindVertexArray(0);
}


int main()
{
	// 1) Inicializar GLFW
	if (!glfwInit()) {

		std::cerr << "Fallo al inicializar GLFW\n";

		return -1;
	}

	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4);

	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 6);

	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

	// 2) Crear ventana
	GLFWwindow* mainWindow = glfwCreateWindow(
		SCR_WIDTH,
		SCR_HEIGHT,
		"Ventana",
		nullptr,
		nullptr
	);

	if (!mainWindow) {

		std::cerr << "Error creando ventana1\n";

		glfwTerminate();

		return -1;
	}

	// 3) Lee el tamaño del framebuffer
	int bufferWidth, bufferHeight;

	glfwGetFramebufferSize(
		mainWindow,
		&bufferWidth,
		&bufferHeight
	);

	// 4) Callbacks
	glfwSetFramebufferSizeCallback(
		mainWindow,
		framebuffer_size_callback
	);

	// 5) Cargar GLAD y recursos en contexto de window1
	glfwMakeContextCurrent(mainWindow);

	if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress)) {

		std::cerr << "Fallo al cargar GLAD (contexto1)\n";

		return -1;
	}

	// 6) Habilita el V-Sync
	glfwSwapInterval(1);

	// 7) Compila y linkea shaders
	shaderProg = buildShaderProgram();

	// Uniforms
	glUseProgram(shaderProg);

	int offsetLocation =
		glGetUniformLocation(shaderProg, "offset");

	int colorLocation =
		glGetUniformLocation(shaderProg, "ourColor");

	// correccion
	int timeLocation =
		glGetUniformLocation(shaderProg, "timeValue");

	// 8) Genera el contenido a mostrar
	setupTriangle();

	// 9) Configura el viewport
	glViewport(0, 0, bufferWidth, bufferHeight);

	// 10) Loop principal
	while (!glfwWindowShouldClose(mainWindow))
	{
		// 11) Manejo de eventos
		glfwPollEvents();

		// 12) Procesa la entrada
		processInput(mainWindow);

		// 13) Configura el color de fondo y limpia el framebuffer
		glClearColor(0.2f, 0.3f, 0.3f, 1.0f);

		glClear(GL_COLOR_BUFFER_BIT);

		// 14) Indica a OpenGL que use el shader program
		glUseProgram(shaderProg);

		// Dibuja el triángulo
		double xpos, ypos;

		glfwGetCursorPos(mainWindow, &xpos, &ypos);

		// Normalizo las coordenadas del mouse
		float x = (float)xpos / (float)SCR_WIDTH;

		x < 0 ? x = 0 : x;
		x > 1 ? x = 1 : x;

		float y = (float)ypos / (float)SCR_HEIGHT;

		y < 0 ? y = 0 : y;
		y > 1 ? y = 1 : y;

		// correccion
		float timeValue = glfwGetTime();

		// correccion
		glUniform1f(
			timeLocation,
			timeValue
		);

		// Envio el color y la posición del triángulo
		glUniform4f(
			colorLocation,
			x,
			y,
			0.0f,
			1.0f
		);

		// Envio el offset del triángulo normalizado a NDC
		glUniform2f(
			offsetLocation,
			x * 2 - 1,
			1 - y * 2
		);

		// 15) Activa el VAO y dibuja el triángulo
		glBindVertexArray(VAO);

		glDrawArrays(GL_TRIANGLES, 0, 3);

		// 16) Intercambia buffers y muestra el contenido
		glfwSwapBuffers(mainWindow);
	}

	// 17) Limpieza
	glfwMakeContextCurrent(mainWindow);

	glDeleteVertexArrays(1, &VAO);

	glDeleteBuffers(1, &VBO);

	glDeleteProgram(shaderProg);

	glfwDestroyWindow(mainWindow);

	glfwTerminate();

	return 0;
}
```