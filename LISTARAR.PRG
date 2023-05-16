
******************************************************
* LISTARAR.PRG                                       *
* Programa para comprobar la ejecucion de CONTINUE   *
* busc todos los registros cuyos APELLIDOS coincidan *
* con los introducidos por el teclado                *
******************************************************


PRIVATE fi := 2, ape := SPACE(20), sw := 0
USE personal
CLEAR
@  8,10 TO 10,70
@  9,20 SAY "Apellidos: " GET ape PICT"@!" VALID ape > SPACE(20)
READ
LOCATE FOR apellidos = ape
DO WHILE !EOF()
	visualizar()
	CONTINUE
ENDDO

IF sw = 0
	@ 15,18 SAY "No hay ningun registro"
	INKEY(0)
ELSEIF fi = 2
	DO detener
ENDIF
CLOSE DATABASE

PROCEDURE visualizar
IF fi = 2
	sw = 1
	CLEAR
	@  2,15 SAY "Apellidos, Nombre"
	@  3,10 TO  3,70
	fi = 4
ENDIF
@ fi,15 SAY TRIM(apellidos) + ", " + nombre
fi++
IF fi = 20
	DO detener
	fi = 2
ENDIF
RETURN

PROCEDURE detener
@ 22,30 SAY "Pulse una tecla para continuar"
INKEY(0)
RETURN


