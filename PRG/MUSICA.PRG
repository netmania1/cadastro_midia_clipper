SELECT MUSICA
DBSETORDER(1)

PRIVATE wLETRA, mLETRA

SET FILTER TO COD_MUSICA = TEMP1

tela_s:=savescreen(00,00,24,79)
setcolor(cor3)
@ 0, 0, 2, 79 BOX "…Õª∫ºÕ»∫ "

setcolor(cor1)
@  1, 1 say padc("Cadastro de Canáîes",78)

Cpos := { "FAIXA", "MUSICA" , "MINUTO" , "SEGUNDO" }
Pics := { "@E 99", "", "@E 99" , "@E 99" }
Cabs := { "Fa.", "Titulo da CanáÑo" , "Min." , "Seg." }
wDBMANU(03,00,24,79,Cpos,Pics,Cabs,.T.,"MUSICA","","",Cor3,Cor1,Cor3I,3,3)
restscreen(00,00,24,79,tela_s)
SELECT CADASTRO

FUNCTION MUSICA_Incl
tela:=savescreen(03,00,18,79)

setcolor(_cor1)

@ 03,00 clear to 13,79
@ 03,00 to 13,79 double

setcursor(1)

@ 04,02 say 'Titulo:'
@ 06,02 say 'Titulo da musica:'
@ 08,02 say 'Conjunto:'
@ 10,02 say 'Tempo:'
@ 12,02 say 'Numero da faixa:'

setcolor('w+/b')

@ 04,09 say temp
@ 10,10 say ':'

setcolor(_cor1)

tconjunto = vconjunto
vmusica = SPACE(56)
vminuto = 0
vsegundo = 0
vfaixa = 0

setcolor(_cor1)

@ 06,19 get vmusica pict '@!'
@ 08,11 get tconjunto pict '@!'
@ 10,08 get vminuto pict '99'
@ 10,11 get vsegundo pict '99'
@ 12,18 get vfaixa pict '99'

READ
SETCURSOR(0)

IF LASTKEY()==27
   RESTSCREEN(03,00,18,79,TELA)
   SETCOLOR(COR)
   RETURN(.F.)
ENDIF

IF Pergunta("Voce deseje incluir este registro? (S/N)",Cor4)<>"S"
   RESTSCREEN(03,00,18,79,TELA)
   RETURN
ENDIF

append blank
replace musica with vmusica
replace minuto with vminuto
replace segundo with vsegundo
replace faixa with vfaixa
replace cod_musica with temp1
replace conjunto with tconjunto
replace registro with recno()
dbcommit()
seek vmusica

FUNCTION MUSICA_Alte
tela:=savescreen(03,00,18,79)

setcolor(_cor1)

@ 03,00 clear to 13,79
@ 03,00 to 13,79 double

setcursor(1)

@ 04,02 say 'Titulo:'
@ 06,02 say 'Titulo da musica:'
@ 08,02 say 'Conjunto:'
@ 10,02 say 'Tempo:'
@ 12,02 say 'Numero da faixa:'

setcolor('w+/b')

@ 04,09 say temp
@ 10,10 say ':'

setcolor(_cor1)

vmusica = musica
vminuto = minuto
vsegundo = segundo
vfaixa = faixa
nconjunto = conjunto

@ 06,19 get vmusica pict '@!'
@ 08,11 get nconjunto pict '@!'
@ 10,08 get vminuto pict '99'
@ 10,11 get vsegundo pict '99'
@ 12,18 get vfaixa pict '99'

READ

SETCURSOR(0)

IF LASTKEY()==27
   RESTSCREEN(03,00,18,79,TELA)
   SETCOLOR(COR)
   RETURN(.F.)
ENDIF

IF Pergunta("Voce deseje Alterar este registro? (S/N)",Cor4)<>"S"
   RESTSCREEN(03,00,18,79,TELA)
   RETURN
ENDIF

replace musica with vmusica
replace minuto with vminuto
replace segundo with vsegundo
replace faixa with vfaixa
replace conjunto with nconjunto
dbcommit()
seek vmusica

