set deleted on
set cursor off
set scoreboard off
set console off
set device to print
set printer to lista.lpt
set printer on

use cadastro

copy for proprieda to temp.dbf

use temp

goto top

do while .not. eof()

if midia = 'SE'
delete
endif

if midia = 'EQ'
delete
endif

if proprieda = space(15)
delete
endif

if proprieda = 'BOM P/ COMPRAR '
delete
endif

skip +1

enddo

* pack

sort on proprieda, titulo /c to lista

use lista

goto top

?? "&l26A&l1O&l8D(12U&k4S&l0E"

?? 'Titulo' + space(62) + 'Conjunto' + space(33) + 'Midia' + space(03) + 'Propriedade'

do while .not. eof()
? Titulo + space(01) + Conjunto + space(01) + Midia + space(06) + Proprieda
skip +1
enddo

set device to screen

PRIVATE L1, L2, L3, L4, L5, q, HP4_ON, HP4_OF

SET PRINTER TO LISTA1.LPT
SET DEVICE TO PRINTER
SET PRINTER ON
SET CONSOLE OFF
GO TOP
*   123456789012345678901234567890123456789012345678901234567890
L1="ÉÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍ»"
L2="º Codigo    ³ Titulo                                                               ³ Interprete                                ³ Propriedade       ³ Midia º"
L3="ÇÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄ¶"
L4="º "
L5="ÈÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍ¼"

* HP4_ON = "&l26A&l1O&l8D(10U&k4S"
  HP4_ON = "&l26A&l1O&l8D(12U&k4S&l0E"
HP4_OF = "E"

? HP4_ON+SPACE(3)+L1
? SPACE(3)+L2
q=0
DO WHILE EOF()=.F.
         q=q+1
      IF q>27
         ? SPACE(3)+L5+""
         ? SPACE(3)+L1
         ? SPACE(3)+L2
         q=1
      ENDIF
      wl=L4
      wl=STUFF(wl,02,02,STR(REGISTRO) + '    ³ '  + titulo + '  ³ ' + conjunto + '  ³ '  +  proprieda +  '   ³ ' +  midia + "    º")
      ? SPACE(03) + L3
      ? SPACE(03) + wl
   SKIP 1
ENDDO
IF q > 0
   ? SPACE(3)+L5+""+HP4_OF
ENDIF
?? HP4_OF
close all

delete file temp.dbf
delete file temp.dbt
* delete file lista.dbf
* delete file lista.dbt
RETURN
