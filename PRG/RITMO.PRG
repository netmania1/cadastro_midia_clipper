FUNCTION RITMO_PES
SELECT RITMO
SET FILTER TO
DBSETORDER(1)
GOTO TOP
SET SOFTSEEK OFF
SEEK VCOD_RITMO
IF FOUND() = .F.
   DBSETORDER(2)
   Cpos := { "COD_RITMO", "RITMO" }
   Pics := { "99999", "" }
   Cabs := { "Cod_Rimtmo", "Ritmo" }
   VCOD_RITMO=wDBMANU(1,20,24,79, Cpos, Pics, Cabs,.F.,"","R","Ritmo",cor3,cor1,cor3I,3,3)
ENDIF
VRITMO = RITMO
SETCOLOR(Cor1)
@ 18, 46 SAY left(RITMO,32)
SETCOLOR(_COR1)
SELECT CADASTRO
RETURN(.T.)

FUNCTION F_RITMO
tela_s:=savescreen(00,00,24,79)
setcolor(cor3)
@ 0, 0, 2, 79 BOX "赏缓纪群 "
setcolor(cor1)
@  1, 1 say padc("Cadastro de Ritmos",78)

SELECT RITMO
DBSETORDER(2)
Cpos := { "COD_RITMO", "RITMO" }
Pics := { "@E 99999", "" }
Cabs := { "Codigo do Ritmo" , "Descricao do Ritmo" }
wDBMANU(03,00,24,79,Cpos,Pics,Cabs,.T.,"RITMO","","Ritmo",Cor3,Cor1,Cor3I,3,3)
restscreen(00,00,24,79,tela_s)
SELECT CADASTRO

FUNCTION RITMO_Incl

setcolor(_cor1)

tela = savescreen(03,00,08,79)

@  3, 0, 8, 79 BOX "赏缓纪群 "
@  4, 1 say padc("Inclus刼",78)
@  5, 1 say 'Codigo do Ritmo:'
@  7, 1 say 'Descri噭o do Ritmo:'

reg = str(lastrec()+1)

setcolor('w+/b')

@  5, 17 say right(reg, 5)

setcolor(_cor1)

setcursor(1)

vritmo = space(40)
@  7, 20 get vritmo picture '@!'

READ
SETCURSOR(0)

IF LASTKEY()==27
RESTSCREEN(03,00,08,79,TELA)
SETCOLOR(COR)
RETURN(.F.)
ENDIF

IF Pergunta("Voce deseje incluir este registro? (S/N)",Cor4)<>"S"
   RESTSCREEN(03,00,08,79,TELA)
   RETURN
ENDIF

append blank
replace cod_ritmo with recno()
replace ritmo with vritmo
dbcommit()
go recno()
RETURN(.F.)

FUNCTION RITMO_Alte

setcolor(_cor1)

tela = savescreen(03,00,08,79)

@  3, 0, 8, 79 BOX "赏缓纪群 "
@  4, 1 say padc("Altera噭o",78)
@  5, 1 say 'Codigo do Ritmo:'
@  7, 1 say 'Descri噭o do Ritmo:'

setcolor('w+/b')

@  5, 17 say right(str(cod_ritmo), 5)

setcolor(_cor1)

setcursor(1)

vritmo = ritmo
@  7, 20 get vritmo picture '@!'

READ
SETCURSOR(0)

IF LASTKEY()==27
RESTSCREEN(03,00,06,79,TELA)
SETCOLOR(COR)
RETURN(.F.)
ENDIF

IF Pergunta("Voce deseje alterar este registro? (S/N)",Cor4)<>"S"
   RESTSCREEN(03,00,08,79,TELA)
   RETURN
ENDIF

replace ritmo with vritmo
dbcommit()
RETURN(.F.)

FUNCTION RITMO_Excl
delete
skip -1
dbcommit()
RETURN(.F.)
