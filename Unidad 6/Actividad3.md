## Propósito del patrón Factory Method

El patrón Factory Method sirve para crear objetos sin tener que especificar directamente la clase concreta que se va a usar. Osea, en vez de usar new en muchas partes del código, se utiliza una clase encargada de crear los objetos.

El problema principal que resuelve es que evita que el código esté lleno de instancias directas de diferentes clases, lo cual lo vuelve difícil de mantener y poco vialbe. Con este patrón, el código cliente solo pide un objeto y no necesita saber cómo se crea internamente

## Ventajas de usar ParticleFactory  

Usar ParticleFactory mejora la organización del código porque:
	- 	Se aplica el principio de responsabilidad única (SRP), ya que la creación        de partículas está en una sola clase y no en ofApp::setup.
	-   El código es más limpio y fácil de leer, porque en vez de configurar cada         partícula manualmente, solo se llama al método de la fábrica.
	- 	Es más fácil agregar nuevos tipos de partículas, ya que solo se modifica         la fábrica y no el resto del código.

##  Agregar una nueva partícula “black_hole 

Para agregar una nueva partícula llamada "black_hole" intentaria lo siguiente:
	1.	Ir a la clase ParticleFactory.
	2.	Modificar el método createParticle.
	3.	Agregar un nuevo caso, por ejemplo:
  
ParticleFactory::createParticle("black_hole");

##  Método estático o instancia 

El método createParticle es estático, lo que significa que no es necesario crear un objeto de la clase ParticleFactory para usarlo.

### Es:
	•	Más fácil de usar (se llama directamente)
	•	No necesita crear una instancia extra

### pero:
	•	Menos flexible si se quiere cambiar el comportamiento en tiempo de ejecución
	•	No permite aprovechar herencia o polimorfismo fácilmente

Si fuera un método de instancia, se podría tener diferentes tipos de fábricas, pero sería un poco más complejo de manejar.

