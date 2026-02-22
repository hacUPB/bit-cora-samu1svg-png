
1) ¿para que sirven los breakpoints?
sirve para parar la ejecucion del programa en un parte determinada.
2) ¿Para qué se usa la ventana de depuración Autos?
para moverme atraves de las instrucciones
```.asm
#include <iostream>
int sum(int a, int b) {
	return a + b;
}

int main() {
	int a = 5;
	int b = 7;
	std::cout << "La suma de " << a << " y " << b << " es " << sum(a, b) << "\n";// salt de nuevo a it sum arriba en la linea 5
}
```