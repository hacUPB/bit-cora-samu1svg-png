## Actividad 1

### Encapsulamiento
el principio de agrupar datos(atributos,metodos) en solo una clase, restringiendo el acceso a los componentes internos
fue de utilidad cuando vi la materia de poo mas que todo en el final, que era un reto empresarial con modulos especificos, siendo buen concepto para restringir clases.
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
permite crear nuevas clases basadas en clases ya existentes (superclases o padres). La subclase hereda los atributos y metodos de la superclase, fomentando el reutilizar codigo.

el bastante util gracias a que funciona como molde para objetos con comportamientos parecidos
ahorrando la necesidad de crear una clase para cada situación.

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

un codigo polimorfico es un tipo de software malicioso que cambia constantemente su estructura cada vez que se replica lo que le permite evadir antivirus comunes de la red.

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

### Parte 3

1. pues creo que definir las dimensiones de un clase, que puede cambiar entre cada objeto se vuelve complicado, tipo, si es un rectangulo es diferente a un circulo y asi, diria que el nombre se hereda de la clase forma y ya las dimensiones sean atributos que cada objeto particular cree 
o tambien usar una clase particular rectangulo de la cual si se hacen proximos objetos se utilice de molde la inicial (clase rectangulo) con sus atributos de base, nombre y altura

2. pienso que depende del objeto que se llame,si llamas al circulo dentro de este tiene su dibujar sobreescrito para adaptarlo al circulo, toma el de cada objeto particular, pienso yo.

3. creo que es mientras trabajas en el codigo te genera un error al utilizar la clase fuera del contexto.

### Parte 4
 aunque comprendo conceptualmente buscare la manera de reconocer mejor el codigo
 