FUNCTION F_Nome

private cod_nome, midia, nome, vmidia

tela_s:=savescreen(00,00,24,79)

setcolor(cor3)
@ 0, 0, 2, 79 BOX "赏缓纪群 "
setcolor(cor1)
@  1, 1 say padc("Controle de Emprestimos e Devolu嚁es (Por Nome da Pessoa)",78)

SELECT NOME
set filter to
Cpos := { "NOME", "MIDIA", "REGISTRO",  "ULT_EMPRE", "TOTAL_EM" }
Pics := { "", "", "@E 9999999", "", "@E 9999999" }
Cabs := { "Nome" , "Midia" , "Codigo" , "U. Empres." , "Total Emp." }
wDBMANU(03,00,24,79, Cpos, Pics, Cabs,.F.,"NOME","","NOME+MIDIA",cor3,cor1,cor3I,3,3)
SELECT CADASTRO
restscreen(00,00,24,79,tela_s)
select cadastro
RETURN

FUNCTION NOME_VTECLA
PRIVATE tecla
tecla = LASTKEY()
DO CASE
   CASE tecla = 13  && ENTER
        vcod_nome = registro
        vtexto = cod_nome + ' - ' + nome + ' - ' + midia
        DO NOME_TELA
   ENDCASE
RETURN(.F.)

FUNCTION NOME1
IF LASTKEY() <> 13 ; RETURN ; ENDIF

select devolve
set filter to cod_nome = vcod_nome
Cpos := { "TITULO_C", "SAIU" ,  "RETORNOU" , "DIAS" }
Pics := { "", "", "" , "@E 9999999999" }
Cabs := { "Titulo", "Data Saida" , "Data Retorno" , "Dias Em." }
wDBMANU(03,00,24,79, Cpos, Pics, Cabs,.F.,"NOME1","","",cor3,cor1,cor3I,3,3)
restscreen(00,00,02,79,tela_s1)
SELECT NOME
RETURN

FUNCTION NOME1_VTECLA
PRIVATE tecla
tecla = LASTKEY()
DO CASE
   CASE tecla = 13  && ENTER
        DO info_emp
   ENDCASE
RETURN(.F.)

FUNCTION NOME_TELA

tela_s1:=savescreen(00,00,02,79)

setcolor(cor3)
@ 0, 0, 2, 79 BOX "赏缓纪群 "

@ 1, 2 say 'Codigo:' + space(08) + 'Nome:' + space(33) + 'Midia:' + space(03) + 'Total:'
setcolor(cor1)
@ 1,09 SAY vcod_nome
@ 1,22 SAY nome
@ 1,61 SAY midia
@ 1,70 SAY total_em

do nome1
