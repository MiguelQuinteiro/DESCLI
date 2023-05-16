
********************************************************
* EJEM2.PRG                                            *
* Programa para comprobar el funcionamiento de DO CASE *
********************************************************

LOCAL edad := 0

CLEAR

@  8,38 SAY "Edad: " GET edad PICT "99" RANGE 0,99
READ

DO CASE

   CASE edad >= 65

		@ 10,30 SAY "Jubilado"

	CASE edad > 40

		@ 10,30 SAY "Maduro"

	CASE edad >= 18

		@ 10,30 SAY "Mayor de Edad"

	OTHERWISE

		@ 10,30 SAY "Joven"

ENDCASE

