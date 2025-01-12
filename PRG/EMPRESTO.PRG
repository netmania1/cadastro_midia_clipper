FUNCTION Emprest()

IF MIDIA = 'CD'
TEXTO:="[Empr‚stimo de CD's]"
TEXTO1:=[Empr‚stimo do CD (Saida)]
TEXTO2:=[Empr‚stimo do CD (Altera Data)]
TEXTO3:=[Empr‚stimo do CD (Exclui Emprestimo)]
TEXTO4:=[Retorno do CD]
TEXTO5:=[Retorna ao Cadastro de CD's]
TEXTO6:=[Este CD j  est  emprestado]
TEXTO7:="[Saida do CD (Incluir)]"
TEXTO8:="[Saida do CD (Alterar)]"
TEXTO9:="[Excluir]"
TEXTO10:="[Retorno do CD]"
TEXTO11:="Este CD n„o est  emprestado"
TEXTO12:="Voce precisa ter um CD para emprestalo"
TEXTO13:="Vocˆ ainda n„o comprou o CD e j  que emprestalo!"
ENDIF

IF MIDIA = 'LP'
TEXTO:="[Empr‚stimo de LP's]"
TEXTO1:=[Empr‚stimo do LP (Saida)]
TEXTO2:=[Empr‚stimo do LP (Altera Data)]
TEXTO3:=[Empr‚stimo do LP (Exclui Emprestimo)]
TEXTO4:=[Retorno do LP]
TEXTO5:=[Retorna ao Cadastro de LP's]
TEXTO6:=[Este LP j  est  emprestado]
TEXTO7:="[Saida do LP (Incluir)]"
TEXTO8:="[Saida do LP (Alterar)]"
TEXTO9:="[Excluir]"
TEXTO10:="[Retorno do LP]"
TEXTO11:="Este LP n„o est  emprestado"
TEXTO12:="Voce precisa ter um LP para emprestalo"
TEXTO13:="Vocˆ ainda n„o comprou o LP e j  que emprestalo!"
ENDIF

IF MIDIA = 'K7'
TEXTO:="[Empr‚stimo de K7's]"
TEXTO1:=[Empr‚stimo do K7 (Saida)]
TEXTO2:=[Empr‚stimo do K7 (Altera Data)]
TEXTO3:=[Empr‚stimo do K7 (Exclui Emprestimo)]
TEXTO4:=[Retorno do K7]
TEXTO5:=[Retorna ao Cadastro de K7's]
TEXTO6:=[Este K7 j  est  emprestado]
TEXTO7:="[Saida do K7 (Incluir)]"
TEXTO8:="[Saida do K7 (Alterar)]"
TEXTO9:="[Excluir]"
TEXTO10:="[Retorno do K7]"
TEXTO11:="Este K7 n„o est  emprestado"
TEXTO12:="Voce precisa ter um K7 para emprestalo"
TEXTO13:="Vocˆ ainda n„o comprou o K7 e j  que emprestalo!"
ENDIF

IF MIDIA = 'EQ' 
TEXTO:="[Empr‚stimo de EQ]"
TEXTO1:=[Empr‚stimo do EQ (Saida)]
TEXTO2:=[Empr‚stimo do EQ (Altera Data)]
TEXTO3:=[Empr‚stimo do EQ (Exclui Emprestimo)]
TEXTO4:=[Retorno do EQ]
TEXTO5:=[Retorna ao Cadastro de EQ's]
TEXTO6:=[Este EQ j  est  emprestado]
TEXTO7:="[Saida do EQ (Incluir)]"
TEXTO8:="[Saida do EQ (Alterar)]"
TEXTO9:="[Excluir]"
TEXTO10:="[Retorno do EQ]"
TEXTO11:="Este EQ n„o est  emprestado"
TEXTO12:="Voce precisa ter um EQ para emprestalo"
TEXTO13:="Vocˆ ainda n„o comprou o EQ e j  que emprestalo!"
ENDIF

IF MIDIA = 'MD'
TEXTO:="[Empr‚stimo de MD's]"
TEXTO1:=[Empr‚stimo do MD (Saida)]
TEXTO2:=[Empr‚stimo do MD (Altera Data)]
TEXTO3:=[Empr‚stimo do MD (Exclui Emprestimo)]
TEXTO4:=[Retorno do MD]
TEXTO5:=[Retorna ao Cadastro de MD's]
TEXTO6:=[Este MD j  est  emprestado]
TEXTO7:="[Saida do MD (Incluir)]"
TEXTO8:="[Saida do MD (Alterar)]"
TEXTO9:="[Excluir]"
TEXTO10:="[Retorno do MD]"
TEXTO11:="Este MD n„o est  emprestado"
TEXTO12:="Voce precisa ter um MD para emprestalo"
TEXTO13:="Vocˆ ainda n„o comprou o MD e j  que emprestalo!"
ENDIF

IF MIDIA = 'SE' 
TEXTO:="[Empr‚stimo de SE's]"
TEXTO1:=[Empr‚stimo do SE (Saida)]
TEXTO2:=[Empr‚stimo do SE (Altera Data)]
TEXTO3:=[Empr‚stimo do SE (Exclui Emprestimo)]
TEXTO4:=[Retorno do SE]
TEXTO5:=[Retorna ao Cadastro de SE's]
TEXTO6:=[Este SE j  est  emprestado]
TEXTO7:="[Saida do SE (Incluir)]"
TEXTO8:="[Saida do SE (Alterar)]"
TEXTO9:="[Excluir]"
TEXTO10:="[Retorno do SE]"
TEXTO11:="Este SE n„o est  emprestado"
TEXTO12:="Voce precisa ter um SE para emprestalo"
TEXTO13:="Vocˆ ainda n„o comprou o SE e j  que emprestalo!"
ENDIF

IF MIDIA = 'VH' 
TEXTO:="[Empr‚stimo de VHS's]"
TEXTO1:=[Empr‚stimo do VHS (Saida)]
TEXTO2:=[Empr‚stimo do VHS (Altera Data)]
TEXTO3:=[Empr‚stimo do VHS (Exclui Emprestimo)]
TEXTO4:=[Retorno do VHS]
TEXTO5:=[Retorna ao Cadastro de VHS's]
TEXTO6:=[Este VHS j  est  emprestado]
TEXTO7:="[Saida do VHS (Incluir)]"
TEXTO8:="[Saida do VHS (Alterar)]"
TEXTO9:="[Excluir]"
TEXTO10:="[Retorno do VHS]"
TEXTO11:="Este VHS n„o est  emprestado"
TEXTO12:="Voce precisa ter um VHS para emprestalo"
TEXTO13:="Vocˆ ainda n„o comprou o VHS e j  que emprestalo!"
ENDIF

IF MIDIA = SPACE(02)
RETURN
ENDIF

IF PROPRIEDA = "BOM P/ COMPRAR"
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

VTITULO:=TITULO
VCONJUNTO:=CONJUNTO
VMIDIA:=MIDIA
VCODIGO:=REGISTRO
NETO:=RECNO()

TEL60:=SAVESCREEN(06,20,16,59)

OP=1

DO WHILE .T.

SETCOLOR(cor11)

@ 06,20 CLEAR TO 16,59
@ 06,20 TO 16,59 DOUBLE
@ 06,30 SAY TEXTO
@ 07,22 PROMPT TEXTO1
@ 09,22 PROMPT TEXTO2
@ 11,22 PROMPT TEXTO3
@ 13,22 PROMPT TEXTO4
@ 15,22 PROMPT TEXTO5

MENU TO OP

DO CASE

CASE OP=1
DO CADEM_SA

CASE OP=2
DO CADEM_AL

CASE OP=3
DO CADEM_DL

CASE OP=4
DO CADEM_DE

CASE OP=5
RESTSCREEN(06,20,16,59,TEL60)

SELECT CADASTRO

RETURN(0)

ENDCASE
ENDDO

FUNCTION F_EMPRE

public Cpos, Pics, Cabs, wDBMANU

tela_s:=savescreen(00,00,24,79)

setcolor(cor3)
@ 0, 0, 2, 79 BOX "ÉÍ»º¼ÍÈº "
setcolor(cor1)
@  1, 1 say padc("Itens Emprestados",78)

SELECT EMPRESTO
SET FILTER TO
Cpos := { "NOME", "SAIU" , "DIAS" , "MIDIA" }
Pics := { "", "" , "@E 9999999999" , "" }
Cabs := { "Nome", "Data de Saida" , "D. Emprestado" , "Midia" }
wDBMANU(03,00,24,79, Cpos, Pics, Cabs,.F.,"EMPRE","","NOME+TITULO",cor3,cor1,cor3I,3,3)
restscreen(00,00,24,79,tela_s)
SELECT CADASTRO

FUNCTION EMPRE_VTECLA
PRIVATE tecla
tecla = LASTKEY()
DO CASE
   CASE tecla = 13  && ENTER
        DO info_emp1
   ENDCASE
RETURN(.F.)
