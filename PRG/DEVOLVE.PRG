FUNCTION F_Devolve

IF MIDIA='LP'
TEXTO13:="Vocˆ ainda n„o comprou o LP e j  que emprestalo!"
ENDIF

IF MIDIA='K7'
TEXTO13:="Vocˆ ainda n„o comprou o K7 e j  que emprestalo!"
ENDIF

IF MIDIA='MD'
TEXTO13:="Vocˆ ainda n„o comprou o MD e j  que emprestalo!"
ENDIF

IF MIDIA='CD'
TEXTO13:="Vocˆ ainda n„o comprou o CD e j  que emprestalo!"
ENDIF

IF MIDIA='EQ'
TEXTO13:="Vocˆ ainda n„o comprou o EQ e j  que emprestalo!"
ENDIF

IF PROPRIEDA = "BOM P/ COMPRAR" .OR. I_DEVOLVE = .F.
CINELANDIA=SAVESCREEN(09,09,11,60)
SETCOLOR(_COR4)
@ 09,09 CLEAR TO 11,60
@ 09,09 to 11,60 DOUBLE
@ 10,11 SAY TEXTO13
TONE(1000,1)
INKEY(0)
RESTSCREEN(09,09,11,60,CINELANDIA)
RETURN
ENDIF

TEL60:=SAVESCREEN(09,13,14,65)
SETCOLOR(_COR4)
@ 09,22 CLEAR TO 11,50
@ 09,22 TO 11,50 DOUBLE
SETCOLOR(_COR9)
@ 10,24 SAY 'Aguarde, em processamento'

vtitulo = titulo
vmidia = midia
vcodigo = registro
vtotal_em = total_em

SELECT DEVOLVE

SET FILTER TO

GOTO TOP

LOCATE FOR CODIGO = VCODIGO

IF FOUND()
RESTSCREEN(09,13,14,65,TEL60)
tela_s:=savescreen(00,00,24,79)

setcolor(cor3)

@ 00, 00, 04, 79 BOX "ÉÍ»º¼ÍÈº "

@ 01, 01 say 'Titulo:' + space(60) + ' - ' + 'Midia:'
@ 03, 01 say 'Total de emprestimos deste item:'

setcolor(cor1)

@ 01, 08 say left(vtitulo,60)
@ 01, 77 say vmidia
@ 03, 33 say trim(str(vtotal_em))

* SELECT DEVOLVE
set filter to codigo = vcodigo

* count to total_em
* @ 03, 33 say trim(str(total_em))

Cpos := { "NOME", "SAIU", "RETORNOU", "DIAS" , "REGISTRO" }
Pics := { "" , "" , "" , "@E 9999999999" , "@ 9999999999" }
Cabs := { "Nome" , "Data Saida" , "Data Retorno" , "Dias Empr." , "Registro" }
wDBMANU(05,00,24,79, Cpos, Pics, Cabs,.F.,"DEVOLVE","","",cor3,cor1,cor3I, 1, 3)
restscreen(00,00,24,79,tela_s)
select cadastro
RETURN

ELSE

TEL50:=SAVESCREEN(09,13,14,65)
SETCOLOR(_COR4)
@ 09,13 CLEAR TO 11,56
@ 09,13 TO 11,56 DOUBLE
@ 10,15 SAY 'Nenhum registro de emprestimo localizado'
TONE(1000,1)
INKEY(0)
RESTSCREEN(09,13,14,65,TEL50)
RESTSCREEN(09,13,14,65,TEL60)
SETCOLOR(COR)
SELECT CADASTRO
RETURN(0)
ENDIF

FUNCTION DEVOLVE_VTECLA
PRIVATE tecla
tecla = LASTKEY()
DO CASE
   CASE tecla = 13  && ENTER
        DO info_emp
   ENDCASE
RETURN(.F.)
