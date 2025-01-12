FUNCTION F_REGISTRO

tel60:=savescreen(09,13,14,65)
setcolor(_cor4)
@ 09, 22, 11, 50 box "赏缓纪群 "
setcolor(_cor9)
@ 10,24 say 'Aguarde, em processamento'

SET DELETED OFF

select cadastro
dbcommit()
temp1 = reccount()
count to temp11 for deleted()

select musica
dbcommit()
temp2 = reccount()
count to temp22 for deleted()

select empresto
dbcommit()
temp3 = reccount()
count to temp33 for deleted()

select devolve
dbcommit()
temp4 = reccount()
count to temp44 for deleted()

select nome
dbcommit()
set filter to
temp5 = reccount()
count to temp55 for deleted()

select ritmo
dbcommit()
temp6 = reccount()
count to temp66 for deleted()

tela = savescreen(04,09,18,63)

setcolor('b/w')

@ 04, 09, 18, 63 box "赏缓纪群 "

@ 04,19 say chr(203) + replicate(chr(205),09) + chr(203) + replicate(chr(205),09) + chr(203) + replicate(chr(205),10) + chr(203)
@ 18,19 say chr(202) + replicate(chr(205),09) + chr(202) + replicate(chr(205),09) + chr(202) + replicate(chr(205),10) + chr(202)

@ 06,09 say chr(204) + replicate(chr(205),09) + chr(206) + replicate(chr(205),09) + chr(206) + replicate(chr(205),09) + chr(206) + replicate(chr(205),10) + chr(206) + replicate(chr(205),12) + chr(185)
@ 08,09 say chr(204) + replicate(chr(205),09) + chr(206) + replicate(chr(205),09) + chr(206) + replicate(chr(205),09) + chr(206) + replicate(chr(205),10) + chr(206) + replicate(chr(205),12) + chr(185)
@ 10,09 say chr(204) + replicate(chr(205),09) + chr(206) + replicate(chr(205),09) + chr(206) + replicate(chr(205),09) + chr(206) + replicate(chr(205),10) + chr(206) + replicate(chr(205),12) + chr(185)
@ 12,09 say chr(204) + replicate(chr(205),09) + chr(206) + replicate(chr(205),09) + chr(206) + replicate(chr(205),09) + chr(206) + replicate(chr(205),10) + chr(206) + replicate(chr(205),12) + chr(185)
@ 14,09 say chr(204) + replicate(chr(205),09) + chr(206) + replicate(chr(205),09) + chr(206) + replicate(chr(205),09) + chr(206) + replicate(chr(205),10) + chr(206) + replicate(chr(205),12) + chr(185)
@ 16,09 say chr(204) + replicate(chr(205),09) + chr(206) + replicate(chr(205),09) + chr(206) + replicate(chr(205),09) + chr(206) + replicate(chr(205),10) + chr(206) + replicate(chr(205),12) + chr(185)

setcolor('n/w')
@ 05,10 say 'Arquivo ' + space(02) + 'Indice 1' + space(02) + 'Indice 2' + space(02) + 'Registro '       + space(02) + 'Reg. Apagado'
@ 07,10 say 'Cadastro' + space(02) + 'Cadastro' + space(02) + '        ' + space(02) + rtrim(str(temp1)) + space(02) + rtrim(str(temp11))
@ 09,10 say 'Musica  ' + space(02) + 'MusicaF ' + space(02) + 'MusicaM ' + space(02) + rtrim(str(temp2)) + space(02) + rtrim(str(temp22))
@ 11,10 say 'Empresto' + space(02) + 'Empresto' + space(02) + '        ' + space(02) + rtrim(str(temp3)) + space(02) + rtrim(str(temp33))
@ 13,10 say 'Devolve ' + space(02) + 'Devolve ' + space(02) + '        ' + space(02) + rtrim(str(temp4)) + space(02) + rtrim(str(temp44))
@ 15,10 say 'Nome    ' + space(02) + 'Nome    ' + space(02) + '        ' + space(02) + rtrim(str(temp5)) + space(02) + rtrim(str(temp55))
@ 17,10 say 'Ritmo   ' + space(02) + 'RitmoC  ' + space(02) + 'RitmoT  ' + space(02) + rtrim(str(temp6)) + space(02) + rtrim(str(temp66))

setcolor('b/w')

@ 05,19 say chr(186) 
@ 05,29 say chr(186)
@ 05,39 say chr(186)
@ 05,50 say chr(186)

@ 07,19 say chr(186)
@ 07,29 say chr(186)
@ 07,39 say chr(186)
@ 07,50 say chr(186)

@ 09,19 say chr(186)
@ 09,29 say chr(186)
@ 09,39 say chr(186)
@ 09,50 say chr(186)

@ 11,19 say chr(186)
@ 11,29 say chr(186)
@ 11,39 say chr(186)
@ 11,50 say chr(186)

@ 13,19 say chr(186)
@ 13,29 say chr(186)
@ 13,39 say chr(186)
@ 13,50 say chr(186)

@ 15,19 say chr(186)
@ 15,29 say chr(186)
@ 15,39 say chr(186)
@ 15,50 say chr(186)

@ 17,19 say chr(186)
@ 17,29 say chr(186)
@ 17,39 say chr(186)
@ 17,50 say chr(186)

inkey(20)

restscreen(04,09,20,63,tela)
restscreen(09,13,14,65,tel60)

set deleted on

select cadastro

set filter to

goto top

LPgrp_Inicializa(0)
