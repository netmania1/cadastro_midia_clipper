set date to brit
set delete on
set cursor off

select 1
use nome index nome new 
select 2
use devolve index devolve new 

select 1

goto top

do while .not. eof()
replace total_em with 0
skip +1
enddo

goto top

do while .not. eof()

select 1

temp  = registro
temp1 = nome
temp2 = midia
temp3 = 0

cls

@ 02,01 say 'Nome:' + temp1
@ 03,01 say 'Codigo:' + str(temp)
@ 04,01 say 'Midia:' + temp2
@ 05,01 say 'Total de emprestimos:' + str(temp3)
@ 06,01 say 'Data do ultimo emprestimo:'

select 2

goto top

do while .not. eof()
if nome  = temp1
if midia = temp2
temp4 = retornou
replace cod_nome with temp
select 1
temp3 = total_em + 1
@ 05,01 say 'Total de emprestimos:' + str(temp3)
@ 06,01 say 'Data do ultimo emprestimo:' + dtoc(temp4)
replace total_em with temp3
replace ult_empre with temp4
select 2
else
*
endif
endif

skip +1
enddo

select 1

temp3 = 0
skip +1

enddo

* delete file('devolve.ntx')
* delete file('nome.ntx')
