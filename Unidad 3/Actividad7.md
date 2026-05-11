## preguntas

### Explicación de la diferencia entre objetos creados en el stack y en el heap.
el objeto "pstack" se crea automaticamente al entrar al bloque
- su memoria se libera sola
- mas rapida
- no necesita delete
- vida controlada por scope
el objeto "pHeap" se crea usando new 
- vive hasta que se use delete
- la memoria no se libera automaticamente
- se accede mediante un puntero
- vida controlada manualmente por el programador


### pStack ¿Es un objeto o una referencia a un objeto?
es un objeto directamente

### pHeap ¿Es un objeto o una referencia a un objeto? Si es una referencia, ¿A qué objeto hace referencia?
pHeap no es un objeto, es un puntero
pHeap es un stack, mientras que el objeto punto(50,60)
pHeap guarda la direccion de donde esta el objeto
### Observa en Memory1 (Debug->Windows->Memory->Memory1) el contenido de la dirección de memoria de pHeap, recuerda escribir en la entrada de texto de Memory1 la dirección de memoria de &pHeap y presionar Enter. Compara el contenido de memoria con el contenido de pHeap en la pestaña de Locals (Debug->Windows->Locals). ¿Qué observas? ¿Qué significa esto?
al usar &pHeap se ve la dirección de memoria donde se encuentra ña variable pHeap
- pheap contiene la dirección de memoria 
no contiene ni x ni y contiene sus direcciones

- &pheap es la direccion del puntero hexadecimal que es la direccion que  muestra pheap en la ventana locals