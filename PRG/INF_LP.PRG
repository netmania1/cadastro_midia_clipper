tel10:=savescreen(00,00,24,79)

salvareg := recno()

temp1 := recno()

setcolor(_cor1)

@ 00,00 clear to 24,79

@ 00,00 to 24,79 double

@ 00,25 say "[Informa‡”es Complementares]"
@ 24,27 say "[Precione Esc para sair]"
@ 01,01 say "Titulo:"
@ 03,01 say "Conjuno:" + space(42) + "Codigo:"
@ 05,01 say "Gravadora:" + space(32) + "N§ Faixas:" + space(04) + "Tam. LP:" + space(04) + "RPM:" + space(04)
@ 07,01 say "Propriedade:" + space(17) + "Valor:" + space(11) + "Presente:" + space(03) + "LP N§:"
@ 09,01 say "Loja (ou quem deu o LP de presente):"
@ 11,01 say "Serie:" + space(32) + "Audio (Stereo / Mono):" + space(07) + "HI-FI:"
@ 13,01 say "LP emprestado para:" + space(33) + " - " + "Data Emp.:"
@ 15,01 say "Data de Inclus„o:" + space(12) + "Data de Altera‡„o:" + space(12) + "Encarte:"

IF HI_FI = 'S'
   thi_fi = "Sim"
ELSE
   thi_fi = "N„o"
ENDIF

setcolor("r+/b")
@ 07,36 say "R$"

setcolor(_cor23)
@ 01,08 say titulo
@ 03,09 say conjunto
@ 03,58 say codigo
@ 05,11 say gravadora
@ 05,53 say faixa
@ 05,65 say tamanho
@ 05,73 say rotacao
@ 07,13 say proprieda
@ 07,38 say valor pict "@E9999.999.999.99"
@ 07,56 say presente
@ 07,65 say registro
@ 09,37 say loja
@ 11,07 say serie
@ 11,61 say som
@ 11,74 say thi_fi
@ 13,20 say nempresto
@ 13,66 say d_saiu
@ 15,68 say encarte
@ 15,18 say inclui
@ 15,48 say altera

Mensage(18,'Aguarde! Em execu‡„ao.')

info_mus1()

restscreen(00,00,24,79,tel10)
                                                                              
 
