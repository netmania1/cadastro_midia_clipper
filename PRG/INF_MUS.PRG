FUNCTION INFO_MUS

SELECT MUSICA
DBSETORDER(1)
SET FILTER TO COD_MUSICA = TEMP1

Cpos := { "FAIXA", "MUSICA" , "MINUTO" , "SEGUNDO" }
Pics := { "@E 99", "", "@E 99" , "@E 99" }
Cabs := { "Fa", "Titulo da Can‡„o" , "Min" , "Seg" }
wDBMANU(14, 01, 23, 78, Cpos, Pics, Cabs,.F.,"","","",cor3,cor1,cor3I,3,3)
SELECT CADASTRO

FUNCTION INFO_MUS1

SELECT MUSICA
DBSETORDER(1)
SET FILTER TO COD_MUSICA = TEMP1

Cpos := { "FAIXA", "MUSICA" , "MINUTO" , "SEGUNDO" }
Pics := { "@E 99", "", "@E 99" , "@E 99" }
Cabs := { "Fa", "Titulo da Can‡„o" , "Min" , "Seg" }
wDBMANU(16, 01, 23, 78, Cpos, Pics, Cabs,.F.,"","","",cor3,cor1,cor3I,3,3)
SELECT CADASTRO
