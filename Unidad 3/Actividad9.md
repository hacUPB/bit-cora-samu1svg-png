### 1) ¿Qué puedes concluir de los miembros estáticos y de instancia?
los miembros de instancia: cada objeto tiene su propia copia y vive con el objeto,sus valores son unicos y no se afectan entre si.
los miembros estáticos:solo existen uno para toda la clase, se guarda en la zona de datos estaticos/globales y entre todos los objetos se comparten el mismo valor
2) ¿En qué segmento de memoria están c1, c2, c3 y Contador::total?
c1 y c2 estab en Stack.
c3 que es puntero tambien en Stack.

el objeto al que apunta el c3 esta en Heap.

Contador::total estan en los Segmentos de memoria de datos globales/estáticos.
