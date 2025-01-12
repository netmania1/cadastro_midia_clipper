IF .NOT. ISPRINTER()
   Mensagem(08,'A impressora n„o esta pronta para imprimir!')
   return
endif

IF Pergunta("Voce deseje imprimir este registro? (S/N)",Cor4)<>"S"
   RETURN
ENDIF

TEMP = TITULO
TEMP1 = REGISTRO

SET CONSOLE OFF
SET PRINTER ON
SET DEVICE TO PRINTER

?? "&l26A&l1O&l8D(12U&k4S&l0E"

@ 02,00 SAY PADC("Informa‡”es Sobre o Registro",79)

@ 04,10 SAY TITULO
@ 04,03 SAY 'Titulo: '
@ 06,12 SAY CONJUNTO
@ 06,03 SAY 'Conjunto: '
@ 08,03 SAY 'Codigo: '
@ 08,10 SAY CODIGO
@ 10,03 SAY 'Gravadora: '
@ 10,13 SAY GRAVADORA
@ 12,03 SAY 'Numero de faixas: '
@ 12,20 SAY FAIXA 
@ 14,03 SAY 'Propriedade: '
@ 14,15 SAY PROPRIEDA
@ 16,03 SAY 'Tipo de midia: '

IF MIDIA = 'CD'
   @ 16,17 say "Compact Disc - CD"
ENDIF

IF MIDIA = 'LP'
   @ 16,17 say "Long Player - LP"
ENDIF

IF MIDIA = 'K7'
   @ 16,17 say "Fita Cassete - K7"
ENDIF

IF MIDIA = 'MD'
   @ 16,17 say "Mini Disc - MD"
ENDIF

IF MIDIA = 'VH'
   @ 16,17 say "Fita de Video VHS - VHS"
ENDIF

IF MIDIA = 'VC'
   @ 16,17 say "Fita de Video VHS-C - VHS-C"
ENDIF

SELECT MUSICA
DBSETORDER(1)

set filter to cod_musica = TEMP1

GOTO TOP

@ 18, 01 SAY 'Ú' + REPLICATE('Ä',6) + 'Â' + REPLICATE('Ä',56) + 'Â' + REPLICATE('Ä',40) + 'Â' + REPLICATE('Ä',07) + 'Â' +REPLICATE('Ä',07) + '¿'
@ 19, 01 SAY '³' + 'Faixa ' + '³' + 'Titulo da Musica' + SPACE(40) + '³' + 'Interprete' + SPACE(30) + '³'+ 'Minuto ' + '³' + 'Segundo'+ '³'
@ 20, 01 SAY 'Ã' + REPLICATE('Ä',6) + 'Å' + REPLICATE('Ä',56) + 'Å' + REPLICATE('Ä',40) + 'Å' + REPLICATE('Ä',07) + 'Å'+ REPLICATE('Ä',07) + '´'

FOR X = 21 TO 59

IF FAIXA = 0
   @ X, 01 SAY '³' + REPLICATE(' ',6) + '³' + REPLICATE(' ',56) + '³' + REPLICATE(' ',40)  + '³' +  REPLICATE(' ',07) + '³' +REPLICATE(' ',07) + '³'
ELSE
   @ X, 01 SAY '³' + STR(FAIXA) + '    ³' + MUSICA + '³' + CONJUNTO + '³     ' + STR(MINUTO) + '³     ' + STR(SEGUNDO) + '³'
ENDIF

SKIP +1
NEXT

@ 60, 01 SAY 'À' + REPLICATE('Ä',6) + 'Á' + REPLICATE('Ä',56) + 'Á' + REPLICATE('Ä',40) + 'Á' + REPLICATE('Ä',07) + 'Á' + REPLICATE('Ä',07) +'Ù'

EJECT

SET DEVICE TO SCREEN

SELECT CADASTRO
