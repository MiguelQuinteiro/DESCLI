
******************************************************
* VERBASES.PRG                                       *
* Programa que lista todos los registros de la base  *
* de datos PERSONAL y relaciona sus registros con    *
* las bases HORAS y CATEGORIA                        *
******************************************************

LOCAL fi := 3
USE personal NEW
USE categori NEW
USE horas    NEW

SELECT personal
CLEAR
@  0, 6 TO  2,71
@  0,41, 2,61 BOX "�Ŀ�����"
@  0,41, 2,49 BOX "�Ŀ�����"
recuadros()
@  1, 8 SAY "Apellidos, Nombre"
@  1,43 SAY "Horas"
@  1,51 SAY "Categoria"
@  1,63 SAY "Sueldo"
DO WHILE !EOF()

	SELECT personal
	@ fi, 8 SAY TRIM(apellidos) + ", " + nombre
	SELECT horas
	LOCATE FOR dni = personal->dni

	IF FOUND()
		@ fi,45 SAY horas PICT "99"
	ENDIF
	SELECT categori
	LOCATE FOR categoria = personal->categoria
	IF FOUND()
		@ fi,55 SAY categoria
		@ fi,63 SAY sueldo PICT "@E 999,999"
	ENDIF

	fi++

	SELECT personal
	SKIP

	IF fi = 20 .AND. !EOF()
		pausa()
		@  3, 0 CLEAR TO 24,79
		recuadros()
		fi = 3
	ENDIF
ENDDO
pausa()
CLOSE DATABASE


PROCEDURE pausa
	@ 22, 6 TO 24,71
	@ 23,25 SAY "Pulse una tecla para continuar"
	INKEY(0)
RETURN

PROCEDURE recuadros
	@  2, 6,20,71 BOX "�Ŀ�����"
	@  2,41,20,61 BOX "�Ŀ�����"
	@  2,41,20,49 BOX "�Ŀ�����"
RETURN

