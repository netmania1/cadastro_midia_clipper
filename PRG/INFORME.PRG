#define b_double 2

FUNCTION Inf_inf1

setcursor(0)
setcolor(_cor2)
tele:=savescreen(05,03,22,73)
@ 05,03 clear to 22,73
dispbox(05,03,22,73, b_double)

@ 06,06 say "I -> Inclui um registro"
@ 07,06 say "A -> Altera o registro"
@ 08,06 say "E -> Exclui o registro"
@ 09,06 say "L -> Seleciona o registro (Por Titulo ou Interprete)"
@ 10,06 say "M -> Aciona o modulo de cadastro de m£sicas"
@ 11,06 say "T -> Mostra o valor total da cole‡„o"
@ 12,06 say "F1 -> Informa‡”es sobre o registro"
@ 13,06 say "F2 -> Aciona o modulo de emprestimo e Devolu‡„o"
@ 14,06 say "F3 -> Mostra os emprestimmos por nome da pessoa"
@ 15,06 say "F4 -> Aciona o modulo de emprestimo por nome"
@ 16,06 say "F5 -> Mostra os items que est„o emprestados no momento"
@ 17,06 say "F6 -> Tela para cadastro de ritmos"
@ 18,06 say "Esc -> Sai do sistema e retorna ao DOS"
@ 19,06 say "Alt-E -> Mostra todos os CD's, LP's & K7's emprestados"
@ 20,06 say "Alt-I -> Imprime o registro"
@ 21,06 say "Alt-M -> Mostra todas as musicas cadastradas"

inkey(10)
restscreen(05,03,22,73,tele)
setcolor(cor)

FUNCTION Inf_inf2

setcursor(0)
setcolor(_cor2)
tele:=savescreen(05,03,10,45)
@ 05,03 clear to 10,45
dispbox(05,03,10,45, b_double)

@ 06,06 say "I -> Inclui um registro"
@ 07,06 say "A -> Altera o registro"
@ 08,06 say "E -> Exclui o registro"
@ 09,06 say "Esc -> Retorna o ao modulo de Cadastro"

inkey(10)
restscreen(05,03,10,45,tele)
setcolor(cor)

FUNCTION Inf_inf3

setcursor(0)
setcolor(_cor2)
tele:=savescreen(05,03,09,59)
@ 05,03 clear to 09,59
dispbox(05,03,09,59, b_double)

@ 06,06 say "L -> Seleciona o registro (Por Musica ou Interprete)"
@ 07,06 say "F1 -> Informacoes sobre a musica"
@ 08,06 say "Esc -> Retorna o ao modulo de Cadastro"

inkey(10)
restscreen(05,03,09,59,tele)
setcolor(cor)

FUNCTION info_emp()

salv_tela:=savescreen(03,00,21,79)

setcolor(cor1)

@ 03,00 clear to 21,79
@ 03,00 to 21,79 double
@ 04,01 say 'Codigo do registro: ' + str(codigo)
@ 06,01 say 'Titulo: ' + titulo
@ 08,01 say 'Interprete: ' + conjunto
@ 10,01 say 'Data de saida: ' + dtoc(saiu)
@ 12,01 say 'Data de retorno: ' + dtoc(retornou)
@ 14,01 say 'Dias emprestados: ' + str(dias)
@ 16,01 say 'Codigo do nome:' + str(cod_nome) + ' - ' + 'Nome da pessoa: ' + nome
@ 18,01 say 'Tipo de midia da grava‡„o: ' + midia
@ 20,01 say 'Registro n§: ' + str(registro)

inkey(12)

restscreen(03,00,21,79,salv_tela)

FUNCTION info_emp1()

salv_tela:=savescreen(03,00,17,79)

setcolor(cor1)

@ 03,00 clear to 17,79
@ 03,00 to 17,79 double
@ 04,01 say 'Codigo do registro: ' + str(codigo)
@ 06,01 say 'Titulo: ' + titulo
@ 08,01 say 'Interprete: ' + conjunto
@ 10,01 say 'Data de saida: ' + dtoc(saiu)
@ 12,01 say 'Dias emprestados: ' + str(dias)
@ 14,01 say 'Tipo de midia da grava‡„o: ' + midia
@ 16,01 say 'Registro n§: ' + str(registro)

inkey(12)

restscreen(03,00,17,79,salv_tela)
