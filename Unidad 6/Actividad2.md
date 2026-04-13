
Análisis del caso de estudio
1. **Identifica los Roles:**
    - ¿Qué clase actúa como la interfaz `Observer`? ¿Qué método define?
    seria la clase
```.c++
class Observer
```
en el que define el metodo
```.c++
onNotify(const std::string & event)
```
 - ¿Qué clase actúa como `Subject`? ¿Qué métodos proporciona para gestionar observadores y notificar?
```.c++
class Subject
```
presenta los metodos:

- addObserver()
- removeObserver()
- notify()


    - ¿Qué clase es el `ConcreteSubject` en esta aplicación? ¿Por qué? (Pista: ¿Quién *envía* las notificaciones?)

seria el ´´ofApp´´ es el que envia las notificaciones cuando se presiona las teclas

- ¿Qué clase(s) actúan como `ConcreteObserver`? ¿Por qué? (Pista: ¿Quién *recibe* y *reacciona* a las notificaciones?)

esa clase seria particle ellos son los que reciben los mensajes en onNotify y reaccionan cambiando su estado

2. **Sigue el flujo de notificación:**
    - Localiza el método `keyPressed` en `ofApp.cpp`. ¿Qué sucede cuando se presiona la tecla ‘a’? ¿Qué método se llama?
    ```.c++
    void ofApp::keyPressed(int key) {
	switch (key) {
	case 's':
		notify("stop");
		break;
	case 'a':
		notify("attract");
		break;
	case 'r':
		notify("repel");
		break;
	case 'n':
		notify("normal");
		break;
	default:
		break;
	}
   } 
    ```
llaman a notify y envian un mensaje dependiendo la tecla en este caso el evento "attract" que atrae las particulas

- Localiza el método que implementa la interfaz `Observer` en la clase `Particle` (`onNotify`). ¿Qué hace este método cuando recibe el evento “attract”?

este recorre los observers es el que avisa el mensaje a todas las particulas


3. **Registro y eliminación de observadores:**
- ¿En qué parte del código se añaden las instancias de `Particle` como observadores de `ofApp`? (Busca dónde se llama a `addObserver`).

Esto se hace en Set Up en:
```.c++
addObserver(p);
```
cada particula se registra ahi
- Aunque no se usa explícitamente en este ejemplo simple, ¿Dónde se eliminarían los observadores si fuera necesario (por ejemplo, si una partícula se destruyera durante la ejecución)? (Busca `removeObserver`). ¿Por qué es importante el destructor de `ofApp` en este contexto?
se eliminaria en el destructor de ~ofApp() ahi se usaria removeObserver(p);
seria bueno tenerlo implementado ya que evita errores de memoria
 y elimina referencias a objetos borrados

 En resumen

 - Observer:
 Sirve para que varios objetos reciban información automáticamente cuando algo cambia.
 nos evita la aburrida tarea de estar revisando todo el tiempo o conectar todo directamente

 - Diagrama
 ```.c++
 ofApp  --->  Particle
 (envía)      (reciben)
 ```
 - secuencia:
 se presiona la tecla
 ofapp hace el notify()
 notify llama al OnNotify()
 cada particle cambia de estado
 - Porque es bueno usar patrones de diseño?
 -menos código acoplado
 -más fácil agregar nuevas partículas
 -no toca el código de ofApp
 -más ordenado
