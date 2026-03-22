# Actividad 4
## primer codigo
al descomentar las lineas da error de compilacion, no deja acceder a protectedVar ni a privateVar

porque esos atributos no son accesibles desde fuera de la clase

c++ bloquea el acceso dependiendo de si usas private, protected o public

## segundo codigo
no compila porque se intenta acceder a un atributo privado.
los atributos privados no se pueden usar directamente desde fuera de la clase. solo se puede acceder mediante metodos publicos

## tercer codigo
este ahora si sí compila y deja acceder a los valores privados, porque se esta accediendo directamente a la memoria del objeto

no se usan las reglas normales de c++

## ¡Que es encapsulamiento?
por lo que entiendo es una forma de controlar el acceso de los datos de una clase sea privada protegida o publica

permite ocultar info para que no se use de forma indebida

