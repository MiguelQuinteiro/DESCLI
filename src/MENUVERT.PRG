
**************************************************
* MENUVERT.PRG                                   *
* Programa para acceder a los menus desplegables *
* por medio de las teclas de movimientos         *
**************************************************

SET WRAP ON

SET MESSAGE TO 23 CENTER
op := 1
DO WHILE op != 0
	CLEAR
	@  0, 0 TO  2,79
	@ 22, 0 TO 24,79

	@  1,63 SAY "ESC para salir" COLOR "W+"

	@  1, 1 PROMPT "COMPRAS "  MESSAGE "Compras de articulos"
	@  1,12 PROMPT "VENTAS  "  MESSAGE "Ventas de articulos"
	@  1,23 PROMPT "LISTADOS " MESSAGE "Listados en General"
	MENU TO op

	IF LASTKEY() = 27
		EXIT
	ENDIF

	DO CASE
		CASE op = 1
			compras()
		CASE op = 2
			ventas()
		CASE op = 3
			listados()
	ENDCASE
ENDDO

PROCEDURE compras
LOCAL op := 1
DO WHILE op != 0
	* Borrar la zona de los mensajes y hacer recuadro
	@ 23, 1 CLEAR TO 23,78
	@ 22, 0 TO 24,79
	* Construir la caja para el menu de Compras
	@ 2,3,5,13 BOX "ÚÄ¿³ÙÄÀ³"
	*Activar las teclas derecha e izquierda
	SET KEY 19 TO izquierda
	SET KEY  4 TO derecha
	@  3, 5 PROMPT "ALTAS  " MESSAGE "Altas de compras"
	@  4, 5 PROMPT "BAJAS  " MESSAGE "Bajas de compras"
	MENU TO op
	* Desactivar las teclas para evitar la recursividad
	SET KEY 19 TO
	SET KEY  4 TO
	DO CASE
		CASE op = 1
			pantalla = SAVESCREEN(0,0,2,79)
			DO subprograma
			RESTSCREEN(0,0,2,79,pantalla)
		CASE op = 2
			pantalla = SAVESCREEN(0,0,2,79)
			DO subprograma
			RESTSCREEN(0,0,2,79,pantalla)
	ENDCASE
ENDDO
RETURN

PROCEDURE ventas
LOCAL op := 1
DO WHILE op != 0
	@ 23, 1 CLEAR TO 23,78
	@ 22, 0 TO 24,79
	@ 2,14,5,24 BOX "ÚÄ¿³ÙÄÀ³"
	SET KEY 19 TO izquierda
	SET KEY  4 TO derecha
	@  3,16 PROMPT "ALTAS  " MESSAGE "Altas de ventas"
	@  4,16 PROMPT "BAJAS  " MESSAGE "Bajas de ventas"
	MENU TO op
	SET KEY 19 TO
	SET KEY  4 TO
	DO CASE
		CASE op = 1
			pantalla = SAVESCREEN(0,0,2,79)
			DO subprograma
			RESTSCREEN(0,0,2,79,pantalla)
		CASE op = 2
			pantalla = SAVESCREEN(0,0,2,79)
			DO subprograma
			RESTSCREEN(0,0,2,79,pantalla)
	ENDCASE
ENDDO
RETURN

PROCEDURE listados
LOCAL op := 1
DO WHILE op != 0
	@ 23, 1 CLEAR TO 23,78
	@ 22, 0 TO 24,79
	@ 2,25,5,37 BOX "ÚÄ¿³ÙÄÀ³"
	SET KEY 19 TO izquierda
	SET KEY  4 TO derecha
	@  3,27 PROMPT "COMPRAS " MESSAGE "Listado de compras"
	@  4,27 PROMPT "VENTAS  " MESSAGE "Listado de ventas"
	MENU TO op
	SET KEY 19 TO
	SET KEY  4 TO
	DO CASE
		CASE op = 1
			pantalla = SAVESCREEN(0,0,2,79)
			DO subprograma
			RESTSCREEN(0,0,2,79,pantalla)
		CASE op = 2
			pantalla = SAVESCREEN(0,0,2,79)
			DO subprograma
			RESTSCREEN(0,0,2,79,pantalla)
	ENDCASE
ENDDO
RETURN

PROCEDURE izquierda
KEYBOARD CHR(27) + CHR(19) + CHR(13)
RETURN

PROCEDURE derecha
KEYBOARD CHR(27) + CHR(4) + CHR(13)
RETURN

PROCEDURE subprograma
CLEAR
@ 10,30 SAY "Pulse una tecla ..."
INKEY(0)
CLEAR
RETURN
