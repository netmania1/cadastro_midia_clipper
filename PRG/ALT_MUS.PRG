tel:=savescreen(03,00,13,79)

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

vmusica=musica
vminuto=minuto
vsegundo=segundo
vfaixa=faixa
nconjunto=conjunto

@ 06,19 get vmusica pict '@!'
@ 08,11 get nconjunto pict '@!'
@ 10,08 get vminuto pict '99'
@ 10,11 get vsegundo pict '99'
@ 12,18 get vfaixa pict '99'
read

SETCURSOR(0)

IF LASTKEY()==27
RESTSCREEN(03,00,13,79,TEL)
SETCOLOR(COR)
RETURN(1)
ENDIF

TEL1:=SAVESCREEN(10,10,13,47)
SETCOLOR(_COR4)

@ 10,10 CLEAR TO 13,47
@ 10,10 TO 13,47 DOUBLE

@ 11,12 SAY 'Voce deseja alterar este registro?'
@ 12,24 PROMPT "Sim"
@ 12,29 PROMPT "N„o"
OP=1
MENU TO OP
RESTSCREEN(10,10,13,47,TEL1)
RESTSCREEN(03,00,13,79,TEL)

DO CASE

CASE OP=1
replace musica with vmusica
replace minuto with vminuto
replace segundo with vsegundo
replace faixa with vfaixa
replace conjunto with nconjunto
salvareg=recno()
reggoto=recno()
LMprd_Inicializa(salvareg)
goto top

case op=2

endcase
