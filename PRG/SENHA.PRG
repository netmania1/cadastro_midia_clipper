FUNCTION MENU_SENHA
setcolor('w/n,n/w')
cls
PRIVATE mUSER, mFUNCAO, slvcor, slvtela, col
slvcor=SETCOLOR()
slvtela=SAVESCREEN(9,13,13,66)
SETCOLOR("+GR/BR")
@ 9, 13, 13, 66 BOX "赏缓纪群 "
@ 11, 16 SAY "USUARIO:"+space(11)+"SENHA:"+space(7)+"NOVA SENHA:"
SETCOLOR(Cor3)
IF LEN(Usuario) > 1
   mUSER = Usuario
ELSE
   mUSER = ALLTRIM(UPPER(GETENV("USUARIO")))
   USR_NTW = mUSER
ENDIF
IF mUSER = "FEIRA"
   mUSER = SPACE(8)
ELSE
   mUSER = PADR(mUSER,8)
ENDIF
@ 11, 25 GET mUSER PICTURE "@!K"
SV_READ()
IF USR_NTW = "FEIRA"
   IF LEN(senha1) = 4
      Usuario = ALLTRIM(mUSER)
      RESTSCREEN(9,13,13,66,slvtela)
      SETCOLOR(slvcor)
      RETURN
   ENDIF
ENDIF
IF tecla = 27
   SV_Fim()
ENDIF
senha1 = SV_GETSENHA(11, 42, 4)
IF tecla = 27
   SV_Fim()
ENDIF
senha2 = SV_GETSENHA(11, 60, 4)
SELECT SENHA
SET SOFTSEEK on
SEEK mUSER+"PASW"
IF EOF() = .F. .AND. mUSER = USER .AND. TRANSA = "PASW"
   IF USR_NTW <> "FEIRA"
      IF CRIPT(senha1) <> FUNCAO .AND. senha2 <> "XPTO"
         Mensagem(6,"SENHA INVALIDA!", Cor4)
         SV_Fim()
      ENDIF
      IF LEN(senha2) = 4
         Mensagem(6,"DIGITE OUTRA VEZ A NOVA SENHA", Cor4)
         senha3 = SV_GETSENHA(11, 60, 4)
         IF senha2 <> senha3 .AND. senha2 <> "XPTO"
            Mensagem(6,"SENHA NAO CONFERE!", Cor4)
            SV_Fim()
         ENDIF
         RLOCK()
         REPLACE FUNCAO WITH CRIPT(senha3)
         SV_UNLOCK()
         Mensagem(6,"SENHA ALTERADA", Cor4)
      ENDIF
   ENDIF
ELSE
   IF senha2 = "XPTO"
      Mensagem(6,"DIGITE OUTRA VEZ A NOVA SENHA", Cor4)
      senha3 = SV_GETSENHA(11, 60, 4)
      IF senha1 <> senha3
         Mensagem(6,"SENHA NAO CONFERE!", Cor4)
         SV_Fim()
      ENDIF
      muser_name = space(45)
      @ 11, 25 GET mUSER_NAME PICTURE "@!KS40"      
      read
      APPEND BLANK
      RLOCK()
      REPLACE USER_NAME WITH mUSER_NAME
      REPLACE USER WITH mUSER
      REPLACE TRANSA WITH "PASW"
      REPLACE FUNCAO WITH CRIPT(senha1)
      SV_UNLOCK()
      Mensagem(6,"USUARIO INCLUIDO", Cor4)
   ELSE
      Mensagem(6,"USUARIO NAO AUTORIZADO PARA ACESSAR O PROGRAMA!", Cor4)
      SV_Fim()
   ENDIF
ENDIF
Usuario = ALLTRIM(mUSER)

*=*
select Log_user
append blank
replace user with usuario
replace data_ini with date()
replace inicio with time()
*=*

RESTSCREEN(9,13,13,66,slvtela)
SETCOLOR(slvcor)
RETURN
*
FUNCTION SV_GETSENHA
PARAMETERS linha, wcol, qtdig
PRIVATE senha, col
col=wcol
senha=""
tecla=0
DO WHILE tecla<>27 .AND. tecla<>13 .AND. (col - wcol) < qtdig
   @ linha, col SAY ""
   SV_INKEY(0)
   IF tecla>0 .AND. tecla<>27 .AND. tecla<>13
      @ linha, col SAY "*"
              senha=senha+UPPER(CHR(tecla))
      col = col + 1
   ENDIF
ENDDO
RETURN(senha)
*
FUNCTION CRIPT ( texto )
PRIVATE I, wtxt
wtxt = ""
FOR I = 1 TO LEN(texto)
    wtxt = wtxt + CHR( 255 - ASC( SUBSTR(texto,I,1) ) )
NEXT
RETURN(wtxt)
****************************************************************************
FUNCTION SV_Fim
SETCOLOR()
SET CURSOR ON
setcolor('w/n,n/w')
cls
QUIT
RETURN
****************************************************************************
FUNCTION SV_READ
SET CURSOR ON
READ
tecla  = LASTKEY()
teclax = UPPER(CHR(tecla))
RETURN
***************************************************************************
FUNCTION SV_UNLOCK
DBCOMMIT()
UNLOCK
RETURN
***************************************************************************
FUNCTION SV_INKEY
PARAMETERS tempo
PRIVATE wtempo
wtempo = tempo
IF tempo = 0
   wtempo = 900
ENDIF
INKEY(wtempo)
tecla = LASTKEY()
teclax=UPPER(CHR(tecla))
IF tecla <> 0
   RETURN
ENDIF
IF tempo <> wtempo
   SV_Fim()
ENDIF
RETURN
***************************************************************************
FUNCTION VERI_SENHA
PARAMETERS pTransa, pFuncao, pMens
IF PCOUNT() = 1
   pFuncao = SPACE(4)
ENDIF
IF PCOUNT() < 3
   pMens = .F.
ENDIF
SELECT SENHA
SEEK PADR(USUARIO,8)+PADR(pTransa,4)+PADR(pFuncao,4)
IF FOUND() = .F.
 IF pMens = .F.
    Mensagem(2, "Programa/Fun嘺o '"+pTransa+"/"+pFuncao+"' Nao Autorizada", Cor4)
 ENDIF
 RETURN(.F.)
ENDIF
RETURN(.T.)
***************************************************************************
FUNCTION SENHA_CAD

IF VERI_SENHA("SENH", "CTRL") = .F.
  SELECT CADASTRO
  RETURN(.F.)
ENDIF

tela_s:=savescreen(00,00,24,79)

setcolor(cor3)
@ 0, 0, 2, 79 BOX "赏缓纪群 "
setcolor(cor1)
@  1, 1 say padc("Usuarios Cadastrados",78)

SELECT SENHA
Cpos := { "USER" , "USER_NAME" , "TRANSA" , "FUNCAO" }
Pics := { "","","","" }
Cabs := { "User" , "Nome do Usuario" , "Programa" , "Funcao" }
wDBMANU(03,00,24,79, Cpos, Pics, Cabs,.F.,"pass_m","","User + User_name",cor3,cor1,cor3I,3,3)
SELECT CADASTRO
restscreen(00,00,24,79,tela_s)
RETURN
