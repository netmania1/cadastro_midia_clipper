use cadastro index cadastro

? "Cadastro"

do while .not. eof()

if midia = 'CD - Compact Disc' 
replace midia with 'CD' 
endif

if midia = 'LP - Long Player' 
replace midia with 'LP' 
endif

if midia = 'K7 - Fita Cassete' 
replace midia with 'K7' 
endif

if midia = 'EQ - Equipamento Eletronico' 
replace midia with 'EQ' 
endif

if midia = 'VH - Fita de Video (VHS)' 
replace midia with 'VH' 
endif

if midia = 'SE - Servico' 
replace midia with 'SE' 
endif

skip

enddo

use empresto index empresto

? "Empresto"

do while .not. eof()

if midia = 'CD - Compact Disc' 
replace midia with 'CD' 
endif

if midia = 'LP - Long Player' 
replace midia with 'LP' 
endif

if midia = 'K7 - Fita Cassete' 
replace midia with 'K7' 
endif

if midia = 'EQ - Equipamento Eletronico' 
replace midia with 'EQ' 
endif

if midia = 'VH - Fita de Video (VHS)' 
replace midia with 'VH' 
endif

if midia = 'SE - Servico' 
replace midia with 'SE' 
endif

skip

enddo

use devolve index devolve

? "Devolve"

do while .not. eof()

if midia = 'CD - Compact Disc' 
replace midia with 'CD' 
endif

if midia = 'LP - Long Player' 
replace midia with 'LP' 
endif

if midia = 'K7 - Fita Cassete' 
replace midia with 'K7' 
endif

if midia = 'EQ - Equipamento Eletronico' 
replace midia with 'EQ' 
endif

if midia = 'VH - Fita de Video (VHS)' 
replace midia with 'VH' 
endif

if midia = 'SE - Servico' 
replace midia with 'SE' 
endif

skip

enddo

use nome index nome

? "Nome"

do while .not. eof()

if midia = 'CD - Compact Disc' 
replace midia with 'CD' 
endif

if midia = 'LP - Long Player' 
replace midia with 'LP' 
endif

if midia = 'K7 - Fita Cassete' 
replace midia with 'K7' 
endif

if midia = 'EQ - Equipamento Eletronico' 
replace midia with 'EQ' 
endif

if midia = 'VH - Fita de Video (VHS)' 
replace midia with 'VH' 
endif

if midia = 'SE - Servico' 
replace midia with 'SE' 
endif

skip

enddo
