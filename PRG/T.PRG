TEMP = "BILL HALEY'S GREATEST HITS"
TEMP1 = "BILL HALEY'S GREATEST HITS!"

use cadastro

do while .not. eof()

if titulo = TEMP
REPLACE TITULO WITH TEMP1
ENDIF

skip +1

enddo

use devolve

do while .not. eof()

if titulo = TEMP
REPLACE TITULO WITH TEMP1
ENDIF

skip +1

enddo

DELETE FILE CADASTRO.NTX
DELETE FILE MUSICA.NTX
