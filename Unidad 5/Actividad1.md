## Actividad 1

### Encapsulamiento
el principio de agrupar datos(atributos,metodos) en solo una clase, restringiendo el acces a los componentes internos

en el codigo puedo ver un ejemplo claro que seria:
```c#
public abstract class Figura{ 

		private string nombre;

    public string Nombre {    

		    get { return nombre;}
		    protected set {nombre = value; }    
		                    }

```
esta es la clase principal figura
se utiliza get y set un claro ejemplo de encapsulamiento

1. el campo nombre es privado para no poder modificarse fuera de clase
ya la propiedad nombre es public para leer el valor desde otras clases, y controlar el valor que se le asigna.

### Herencia
permite crear nuevas clases basadas en clases ya existentes (superclases o padres). La subclase hereda los atributos y metodos de la superclase, fomentando el reutilizar codigo

en el codigo puedo ver un ejemplo claro que seria:
```c#
public class Rectangulo : Figura{    
		public double Base { get; private set; }    
		public double Altura { get; private set; }
    public Rectangulo(double b, double h) : base("Rectángulo")    {        
		    this.Base = b;        
		    this.Altura = h;    
		    }
```
se crea una subclase en base a a la clase figura

2. contiene Nombre(propiedad heredada de la figura, campo interno de la case base), tambien el metodo dibujar

### Polimorfismo
permite a objetos de diferentes clases responder al mismo mensaje o método de formas diferentes.

en el codigo puedo ver un ejemplo claro que seria:
```c#
  public abstract void Dibujar();
```
en la clase padre figura no sabe como utilizarlo, pero en las clases hijas ya si se utilizan dependiendo de la figura
```c#
//circulo
 public override void Dibujar()    {        
		    Console.WriteLine($"Dibujando un {Nombre} de radio {Radio}.");    
		    }
```

```c#
//cuadrado
 public override void Dibujar()    {        
		    Console.WriteLine($"Dibujando un {Nombre} de {Base}x{Altura}.");    
		    }
```
3. creo que funciona que por cada figura que existe en la lista se dibuja su nombre y valores e pantalla hasta que se acabe la lista