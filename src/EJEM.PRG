
*****************************************************
* EJEM.PRG                                          *
* Programa para probar la instruccion IF-ELSEIF     *
* Segun la edad introducida se visualiza un mensaje *
*****************************************************

LOCAL edad := 0

CLEAR

@  8,38 SAY "Edad: " GET edad PICT "99" RANGE 0,99

READ

IF edad >= 65

	@ 10,30 SAY "Jubilado"

ELSEIF edad > 40

	@ 10,30 SAY "Maduro"

ELSEIF edad >= 18

	@ 10,30 SAY "Mayor de Edad"

ELSE

	@ 10,30 SAY "Joven"

ENDIF

