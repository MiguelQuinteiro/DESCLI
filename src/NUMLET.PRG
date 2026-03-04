*
* Código Fuente para Convertir cantidades numérica a letras
* Realizado por: Carlos Veigt - Venezuela
*
* Puede ser utilizado en Clipper o Foxpro
* Para incluirlo como rutina, sólo hay que eliminar las dos lineas
* encerradas entre los asteriscos (**********) y asignarle el
* valor a la variable NUM desde la pantalla o programa donde se inserte
*
*

Do While .t.
Clear
Store 0 to Sw99,Sw_Mill,Sw_Mil
Store 0.00 to Num
Store " "  to Ente_ro,Deci_mal
Store ""  to Cant_Let ,Cant_Let1,Cant_Let2,Cant_Let3,Cant_Let4, ;
             Cant_Let5,Cant_Let6,Cant_Let7,Cant_Let8,Cant_Let9
**********
@ 1,5 Say "Cantidad en números? "Get Num
Read
**********
If Num=0
   Return
Else
   Ente_ro=Padl(Alltrim(Str(Int(Num))),9,"0")
   Deci_mal=Alltrim(Str((Num-Val(Ente_ro))*100))
   If Val(Deci_mal)=0
      Store "00" to Deci_mal
   Endif

   Dimension Arr_Uno[9]

Store "Ciento "        to Arr_Uno[1]
Store "Doscientos "    to Arr_Uno[2]
Store "Trescientos "   to Arr_Uno[3]
Store "Cuatrocientos " to Arr_Uno[4]
Store "Quinientos "    to Arr_Uno[5]
Store "Seiscientos "   to Arr_Uno[6]
Store "Setecientos "   to Arr_Uno[7]
Store "Ochocientos "   to Arr_Uno[8]
Store "Novecientos "   to Arr_Uno[9]

If Substr(Ente_ro,1,3)="100"
   Store "Cien " to Cant_Let1
Else
   For K=1 to 9
       Aux=Alltrim(Str(K))
       If Substr(Ente_ro,1,1)=Aux
          Store Arr_Uno(K) to Cant_Let1
          Sw_Mill=1
       Endif
   Next
Endif
*
Dimension Arr_Dos[9]
Store "dieci"        to Arr_Dos(1)
Store "veinti"       to Arr_Dos(2)
Store "treinta y "   to Arr_Dos(3)
Store "cuarenta y "  to Arr_Dos(4)
Store "cincuenta y " to Arr_Dos(5)
Store "sesenta y "   to Arr_Dos(6)
Store "setenta y "   to Arr_Dos(7)
Store "ochenta y "   to Arr_Dos(8)
Store "noventa y "   to Arr_Dos(9)
For K=1 to 9
    Aux=Alltrim(Str(K))
    If Substr(Ente_ro,2,1)=Aux
       Store Arr_Dos(K) to Cant_Let2
       Sw_Mill=1
    Endif
Next
*
Dimension Arr_Tres(9)
Store "uno "    to Arr_Tres(1)
Store "dos "    to Arr_Tres(2)
Store "tres "   to Arr_Tres(3)
Store "cuatro " to Arr_Tres(4)
Store "cinco "  to Arr_Tres(5)
Store "seis "   to Arr_Tres(6)
Store "siete "  to Arr_Tres(7)
Store "ocho "   to Arr_Tres(8)
Store "nueve "  to Arr_Tres(9)
Do Case
   Case Substr(Ente_ro,1,3)="001"
        Store " "   to Cant_Let1
        Store " "   to Cant_Let2
        Store "Un " to Cant_Let3
        Sw99=1
        Sw_Mill=1
   Case Substr(Ente_ro,2,2)="11"
        Store " "   to Cant_Let2
        Store "Once " to Cant_Let3
        Sw99=1
        Sw_Mill=1
   Case Substr(Ente_ro,2,2)="12"
        Store " "   to Cant_Let2
        Store "Doce " to Cant_Let3
        Sw99=1
        Sw_Mill=1
   Case Substr(Ente_ro,2,2)="13"
        Store " "   to Cant_Let2
        Store "Trece " to Cant_Let3
        Sw99=1
        Sw_Mill=1
   Case Substr(Ente_ro,2,2)="14"
        Store " "   to Cant_Let2
        Store "Catorce " to Cant_Let3
        Sw99=1
        Sw_Mill=1
   Case Substr(Ente_ro,2,2)="15"
        Store " "   to Cant_Let2
        Store "Quince " to Cant_Let3
        Sw99=1
        Sw_Mill=1
   OtherWise
        For K=1 to 9
            Aux=Alltrim(Str(K))
            If Substr(Ente_ro,3,1)=Aux
               Store Arr_Tres(K) to Cant_Let3
               Sw99=1
               Sw_Mill=1
            Endif
        Next
Endcase