FUNCTION MUSICA_Excl
delete
skip -1
SET FILTER TO cod_musica = TEMP1

FUNCTION MUSICA_VTECLA
PRIVATE tecla
tecla = LASTKEY()
DO CASE
   CASE tecla = 294  && Alt_L
      DO musica_let
ENDCASE
RETURN(.F.)

FUNCTION MUSICA_let
PRIVATE W3SLVTELA, W3SLVCOR
W3SLVTELA = SAVESCREEN(0,0,24,79)
W3SLVCOR=SETCOLOR()
SET SCOREBOARD off
SET CONFIRM off
SET CURSOR  on
setcolor(cor3)
@ 4, 15, 20, 63 BOX "…Õª∫ºÕ»∫ "
@ 6, 15 SAY 'Ã'
@ 6, 63 SAY 'π'
@ 18, 15 SAY 'Ã'
@ 18, 63 SAY 'π'
@ 5, 32 SAY "Letra da CanáÑo"
@ 6, 16 SAY replicate('Õ',47)
@ 18, 16 SAY replicate('Õ',47)
@ 19, 26 SAY "ESC=Cancela    Ctrl+W=Salva"
setcolor("N/W,W+/N")
wletra = letra
wletra = MEMOEDIT(letra,7,16,17,62,.T.)
IF LASTKEY() <> 27
   replace letra with wletra
   dbcommit()
ENDIF
SET CURSOR off
RESTSCREEN(0,0,24,79,W3SLVTELA)
SETCOLOR(W3SLVCOR)
RETURN

FUNCTION MUSIC_let
PRIVATE W3SLVTELA, W3SLVCOR
W3SLVTELA = SAVESCREEN(0,0,24,79)
W3SLVCOR=SETCOLOR()
SET SCOREBOARD off
SET CONFIRM off
SET CURSOR  on
setcolor(cor3)
@ 4, 15, 18, 63 BOX "…Õª∫ºÕ»∫ "
@ 6, 15 SAY 'Ã'
@ 6, 63 SAY 'π'
@ 5, 32 SAY "Letra da CanáÑo"
@ 6, 16 SAY replicate('Õ',47)
setcolor("N/W,W+/N")
wletra = letra
wletra = MEMOEDIT(letra,7,16,17,62,.F.)
SET CURSOR off
RESTSCREEN(0,0,24,79,W3SLVTELA)
SETCOLOR(W3SLVCOR)
RETURN

FUNCTION MUSIC_F

tela_s:=savescreen(00,00,24,79)

setcolor(cor3)
@ 0, 0, 2, 79 BOX "…Õª∫ºÕ»∫ "
setcolor(cor1)
@  1, 1 say padc("Musicas Cadastradas",78)

SELECT MUSICA
DBSETORDER(2)
Cpos := { "FAIXA", "MUSICA" , "MINUTO" , "SEGUNDO" }
Pics := { "@E 99", "", "@E 99" , "@E 99" }
Cabs := { "Fa.", "Titulo da CanáÑo" , "Min." , "Seg." }
wDBMANU(03,00,24,79, Cpos, Pics, Cabs,.F.,"MUSIC","","MUSICA+CONJUNTO",cor3,cor1,cor3I,3,3)
SELECT CADASTRO
restscreen(00,00,24,79,tela_s)
RETURN

FUNCTION MUSIC_VTECLA
PRIVATE tecla
tecla = LASTKEY()
DO CASE
   CASE tecla = 13  && ENTER
      vcod_nome = registro
      DO MUSIC1
   CASE tecla = 294  && Alt-L
      DO MUSIC_LET
ENDCASE
RETURN(.F.)

FUNCTION MUSIC1

temp=cod_musica
vmusica=musica
vconjunto=conjunto
vminuto=minuto
vsegundo=segundo
vfaixa=faixa

select cadastro

dbgoto(temp)

IF MIDIA = "CD"
   do inf_cd1
endif

IF MIDIA = "LP"
   do inf_lp1
endif

IF MIDIA = "K7"
   do inf_k71
endif

IF MIDIA = "MD"
   do inf_md1
endif
                                                                                                                             
 
