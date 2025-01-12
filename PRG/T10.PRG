cls

select 1
use cadastro index cadastro new

select 2
use devolve new

select 1

do while .not. eof()

select 1
? Titulo
? Conjunto
? Midia
? Registro
vcodigo = registro

select 2
set filter to codigo = vcodigo
count to vtotal_em

select 1

? VTotal_em

replace total_em with vtotal_em
skip +1

enddo

