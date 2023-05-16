
***************************************************
* LISTODOS.PRG                                    *
* Programa para listar todos los registros de     *
* la base de datos PERSONAL.DBF                   *
***************************************************

LOCAL fi := 2 ; xpro := {"Alava", "Albacete", ;
		   "Alicante", "Almeria", "Avila"}
USE personal
CLEAR
@  0,10 SAY "Apellidos, Nombre"
@  0,50 SAY "Provincia"
@  1,10 TO  1,62
DO WHILE !EOF()
	@ fi,10 SAY TRIM(apellidos) + ", " + nombre
	@ fi,40 SAY xpro[provincia]
	fi++
	SKIP
	IF fi = 20 .AND. !EOF()
		DO detener
		fi := 2
		@  2, 0 CLEAR TO 24,79
	ENDIF
ENDDO
IF fi != 2
	DO detener
ENDIF
CLOSE DATABASE

PROCEDURE detener
@ 22,30 SAY "Pulse una tecla para continuar"
INKEY(0)
RETURN

