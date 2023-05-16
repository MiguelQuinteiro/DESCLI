
******************************************************
* HORASALT.PRG                                       *
* Programa para dar altas, bajas y modificaciones de *
* horas extras leyendo en las bases PERSONAL y HORAS *
******************************************************

SET DATE BRITISH
SET DELETE ON
SET WRAP ON
USE personal NEW
USE horas    NEW
PRIVATE res := "S", sw := 0
DO WHILE res = "S"
	CLEAR
	PRIVATE dn := SPACE(8), op := 1, ho := 0
	@  4,10 TO 13,70
	@  6,20 SAY "DNI: " GET dn
	READ

	* Buscar en la base PERSONAL
	SELECT personal
	LOCATE FOR dni = dn
	IF FOUND()
		@  7,20 SAY "Nombre: " + nombre
		@  8,20 SAY "Apellidos: " + apellidos

		* Buscar en la base HORAS
		SELECT horas
		LOCATE FOR dni = dn
		IF FOUND()
			@ 10,20 SAY "Horas:"
			@ 10,28 SAY horas PICT "99"

			* Menu para modificar las horas
			@ 17,18 TO 19,60
			@ 18,20 PROMPT "A¤adir"
			@ 18,28 PROMPT "Decrementar"
			@ 18,41 PROMPT "Borrar"
 			@ 18,49 PROMPT "Modificar"
			MENU TO op
			DO CASE
				CASE op = 1
					@ 11,20 SAY "Incrementar:      horas"
					@ 11,34 GET ho PICT "99" VALID ho > 0
					READ
					ho += horas
					REPLACE horas WITH ho
				CASE op = 2
					@ 11,20 SAY "Decrementar:      horas"

					* Se controla que las horas no sean
					* mayor que las grabadas en el DBF y
					* al mismo tiempo que sea mayor que 0
					@ 11,34 GET ho PICT "99" ;
						VALID ho <= horas .AND. ho > 0
					READ
					ho = horas - ho
					IF ho = 0

						* Si las horas son 0 se borra el
						* registro de la base HORAS
						DELETE
						sw = 1
					ELSE
						REPLACE horas WITH ho
    				ENDIF
			   CASE op = 3
					SELECT horas
					DELETE
					sw = 1
			   CASE op = 4

					* Introducir las nuevas horas
					@ 11,20 SAY "Nuevas:      horas"
					@ 11,28 GET ho PICT "99" VALID ho > 0
					READ
					REPLACE horas WITH ho
			ENDCASE

		ELSE

			* Si no esta en HORAS se introducen las horas
			* y se le da de altas ejecutando la orden
			* APPEND BLANK

			@ 10,20 SAY "Horas " GET ho PICT "99" VALID ho > 0
			READ
			SELECT horas
			APPEND BLANK
			REPLACE dni   WITH dn , ;
					  horas WITH ho
		ENDIF
	ELSE
		@ 16,10 TO 18,70
		@ 17,36 SAY "No existe"
	ENDIF
	res = SPACE(1)
	@ 20,10 TO 22,70
   @ 21,30 SAY "Mas modificaciones: " GET res PICT "!" ;
		VALID res $ "SN"
	READ
ENDDO
IF sw = 1
	SELECT horas
	PACK
ENDIF
CLOSE DATABASE

