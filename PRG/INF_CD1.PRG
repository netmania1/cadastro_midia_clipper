tel10:=savescreen(00,00,22,79)

setcolor(_cor1)

@ 00,00 clear to 22,79
@ 00,00 to 22,79 double

@ 00,25 say "[Informa��es Complementares]"
@ 01,01 say "Titulo:"
@ 03,01 say "Conjuno:" + space(42) + "Codigo:"
@ 05,01 say "Tipo de grava��o:" + space(05) + "Gravadora:" + space(32) + "N� Faixas:"
@ 07,01 say "Propriedade:" + space(17) + "Valor:" + space(11) + "Presente:" + space(03) + "CD N�:"
@ 09,01 say "Loja (ou quem deu o CD de presente):"
@ 11,01 say "Data de Inclus�o:" + space(12) + "Data de Altera��o:"
@ 13,01 say "CD emprestado para:" + space(33) + " - " + "Data Emp.:"
@ 15,01 say "Musica:"
@ 17,01 Say "Interprete:"
@ 19,01 say "Tempo de dura��o:"
@ 21,01 say "Numero da faixa:"

setcolor("r+/b")
@ 07,36 say "R$"

setcolor(_cor23)
@ 01,08 say titulo
@ 03,09 say conjunto
@ 03,58 say codigo
@ 05,18 say gra
@ 05,33 say gravadora
@ 05,75 say faixa
@ 07,13 say proprieda
@ 07,38 say valor pict "@E9999.999.999.99"
@ 07,56 say presente
@ 07,65 say registro
@ 09,37 say loja
@ 11,18 say inclui
@ 11,48 say altera
@ 13,20 say nempresto
@ 13,66 say d_saiu
@ 15,08 say vmusica
@ 17,12 say vconjunto
@ 19,18 say str(vminuto) + ':' + str(vsegundo)
@ 21,17 say vfaixa

inkey(0)
restscreen(00,00,22,79,tel10)
                       
 
