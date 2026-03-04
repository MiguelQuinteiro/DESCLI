
**********************************************
* ARRAY.PRG                                  *
* Programa para introducir datos en un Array *
**********************************************

LOCAL nombres[5]
CLEAR


* Se deben llenar el array con algun tipo de dato para que
* el clipper sepa se cual tipo de datos debe hacer el GET

FOR x = 1 TO 5
	nombres[x] := SPACE(10)
NEXT


* Ahora si se puede ejecutar el programa del libro

FOR i = 1 TO 5

	@ 12,25 SAY "Nombre: " GET nombres[i]

	READ

	@ 14,25 SAY i

	@ 15,25 SAY nombres[i]

	INKEY(0)

NEXT

