# Aplicación (Actividad #7)

(Le pedi la ayuda a la IA para hacerlo paso a paso explicandome lo que hacia en el proceso)

- A primera instancia no me parece compleja la actividad ya que por lo que puedo comprender se necesita simplemente otros dos casos de salida de particula y una explosión de particulas en el archivo ya hecho dado por el profesor.

##  ¿Cómo y por qué implementé las extensiones?

para la aplicación se crearon dos tipos de salidas de particulas las falling particles que caen desde la parte superior se mueven hacia abajo simulando gravedad y las zigzagParticles que suben  simulando el movimiento de una funcion seno  tambien se agrego una nueva tipo e explosion llamada SpiralExplosion donde las particulas giran mientras se expanden para por ultimo contraerse

opte por que fuera mas modular sin cambiar el codigo que tenia anteriormente de la actividad 2, aprovechando la herencia.

todas las particulas se heredan de la clase Particle, lo que me ayudo a reutilizar parte del codigo

todas las particulas se siguen guardadon en un vector particle sin emabrgo cada una tien su propio update() y draw

## ¿Cómo verifiqué?

Probé cada partícula usando teclas diferentes:

Presionando "f" aparecen partículas que caen

![alt text](<Captura de pantalla 2026-04-01 144241.png>)


Presionando "z" aparecen en zigzag

![alt text](<Captura de pantalla 2026-04-01 144252.png>)

el efecto de explosion se activa de forma aleatoria 

![alt text](image-7.png)
(Aca se puede ver la roja como tipo espiral)
El resto funciona igual que en la actividad 2

También verifiqué en el debugger que el vector contiene distintos tipos de objetos (RisingParticle, FallingParticle, etc.) pero todos como Particle*.

Esto demuestra el polimorfismo porque el mismo código funciona para diferentes tipos.

presento un error en que en caso de no poder arreglarlo me tocara solucionarlo en la clase del lunes para tomar las capturas de los breakpoints