If Sw99=0
   Dimension Arr_Dos(9)
   Store "diez"       to Arr_Dos(1)
   Store "veinte"     to Arr_Dos(2)
   Store "treinta "   to Arr_Dos(3)
   Store "cuarenta "  to Arr_Dos(4)
   Store "cincuenta " to Arr_Dos(5)
   Store "sesenta "   to Arr_Dos(6)
   Store "setenta "   to Arr_Dos(7)
   Store "ochenta "   to Arr_Dos(8)
   Store "noventa "   to Arr_Dos(9)
   For K=1 to 9
       Aux=Alltrim(Str(K))
       If Substr(Ente_ro,2,1)=Aux
         Store Arr_Dos(K) to Cant_Let2
       Endif
   Next
Else
   Sw99=0
Endif

If Sw_Mill=1
   If Cant_Let3="Un "
      Store Cant_Let1+Cant_Let2+Cant_Let3+"millón " to Cant_Let
    Else
      Store Cant_Let1+Cant_Let2+Cant_Let3+"millones " to Cant_Let
   Endif
   Sw_Mill=0
Endif
*
Dimension Arr_Cuatro(9)
Store "ciento "        to Arr_Cuatro(1)
Store "doscientos "    to Arr_Cuatro(2)
Store "trescientos "   to Arr_Cuatro(3)
Store "cuatrocientos " to Arr_Cuatro(4)
Store "quinientos "    to Arr_Cuatro(5)
Store "seiscientos "   to Arr_Cuatro(6)
Store "setecientos "   to Arr_Cuatro(7)
Store "ochocientos "   to Arr_Cuatro(8)
Store "novecientos "   to Arr_Cuatro(9)

If Substr(Ente_ro,4,3)="100"
   Store "Cien " to Cant_Let4
   Sw_Mil=1
Else
   For K=1 to 9
       Aux=Alltrim(Str(K))
       If Substr(Ente_ro,4,1)=Aux
          Store Arr_Cuatro(K) to Cant_Let4
          Sw_Mil=1
       Endif
   Next
Endif
*
Dimension Arr_Cinco(9)
Store "dieci"        to Arr_Cinco(1)
Store "veinti"       to Arr_Cinco(2)
Store "treinta y "   to Arr_Cinco(3)
Store "cuarenta y "  to Arr_Cinco(4)
Store "cincuenta y " to Arr_Cinco(5)
Store "sesenta y "   to Arr_Cinco(6)
Store "setenta y "   to Arr_Cinco(7)
Store "ochenta y "   to Arr_Cinco(8)
Store "noventa y "   to Arr_Cinco(9)
For K=1 to 9
    Aux=Alltrim(Str(K))
    If Substr(Ente_ro,5,1)=Aux
       Store Arr_Cinco(K) to Cant_Let5
       Sw_Mil=1
    Endif
Next
*
Dimension Arr_Seis(9)
Store "uno "    to Arr_Seis(1)
Store "dos "    to Arr_Seis(2)
Store "tres "   to Arr_Seis(3)
Store "cuatro " to Arr_Seis(4)
Store "cinco "  to Arr_Seis(5)
Store "seis "   to Arr_Seis(6)
Store "siete "  to Arr_Seis(7)
Store "ocho "   to Arr_Seis(8)
Store "nueve "  to Arr_Seis(9)

Do Case
   Case Substr(Ente_ro,4,3)="001"
        Store " "   to Cant_Let4
        Store " "   to Cant_Let5
        Store "Un " to Cant_Let6
        Sw99=1
        Sw_Mil=1
   Case Substr(Ente_ro,5,2)="11"
        Store " "   to Cant_Let5
        Store "Once " to Cant_Let6
        Sw99=1
        Sw_Mil=1
   Case Substr(Ente_ro,5,2)="12"
        Store " "   to Cant_Let5
        Store "Doce " to Cant_Let6
        Sw99=1
        Sw_Mil=1
   Case Substr(Ente_ro,5,2)="13"
        Store " "   to Cant_Let5
        Store "Trece " to Cant_Let6
        Sw99=1
        Sw_Mil=1
   Case Substr(Ente_ro,5,2)="14"
        Store " "   to Cant_Let5
        Store "Catorce " to Cant_Let6
        Sw99=1
        Sw_Mil=1
   Case Substr(Ente_ro,5,2)="15"
        Store " "   to Cant_Let5
        Store "Quince " to Cant_Let6
        Sw99=1
        Sw_Mil=1
   OtherWise
        For K=1 to 9
            Aux=Alltrim(Str(K))
            If Substr(Ente_ro,6,1)=Aux
               Store Arr_Tres(K) to Cant_Let6
               Sw99=1
               Sw_Mil=1
           Endif
        Next
Endcase

If Sw99=0
   Dimension Arr_Cinco(9)
   Store "diez "      to Arr_Cinco(1)
   Store "veinte "    to Arr_Cinco(2)
   Store "treinta "   to Arr_Cinco(3)
   Store "cuarenta "  to Arr_Cinco(4)
   Store "cincuenta " to Arr_Cinco(5)
   Store "sesenta "   to Arr_Cinco(6)
   Store "setenta "   to Arr_Cinco(7)
   Store "ochenta "   to Arr_Cinco(8)
   Store "noventa "   to Arr_Cinco(9)
   For K=1 to 9
       Aux=Alltrim(Str(K))
       If Substr(Ente_ro,5,1)=Aux
          Store Arr_Cinco(K) to Cant_Let5
       Endif
   Next
