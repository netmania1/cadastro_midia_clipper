TEMP  = "THE DISCO YEARS VOLUME TWO"
TEMP1 = "THE DISCO YEARS, VOLUME TWO: ON THE BEAT (1978-1982)"

use cadastro

do while .not. eof()

IF TITULO = TEMP
REPLACE TITULO WITH TEMP1
ENDIF

skip +1

enddo

use empresto

do while .not. eof()

if titulo = TEMP
REPLACE titulo WITH TEMP1
ENDIF

skip +1

enddo

use DEVOLVE

do while .not. eof()

if titulo = TEMP
REPLACE titulo WITH TEMP1
ENDIF

skip +1

enddo

DELETE FILE CADASTRO.NTX
DELETE FILE EMPRESTO.NTX
DELETE FILE DEVOLVE.NTX
