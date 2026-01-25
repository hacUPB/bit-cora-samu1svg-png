# 📘 Definiciones de elementos usados en el programa Hack

Este documento define los conceptos, símbolos e instrucciones que aparecen
en el programa ensamblador Hack mostrado en clase.

---

## 🖥️ SCREEN

- Símbolo predefinido del computador Hack.
- Dirección de memoria: `16384`.
- Representa el inicio de la memoria de video.
- Escribir en `SCREEN` afecta directamente los píxeles de la pantalla.

Valores comunes:
- `0`  → píxeles apagados
- `-1` → píxeles encendidos

---

## ⌨️ KBD

- Símbolo predefinido del computador Hack.
- Dirección de memoria: `24576`.
- Representa el registro del teclado.
- Guarda el código de la tecla presionada.

Comportamiento:
- `0`  → no hay tecla presionada
- `≠ 0` → hay una tecla presionada

---

## 🔢 Variable `i`

- Variable definida por el programador.
- Se almacena en la memoria RAM.
- Usada como:
  - Contador
  - Puntero de posición
  - Referencia a una dirección de pantalla

Puede incrementarse o decrementarse.

---

## 🧠 Registro A

- Registro de direcciones.
- Guarda:
  - Direcciones de memoria
  - Valores constantes
  - Símbolos del sistema
- Determina a qué posición apunta `M`.

---

## 🧠 Registro D

- Registro de datos.
- Usado para:
  - Cálculos
  - Comparaciones
  - Decisiones de salto
- No accede directamente a memoria.

---

## 🧠 M (Memory)

- Representa el contenido de la memoria en la dirección `A`.
- Equivale a `RAM[A]`.
- Permite leer o escribir datos en memoria.

---

## 🧩 Instrucción `@valor`

- Instrucción tipo A.
- Carga un valor en el registro `A`.
- El valor puede ser:
  - Un número
  - Una variable
  - Una etiqueta
  - Un símbolo del sistema

---

## 🧩 Instrucciones de asignación (`dest=comp`)

- Realizan operaciones y guardan el resultado.
- `dest` indica dónde se guarda el resultado.
- `comp` indica la operación.

Ejemplos comunes:
- `D=A`
- `M=D`
- `D=M`
- `M=M+1`
- `M=M-1`

---

## 🔁 Operaciones aritméticas usadas

- `D=D+A` → suma
- `D=D-A` → resta
- `M=M+1` → incremento
- `M=M-1` → decremento

---

## 🔁 Saltos (Jump)

- Controlan el flujo del programa.
- Dependen del valor del registro `D`.

Saltos usados:

### `JNE`
- Jump if Not Equal
- Salta si `D ≠ 0`.

### `JLE`
- Jump if Less or Equal
- Salta si `D ≤ 0`.

### `JGE`
- Jump if Greater or Equal
- Salta si `D ≥ 0`.

### `JMP`
- Salto incondicional.
- Siempre salta.

---

## 🏷️ Etiquetas (Labels)

- Representan direcciones en la memoria ROM.
- Se usan como destinos de salto.
- No ocupan memoria de datos.

Ejemplos:
- `(READKEYBOARD)`
- `(KEYPRESSED)`

---

## 🎮 Escritura en pantalla

- Escribir `0` en `M` → borra píxeles.
- Escribir `-1` en `M` → dibuja píxeles.
- La posición depende del valor actual de `A`.

---

## 🔄 Comparaciones con direcciones

- Se hacen mediante restas.
- El resultado se guarda en `D`.
- Se usan para verificar límites de memoria.

Ejemplo conceptual:
- `D = i - SCREEN`
- `D = i - KBD`

---

📌 Este archivo define todos los elementos utilizados
en el programa sin describir su ejecución paso a paso.