Else
   Sw99=0
Endif

If Sw_Mil=1
   Store Cant_Let+Cant_Let4+Cant_Let5+Cant_Let6+"mil " to Cant_Let
   Sw_Mill=0
Endif
*
Dimension Arr_Siete(9)
Store "ciento "        to Arr_Siete(1)
Store "doscientos "    to Arr_Siete(2)
Store "trescientos "   to Arr_Siete(3)
Store "cuatrocientos " to Arr_Siete(4)
Store "quinientos "    to Arr_Siete(5)
Store "seiscientos "   to Arr_Siete(6)
Store "setecientos "   to Arr_Siete(7)
Store "ochocientos "   to Arr_Siete(8)
Store "novecientos "   to Arr_Siete(9)

If Substr(Ente_ro,7,3)="100"
   Store "Cien " to Cant_Let7
Else
   For K=1 to 9
       Aux=Alltrim(Str(K))
       If Substr(Ente_ro,7,1)=Aux
          Store Arr_Siete(K) to Cant_Let7
       Endif
   Next
Endif
*
Dimension Arr_Ocho(9)
Store "dieci"        to Arr_Ocho(1)
Store "veinti"       to Arr_Ocho(2)
Store "treinta y "   to Arr_Ocho(3)
Store "cuarenta y "  to Arr_Ocho(4)
Store "cincuenta y " to Arr_Ocho(5)
Store "sesenta y "   to Arr_Ocho(6)
Store "setenta y "   to Arr_Ocho(7)
Store "ochenta y "   to Arr_Ocho(8)
Store "noventa y "   to Arr_Ocho(9)
For K=1 to 9
    Aux=Alltrim(Str(K))
    If Substr(Ente_ro,8,1)=Aux
       Store Arr_Ocho(K) to Cant_Let8
    Endif
Next
*
Dimension Arr_Nueve(9)
Store "uno "    to Arr_Nueve(1)
Store "dos "    to Arr_Nueve(2)
Store "tres "   to Arr_Nueve(3)
Store "cuatro " to Arr_Nueve(4)
Store "cinco "  to Arr_Nueve(5)
Store "seis "   to Arr_Nueve(6)
Store "siete "  to Arr_Nueve(7)
Store "ocho "   to Arr_Nueve(8)
Store "nueve "  to Arr_Nueve(9)
Do Case
   Case Substr(Ente_ro,8,2)="11"
        Store " "   to Cant_Let5
        Store "Once " to Cant_Let6
        Sw99=1
        Sw_Mil=1
   Case Substr(Ente_ro,8,2)="12"
        Store " "   to Cant_Let5
        Store "Doce " to Cant_Let6
        Sw99=1
        Sw_Mil=1
   Case Substr(Ente_ro,8,2)="13"
        Store " "   to Cant_Let5
        Store "Trece " to Cant_Let6
        Sw99=1
        Sw_Mil=1
   Case Substr(Ente_ro,8,2)="14"
        Store " "   to Cant_Let5
        Store "Catorce " to Cant_Let6
        Sw99=1
        Sw_Mil=1
   Case Substr(Ente_ro,8,2)="15"
        Store " "   to Cant_Let5
        Store "Quince " to Cant_Let6
        Sw99=1
        Sw_Mil=1
   OtherWise
        For K=1 to 9
            Aux=Alltrim(Str(K))
            If Substr(Ente_ro,9,1)=Aux
               Store Arr_Tres(K) to Cant_Let9
               Sw99=1
            Endif
        Next
Endcase
*

If Sw99=0
   Dimension Arr_Ocho(9)
   Store "diez"       to Arr_Ocho(1)
   Store "veinte"     to Arr_Ocho(2)
   Store "treinta "   to Arr_Ocho(3)
   Store "cuarenta "  to Arr_Ocho(4)
   Store "cincuenta " to Arr_Ocho(5)
   Store "sesenta "   to Arr_Ocho(6)
   Store "setenta "   to Arr_Ocho(7)
   Store "ochenta "   to Arr_Ocho(8)
   Store "noventa "   to Arr_Ocho(9)
   For K=1 to 9
       Aux=Alltrim(Str(K))
       If Substr(Ente_ro,8,1)=Aux
          Store Arr_Ocho(K) to Cant_Let8
       Endif
   Next
Else
   Sw99=0
Endif

Store Cant_Let+Cant_Let7+Cant_Let8+Cant_Let9 to Cant_Let

Store Cant_Let+"con "+Deci_mal+"/100" to Cant_Let

@ 5,5 Say Cant_Let
@ 7,5 Say " "
Wait
Endif
Enddo
Release
Arr_Uno,Arr_Dos,Arr_Tres,Arr_uatro,Arr_Cinco,Arr_Seis,Arr_Siete,Arr_Ocho,Arr_Nueve
