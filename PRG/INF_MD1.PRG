tel10:=savescreen(00,00,24,79)

setcolor(_cor1)

@ 00,00 clear to 24,79
@ 00,00 to 24,79 double

@ 00,25 say "[Informa��es Complementares]"
@ 01,01 say "Titulo:"
@ 03,01 say "Conjuno:" + space(42) + "Codigo:"
@ 05,01 say "Gravadora:" + space(32) + "N� Faixas:" + space(04) + "Tempo:" + space(04) + "Tipo:" 
@ 07,01 say "Propriedade:" + space(17) + "Valor:" + space(11) + "Presente:" + space(03) + "MD N�:"
@ 09,01 say "Loja (ou quem deu MD de presente):"
@ 11,01 say "Audio (Stereo / Mono):" + space(08) + 'Modelo do MD:'
@ 13,01 say "MD emprestado para:" + space(33) + " - " + "Data Emp.:"
@ 15,01 say "Data de Inclus�o:" + space(12) + "Data de Altera��o:"
@ 17,01 say "Musica:"
@ 19,01 say "Interprete:"
@ 21,01 say "Tempo de dura��o:"
@ 23,01 say "Numero da faixa:"

setcolor("r+/b")
@ 07,36 say "R$"

setcolor(_cor23)
@ 01,08 say titulo
@ 03,09 say conjunto
@ 03,58 say codigo
@ 05,11 say gravadora
@ 05,53 say faixa
@ 05,63 say tempo
@ 05,72 say fita
@ 07,13 say proprieda
@ 07,38 say valor pict "@E9999.999.999.99"
@ 07,56 say presente
@ 07,65 say registro
@ 09,34 say loja
@ 11,23 say som
@ 11,44 say modelo
@ 13,20 say nempresto
@ 13,66 say d_saiu
@ 15,18 say inclui
@ 15,48 say altera
@ 17,08 say vmusica
@ 19,12 say vconjunto
@ 21,18 say str(vminuto) + ':' + str(vsegundo)
@ 23,17 say vfaixa
inkey(0)
restscreen(00,00,24,79,tel10)
                  
 
