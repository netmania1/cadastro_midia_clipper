use empresto

do while .not. eof()

if midia = 'CD' 
replace midia with 'CD - Compact Disc' 
endif

if midia = 'LP' 
replace midia with 'LP - Long Player' 
endif

if midia = 'K7' 
replace midia with 'K7 - Fita Cassete' 
endif

if midia = 'EQ' 
replace midia with 'EQ - Equipamento Eletronico' 
endif

if midia = 'VH' 
replace midia with 'VH - Fita de Video (VHS)' 
endif

if midia = 'SE' 
replace midia with 'SE - Servico' 
endif

skip

enddo

use devolve

do while .not. eof()

if midia = 'CD' 
replace midia with 'CD - Compact Disc' 
endif

if midia = 'LP' 
replace midia with 'LP - Long Player' 
endif

if midia = 'K7' 
replace midia with 'K7 - Fita Cassete' 
endif

if midia = 'EQ' 
replace midia with 'EQ - Equipamento Eletronico' 
endif

if midia = 'VH' 
replace midia with 'VH - Fita de Video (VHS)' 
endif

if midia = 'SE' 
replace midia with 'SE - Servico' 
endif

skip

enddo

use nome

do while .not. eof()

if midia = 'CD' 
replace midia with 'CD - Compact Disc' 
endif

if midia = 'LP' 
replace midia with 'LP - Long Player' 
endif

if midia = 'K7' 
replace midia with 'K7 - Fita Cassete' 
endif

if midia = 'EQ' 
replace midia with 'EQ - Equipamento Eletronico' 
endif

if midia = 'VH' 
replace midia with 'VH - Fita de Video (VHS)' 
endif

if midia = 'SE' 
replace midia with 'SE - Servico' 
endif

skip

enddo
