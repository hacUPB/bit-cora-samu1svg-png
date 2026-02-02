##Pseudocodigo
pintar los 16 bits de la posición dicha
@20496=-1
(Keyboard)
se presiona una tecla y se guarda en una posición de memoria (registro D)
ahora
if(D=105)
pasas al apartado (Derecha)
if(D=100)
pasas al apartado (Izquierda)
if(D=0)
Pasas al apartado (Keyboard)
(Derecha)
RAM[20496]=0//BORRAMOS LO PINTADO
RAM[20497]-1//PINTAMOS ESA DIRECCION DE PANTALLA

(Izquierda)
RAM[20496]=0//BORRAMOS LO PINTADO
RAM[20495]=-1//PINTAMOS ESA DIRECCION DE PANTALLA