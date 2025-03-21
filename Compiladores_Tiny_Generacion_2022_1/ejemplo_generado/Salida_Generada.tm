*      Compilacion TINY para el codigo objeto TM
*      Archivo: NOMBRE_ARREGLAR
*      Preludio estandar:
0:       LD       6,0(0)      cargar la maxima direccion desde la localidad 0
1:       ST       0,0(0)      limpio el registro de la localidad 0
*      -> asignacion
*      -> constante
2:       LDC       0,1(0)      cargar constante: 1
*      <- constante
3:       ST       0,0(5)      asignacion: almaceno el valor para el id x
*      <- asignacion
*      -> asignacion
*      -> constante
4:       LDC       0,0(0)      cargar constante: 0
*      <- constante
5:       ST       0,1(5)      asignacion: almaceno el valor para el id y
*      <- asignacion
*      -> repeat
*      repeat: el salto hacia el final (luego del cuerpo) del repeat debe estar aqui
*      -> escribir
*      -> identificador
6:       LD       0,0(5)      cargar valor de identificador: x
*      -> identificador
7:       OUT       0,0,0      escribir: genero la salida de la expresion
*      <- escribir
*      -> asignacion
*      -> Operacion: mas
*      -> identificador
8:       LD       0,0(5)      cargar valor de identificador: x
*      -> identificador
9:       ST       0,0(6)      op: push en la pila tmp el resultado expresion izquierda
*      -> constante
10:       LDC       0,1(0)      cargar constante: 1
*      <- constante
11:       LD       1,0(6)      op: pop o cargo de la pila el valor izquierdo en AC1
12:       ADD       0,1,0      op: +
*      <- Operacion: mas
13:       ST       0,0(5)      asignacion: almaceno el valor para el id x
*      <- asignacion
*      -> asignacion
*      -> Operacion: mas
*      -> identificador
14:       LD       0,1(5)      cargar valor de identificador: y
*      -> identificador
15:       ST       0,0(6)      op: push en la pila tmp el resultado expresion izquierda
*      -> constante
16:       LDC       0,1(0)      cargar constante: 1
*      <- constante
17:       LD       1,0(6)      op: pop o cargo de la pila el valor izquierdo en AC1
18:       ADD       0,1,0      op: +
*      <- Operacion: mas
19:       ST       0,1(5)      asignacion: almaceno el valor para el id y
*      <- asignacion
*      -> Operacion: and
*      -> Operacion: mayor
*      -> identificador
20:       LD       0,0(5)      cargar valor de identificador: x
*      -> identificador
21:       ST       0,0(6)      op: push en la pila tmp el resultado expresion izquierda
*      -> constante
22:       LDC       0,5(0)      cargar constante: 5
*      <- constante
23:       LD       1,0(6)      op: pop o cargo de la pila el valor izquierdo en AC1
24:       SUB       0,1,0      op: >
25:       JGT       0,2(7)      voy dos instrucciones mas alla if verdadero (AC>0)
26:       LDC       0,0(0)      caso de falso (AC=0)
27:       LDA       7,1(7)      Salto incodicional a direccion: PC+1 (es falso evito colocarlo verdadero)
28:       LDC       0,1(0)      caso de verdadero (AC=1)
*      <- Operacion: mayor
29:       ST       0,0(6)      op: push en la pila tmp el resultado expresion izquierda
*      -> Operacion: mayor
*      -> identificador
30:       LD       0,1(5)      cargar valor de identificador: y
*      -> identificador
31:       ST       0,-1(6)      op: push en la pila tmp el resultado expresion izquierda
*      -> constante
32:       LDC       0,8(0)      cargar constante: 8
*      <- constante
33:       LD       1,-1(6)      op: pop o cargo de la pila el valor izquierdo en AC1
34:       SUB       0,1,0      op: >
35:       JGT       0,2(7)      voy dos instrucciones mas alla if verdadero (AC>0)
36:       LDC       0,0(0)      caso de falso (AC=0)
37:       LDA       7,1(7)      Salto incodicional a direccion: PC+1 (es falso evito colocarlo verdadero)
38:       LDC       0,1(0)      caso de verdadero (AC=1)
*      <- Operacion: mayor
39:       LD       1,0(6)      op: pop o cargo de la pila el valor izquierdo en AC1
40:       JEQ       0,3(7)      voy tres instrucciones mas alla if false (AC==0)
41:       JEQ       1,2(7)      voy dos instrucciones mas alla if false (AC==0)
42:       LDC       0,1(0)      caso de verdadero (AC=1)
43:       LDA       7,1(7)      Salto incodicional a direccion: PC+1 (es verdadero evito colocarlo falso)
44:       LDC       0,0(0)      caso de falso (AC=0)
*      <- Operacion: and
45:       JEQ       0,-40(7)      repeat: jmp hacia el inicio del cuerpo
*      <- repeat
*      Fin de la ejecucion.
46:       HALT       0,0,0