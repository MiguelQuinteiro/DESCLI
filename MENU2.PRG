
*************
* MENU2.PRG *
*************

SET MESSAGE TO 23 CENTER
SET WRAP ON

op := 1

DO WHILE op != 0

	CLEAR

	@  8,31 TO 15,48
	@ 22,20 TO 24,60
	@  4,20 TO  6,60

	@  5,33 SAY    "MENU PRINCIPAL"
	@ 10,36 PROMPT "COMPRAS  " MESSAGE "Opcion de compras"
	@ 11,36 PROMPT "VENTAS   " MESSAGE "Opcion de ventas"
	@ 12,36 PROMPT "LISTADOS " MESSAGE "Listados en General"
	@ 13,36 PROMPT "SALIR    " MESSAGE "Pulse INTRO o ESC"

	MENU TO op

	IF LASTKEY() = 27
		EXIT
	ENDIF

	DO CASE
		CASE op = 1
			DO compras
		CASE op = 2
			DO ventas
		CASE op = 3
			DO listados
		CASE op = 4
			EXIT
	ENDCASE
ENDDO

PROCEDURE compras
LOCAL opc := 1
DO WHILE opc != 0
	* Blanquear la zona de los mensajes y hacer recuadro
	@ 23,21 CLEAR TO 23,69
	@ 22,20 TO 24,60

	* Borrar la zona donde se visualiza el menu de compras
	@ 11,40 CLEAR TO 17,55
	@ 11,40 TO 17,55
	@ 13,44 PROMPT "ALTAS  " MESSAGE " Altas de compras"
	@ 14,44 PROMPT "BAJAS  " MESSAGE " Bajas de compras"
	@ 15,44 PROMPT "SALIR  " MESSAGE " Pulse INTRO o ESC"
	MENU TO opc

	DO CASE
		CASE opc = 1
			* Salvar todo lo que hay en la pantalla: el
			* menu principal y el menu de compras
			pantalla2 = SAVESCREEN(4,20,24,60)
			subprograma()

			* Cuando vuelva de del subprograma borra y
			* restaura la pantalla con los dos menus
			RESTSCREEN(4,20,24,60,pantalla2)
		CASE opc = 2
			pantalla2 = SAVESCREEN(4,20,24,60)
			subprograma()
			RESTSCREEN(4,20,24,60,pantalla2)
		CASE opc = 3
			EXIT
	ENDCASE
ENDDO
RETURN

PROCEDURE ventas
LOCAL opv := 1
DO WHILE opv != 0
	@ 23,21 CLEAR TO 23,69
	@ 22,20 TO 24,60

	@ 11,40 CLEAR TO 17,55
	@ 11,40 TO 17,55
	@ 13,44 PROMPT "ALTAS  " MESSAGE " Altas de ventas"
	@ 14,44 PROMPT "BAJAS  " MESSAGE " Bajas de ventas"
	@ 15,44 PROMPT "SALIR  " MESSAGE " Pulse INTRO o ESC"
	MENU TO opv

	DO CASE
		CASE opv = 1
			pantalla2 = SAVESCREEN(4,20,24,60)
			subprograma()
			RESTSCREEN(4,20,24,60,pantalla2)
		CASE opv = 2
			pantalla2 = SAVESCREEN(4,20,24,60)
			subprograma()
			RESTSCREEN(4,20,24,60,pantalla2)
		CASE opv = 3
			EXIT
	ENDCASE
ENDDO
RETURN

PROCEDURE listados
LOCAL opl := 1
DO WHILE opl != 0
	@ 23,21 CLEAR TO 23,69
	@ 22,20 TO 24,60

	@ 11,40 CLEAR TO 17,55
	@ 11,40 TO 17,55
	@ 13,44 PROMPT "COMPRAS " MESSAGE "Listado de compras"
	@ 14,44 PROMPT "VENTAS  " MESSAGE "Listado de ventas"
	@ 15,44 PROMPT "SALIR   " MESSAGE "Pulse INTRO o ESC"
	MENU TO opl

	DO CASE
		CASE opl = 1
			pantalla2 = SAVESCREEN(4,20,24,60)
			subprograma()
			RESTSCREEN(4,20,24,60,pantalla2)
		CASE opl = 2
			pantalla2 = SAVESCREEN(4,20,24,60)
			subprograma()
			RESTSCREEN(4,20,24,60,pantalla2)
		CASE opl = 3
			EXIT
	ENDCASE
ENDDO
RETURN

PROCEDURE subprograma
CLEAR
@ 10,30 SAY "Pulse una tecla ..."
INKEY(0)
CLEAR
RETURN

