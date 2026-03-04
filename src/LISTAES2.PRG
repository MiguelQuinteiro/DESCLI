
***************************************************
* LISTAES2.PRG                                    *
* Visualizar la estructura de cualquier DBF menos *
* la de PERSONAL.DBF                              *
***************************************************

PRIVATE bases := base_datos := {}
PRIVATE op := num := i := pos := 0

base_datos := DIRECTORY("*.DBF")

CLEAR

num = LEN(base_datos)

PRIVATE tipos[num]

FOR i = 1 TO num
	AADD(bases, base_datos[i,1])
NEXT

AFILL(tipos,.T.)
ASORT(bases)

pos = ASCAN(bases, "PERSONAL.DBF")

AFILL(tipos, .F., pos,1)

@  6, 3 TO 15,18
op = ACHOICE(7,4,14,17,bases,tipos)

IF op != 0
	ver_estructura()
ELSE
	@ 22,20 SAY "No se ha elegido ninguna base"
ENDIF

FUNCTION ver_estructura

LOCAL nombre := bases[op]
USE (nombre)

PRIVATE fi := 6; num = FCOUNT(); estruc := DBSTRUCT()
@  4,20 SAY "Estructura de la base de datos: " + nombre
QOUT()

FOR i = 1 TO num
	SETPOS(fi,25)
	QQOUT( PADR(estruc[i,1],12), estruc[i,2], ;
		estruc[i,3], estruc[i,4] )
	fi++
NEXT

RETURN NIL

