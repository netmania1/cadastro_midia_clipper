SET CURSOR OFF
SET DELETED ON
SET SCOREBOARD OFF
SET CONFIRM OFF
SET CENTURY ON
SET DATE TO BRIT
SETCANCEL(.F.)

PRIVATE cor1, cor2, cor3, cor4, cor5, tecla, Caminho, cor, ;
q1, q2, q3, q4, informar, teclax, opcao, borda1, ;
borda2, cor3i, wnmcli, wnmpro, InfCliente, cor, reggoto, ;
v1[4], salvareg

IF UPPER(GETENV('SVVIDEO'))='MONO' .OR. ISCOLOR() = .F.
   cor1  = "W/N, N/W"
   cor2  = "N/W, W/N"
   cor3  = "W/N, N/W"
   cor3I = "N/W, W/N"
   cor4  = "W/N"
   cor5  = "N/W, W/N,,, W/N"
   cor6  = "I"
   cor7  = "N/W, B/W"
   cor8  = "N/W, B/W"
   cor9  = "N/W, B/W"
   cor9I = "W/N, B/W"
   cor10 = "W/N, N/W"
ELSE
   cor1  = "W+/B, N/BG"
   cor2  = "R/W, W/R"
   cor3  = "GR+/B, N/BG"
   cor3I = "N/BG, N/BG"
   cor4  = "W+/R"
   cor5  = "R/W, N/BG,,, W/N"
   cor6  = "W+/B, B/W"
   cor7  = "B/W, B/W"
   cor8  = "N/W, N/BG"
   cor9  = "B/W"
   cor9I = "W/B"
   cor10 = "W+/RB, N/BG"
ENDIF
cor11  = "B/W, W+/B"
_COR1  = 'GR+/B,N/W'
_COR2  = 'R/W'
_COR4  = 'W+/R,N/W'
_COR9  = 'W+*/R'
_COR23 = 'W+/B'

anome = ""
snome = ""
X = 0

cls

Mensage(12,'Iniciando o programa. Por favor aguarde um momento!')

Arquivos()

*============================================================*
*=        Define variaveis privadas                         =*
*============================================================*
PRIVATE lintopo, linfim, qtlintela, teclan, teclax, ql,  ;
curlin, ultreg, prireg, salvareg, salva_cor, xi, ;
com_bri, sem_bri, slv_tela, slv_lin, slv_col
*============================================================*
salva_cor=SETCOLOR()
sem_bri = cor3
com_bri = cor3i
slv_tela = savescreen(1,5,24,74)
*============================================================*
*=        Seleciona Base de Dados                           =*
*============================================================*
SELECT Cadastro
xi = 1
LPgrp_Index()

LPgrp_Inicializa(0)
*============================================================*

DO WHILE teclan <> 27
   teclan = inkey(0)
   teclax = UPPER(CHR(teclan))
   DO CASE
      CASE teclax = 'C'
         f_comenta()
      CASE teclax = 'R'
         f_registro()
      CASE teclax = 'H'
         Inf_inf1()
      CASE teclax = 'M'
         musica_f()
      CASE teclax = 'I'
         LPgrp_Inclui()
      CASE teclax = 'A'
         LPgrp_Altera()
      CASE teclax = 'E'
         LPgrp_Exclui()
      CASE teclax = 'L'
         LPgrp_Localiza()
      CASE teclax = 'T'
         LPgrp_valor()
      CASE teclax = '/'
         LPgrp_posiciona()
      CASE teclan = 306      
         MUSIC_F()
      CASE teclan = -1       
         Emprest()
      CASE teclan = -2       
         F_Devolve()
      CASE teclan = -3       
         F_Nome()
      CASE teclan = -4       
         F_Empre()
      CASE teclan = -5
         F_Ritmo()
      CASE teclan = 279      && Imprime o registro
         LPpr_Imprime()
      CASE teclan = 13       && Informacao sobre o registro
         LPgrp_inf()
      CASE teclan = 274
         LPpr_Net()
      CASE teclan = 5        && Seta para cima
         LPgrp_lpcima()
      CASE teclan = 24       && Seta para baixo
         LPgrp_lpbaixo()
      CASE teclan = 3        && Tecla PgDn
         LPgrp_ppbaixo()
      CASE teclan = 18       && Tecla PgUp
         LPgrp_ppcima()
      CASE teclan = 1        && Tecla Home
         LPgrp_pinicio()
      CASE teclan = 304
         LPpr_Net1()
      CASE teclan = 6        && Tecla End
         LPgrp_pfim()
      OTHERWISE
         TONE(1000,1)
   ENDCASE
ENDDO

do fim

*============================================================*
*=        Movimenta uma linha para cima                     =*
*============================================================*
FUNCTION LPgrp_lpcima
IF recno() = prireg
   TONE(100,1)
ELSE
   IF curlin > lintopo
      LPgrp_normal()
      curlin = curlin - 1
      SKIP -1
      LPgrp_brilho()
   ELSE
      SKIP -1
      LPgrp_tcheia(.t.)
      LPgrp_brilho()
   ENDIF
ENDIF
RETURN
*============================================================*
*=        Movimenta uma linha para baixo                    =*
*============================================================*
FUNCTION LPgrp_lpbaixo
IF recno() = ultreg
   TONE(100,1)
ELSE
   IF curlin < linfim
      LPgrp_normal()
      curlin = curlin + 1
      SKIP
      LPgrp_brilho()
   ELSE
      SKIP 2 - qtlintela
      LPgrp_tcheia(.f.)
      LPgrp_brilho()
   ENDIF
ENDIF
RETURN
*============================================================*
*=        Movimenta uma pagina para cima                    =*
*============================================================*
FUNCTION LPgrp_ppcima
SKIP lintopo - curlin - qtlintela
IF bof()
   TONE(100,1)
   GOTO TOP
   LPgrp_tcheia(.t.)
   LPgrp_brilho()
ELSE
   LPgrp_tcheia(.t.)
   LPgrp_brilho()
ENDIF
RETURN
*============================================================*
*=        Movimenta uma pagina para baixo                   =*
*============================================================*
FUNCTION LPgrp_ppbaixo
SKIP lintopo - curlin + (2*qtlintela) -1
IF eof()
   TONE(100,1)
   SKIP -qtlintela
   LPgrp_tcheia(.f.)
   LPgrp_brilho()
ELSE
   SKIP 1 -qtlintela
   LPgrp_tcheia(.t.)
   LPgrp_brilho()
ENDIF
RETURN
*============================================================*
*=        Posiciona registro no topo da tela                =*
*============================================================*
FUNCTION LPgrp_posiciona
LPgrp_tcheia(.t.)
LPgrp_brilho()
RETURN
*============================================================*
*=        Posiciona tela no inicio do arquivo               =*
*============================================================*
FUNCTION LPgrp_pinicio
GOTO TOP
LPgrp_tcheia(.t.)
LPgrp_brilho()
RETURN
*============================================================*
*=        Posiciona tela no fim do arquivo                  =*
*============================================================*
FUNCTION LPgrp_pfim
GOTO BOTT
SKIP 1 - qtlintela
IF bof()
   GOTO TOP
ENDIF
LPgrp_tcheia(.f.)
LPgrp_brilho()
RETURN
*============================================================*
*=        Mostra a linha com a barra luminosa               =*
*============================================================*
FUNCTION LPgrp_brilho
SETCOLOR(com_bri)
LPgrp_Mlinha(curlin)
RETURN
*============================================================*
*=        Mostra a linha sem a barra luminosa               =*
*============================================================*
FUNCTION LPgrp_normal
SETCOLOR(sem_bri)
LPgrp_Mlinha(curlin)
SET CURSOR off
RETURN
*============================================================*
*=      Mostra tela com todos os registros possiveis        =*
*=  Se chamado com .t., curlin e recno() serao o pri. reg.  =*
*=  Se chamado com .f., curlin e recno() serao o ult. reg.  =*
*============================================================*
FUNCTION LPgrp_tcheia
PARAMETERS liga_topo

PRIVATE linhaw, regtopo

SETCOLOR(sem_bri)
regtopo = recno()
linhaw = lintopo
DO WHILE .not. eof() .and. linhaw <= linfim
   LPgrp_Mlinha(linhaw)
   SKIP
   linhaw = linhaw + 1
ENDDO

IF liga_topo
   GO regtopo
   curlin = lintopo
ELSE
   SKIP -1
   curlin = linhaw -1
ENDIF

RETURN
*============================================================*
*=     Formata campos e mostra na linha solicitada          =*
*============================================================*
FUNCTION LPgrp_Mlinha
PARAMETERS linha
IF RECNO()>0
   @ linha,  1 SAY Registro
   @ linha,  9 SAY LEFT(Titulo,43)
   @ linha, 53 SAY LEFT(Proprieda,11)
   @ linha, 66 SAY Midia
   @ linha, 71 SAY IF (Emperstado,"Sim","N„o")
ENDIF
RETURN
*============================================================*
*=     Posiciona arquivo e inicializa a tela                =*
*============================================================*
FUNCTION LPgrp_Mtela
lintopo = 5
linfim  = 23
SET CURSOR off
SETCOLOR(cor1)
@  2, 0,24,79 BOX borda1
SETCOLOR(cor3)
@ 2, 0, 24, 79 BOX "ÉÍ»º¼ÍÈº "
@ 0, 0, 2 , 79 BOX "ÉÍ»º¹ÍÌº "
@ 2, 8 SAY "Ë"+replicate('Í',43)+"Ë"+replicate('Í',11)+"Ë"+replicate('Í',05)+"Ë"+replicate('Í',08)
@ 4,  0 SAY 'Ì'
@ 4 , 79 SAY '¹'
@ 3, 2 SAY "C¢digo"+"º"+space(18)+"Titulo"+space(19)+"º"+"Propriedade"+"º"+"Midia"+"º"+PADR(ALLTRIM("Empresto"),08)
@ 4, 1 SAY replicate('Í',7)+"Î"+replicate('Í',43)+"Î"+replicate('Í',11)+"Î"+replicate('Í',05)+"Î"+replicate('Í',08)
FOR lin = 5 TO 23
@ lin, 8 SAY "º"+space(43)+"º"+space(11)+"º"+space(05)+"º"
NEXT
@ 24, 1 SAY replicate('Í',7)+"Ê"+replicate('Í',43)+"Ê"+replicate('Í',11)+"Ê"+replicate('Í',05)+"Ê"+replicate('Í',08)
qtlintela = linfim - lintopo +1
curlin = lintopo
SETCOLOR(cor6)
@  1, 1 say padc("Cadastro de CD's - LP's - Fitas Cassete & Mini Disc",78)
RETURN
*============================================================*
FUNCTION LPgrp_Inicializa
PARAMETERS reggoto
GOTO BOTT
ultreg = recno()
GOTO TOP
prireg = recno()
LPgrp_Mtela(.t.)
IF reggoto > 0
   GOTO reggoto
ENDIF
LPgrp_tcheia(.t.)
LPgrp_brilho()
teclax = ''
teclan = 0
RETURN
*============================================================*
*=     Localiza uma string no nome do produto               =*
*============================================================*
FUNCTION LPgrp_Localiza

LOCAL   GetList := {}

salvareg=RECNO()
wslvtela=SAVESCREEN(9,1,11,78)
SETCOLOR(cor10)
@  9,13 CLEAR TO 11,66
@  9,13 TO 11,66 DOUBLE
@ 10,15 SAY 'Informe o nome a selecionar: '
snome=LEFT(snome+SPACE(21),21)
@ 10,44 GET snome PICTURE "@!K"
SET CURSOR on
READ
RESTSCREEN(9,1,11,78,wslvtela)
SET CURSOR off
IF LASTKEY()<>27
   IF snome = SPACE(21)
      DBSETFILTER()
      LPgrp_Inicializa(RECNO())
   ELSE
      snome=TRIM(snome)
      DBSETFILTER( { || AT(UPPER(snome), UPPER(Titulo+Conjunto)) > 0 } )
      GOTO TOP
      IF AT(UPPER(snome), UPPER(Titulo+Conjunto)) = 0
         DBSETFILTER()
         Mensagem(12,'Nome nao localizado para selecionar',cor4)
         GOTO salvareg
         RETURN
      ENDIF
   ENDIF
   LPgrp_Inicializa(RECNO())
ENDIF
RETURN
*
FUNCTION LPgrp_Index
xi = 1
IF xi < 1 .OR. xi > 1
   xi = 1
ENDIF
DBSETORDER(xi)
LPgrp_Inicializa(0)
RETURN
*===========================================================================*
FUNCTION LPgrp_valor()
TELV:=SAVESCREEN(10,08,12,61)

setcolor(_cor4)

set filter to

goto top

sum valor to temp

@ 10,16 clear to 12,61
@ 10,16 to 12,61 double
@ 11,18 say "O valor total da cole‡„o e R$"
@ 11,col() say temp pict "@E999.999.999.999.99"

inkey(0)

RESTSCREEN(10,08,12,61,TELV)

LPgrp_Inicializa(0)
*===========================================================================*
FUNCTION LPgrp_inf()

if midia = "CD"
   do inf_cd
endif

if midia = "LP"
   do inf_lp
endif

if midia = "K7"
   do inf_k7
endif

if midia = "MD"
   do inf_md
endif
*****************************************************************************
FUNCTION LPgrp_Exclui()

IF Pergunta("Voce deseje excluir este registro? (S/N)",Cor4)<>"S"
   RETURN
ENDIF

CODIGO = REGISTRO

SELECT MUSICA   
SET FILTER TO COD_MUSICA = CODIGO
GOTO TOP
DO WHILE COD_MUSICA = CODIGO .AND. EOF() = .F.
   DELETE
   SKIP 1
ENDDO

DBCOMMIT()

SELECT CADASTRO
DELETE
SKIP -1
LPgrp_Inicializa(recno())
*****************************************************************************
FUNCTION LPpr_Imprime()
temp1:=registro
do imprime
*****************************************************************************
FUNCTION LPpr_Net1()
SET FILTER TO PROPRIEDA = "BOM P/ COMPRAR"
GOTO TOP
LPgrp_Inicializa(recno())
******************************************************************************
FUNCTION LPpr_Net()
set filter to emprestado = .t.
goto top
LPgrp_Inicializa(recno())
*****************************************************************************
FUNCTION Arquivos()
do arquivo
*****************************************************************************
FUNCTION TIPO_MIDIA
PARAMETERS Linha, Coluna, Moeda, Cor
PRIVATE Linha, Coluna, Moeda, Cor, slvcor
slvcor=SETCOLOR()
DO CASE
   CASE VMIDIA == "CD"
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "CD - Compact Disc          "
   CASE VMIDIA == "MD"
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "MD - Mini Disc             "
   CASE VMIDIA == "LP"
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "LP - Long Player           "
   CASE VMIDIA == "K7"                      
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "K7 - Fita Cassete          "
   CASE VMIDIA == "EQ"
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "EQ - Equipamento eletronico"
   CASE VMIDIA == "SE"
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "SE - Servi‡o de gravacao   "
   CASE VMIDIA == "VH"
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "VH - Fita de video VHS     "
   OTHERWISE
      @ Linha, Coluna SAY "                           "
      Mensagem(6,'Valido "CD" / "EQ" / "K7" / "LP" / "MD" / "SE" / "VH"')
      RETURN(.F.)
ENDCASE
SETCOLOR(slvcor)
RETURN(.T.)
*****************************************************************************
FUNCTION TIPO_ROTACAO
PARAMETERS Linha, Coluna, Moeda, Cor
PRIVATE Linha, Coluna, Moeda, Cor, slvcor
slvcor=SETCOLOR()
DO CASE
   CASE VROTACAO == "16"
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "16 RPM"
   CASE VROTACAO == "33"
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "33 1/3 RPM"
   CASE VROTACAO == "45"
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "45 RPM"
   CASE VROTACAO == "78"
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "78 RPM"
   OTHERWISE
      Mensagem(6,'Valido "16" / "33" / "45" / "78"')
      RETURN(.F.)
ENDCASE
SETCOLOR(slvcor)
RETURN(.T.)
*****************************************************************************
FUNCTION TIPO_SOM
PARAMETERS Linha, Coluna, Moeda, Cor
PRIVATE Linha, Coluna, Moeda, Cor, slvcor
slvcor=SETCOLOR()
DO CASE
   CASE VSOM == "STEREO"
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "Grava‡„o Estereofonica"
   CASE VSOM == "MONO  "
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "Grava‡„o Monofonica   "
   OTHERWISE
      Mensagem(6,'Valido "Stereo" / "Mono"')
      RETURN(.F.)
ENDCASE
SETCOLOR(slvcor)
RETURN(.T.)
*****************************************************************************
FUNCTION TIPO_FITA
PARAMETERS Linha, Coluna, Moeda, Cor
PRIVATE Linha, Coluna, Moeda, Cor, slvcor
slvcor=SETCOLOR()
DO CASE
   CASE VFITA == "NORMAL"
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "Fita Normal (Tipo I)   "
   CASE VFITA == "CROMO "
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "Fita de Cromo (Tipo II)"
   CASE VFITA == "METAL "
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "Fita de Metal (Tipo IV)"
   OTHERWISE
      Mensagem(6,'Valido "Normal / Cromo / Metal"')
      RETURN(.F.)
ENDCASE
SETCOLOR(slvcor)
RETURN(.T.)
*****************************************************************************
FUNCTION TIPO_GRAV
PARAMETERS Linha, Coluna, Moeda, Cor
PRIVATE Linha, Coluna, Moeda, Cor, slvcor
slvcor=SETCOLOR()
DO CASE
   CASE VGRAV == "AAD"
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "AAD - Analogico / Analogico / Digital"
   CASE VGRAV == "ADD"
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "AAD - Analogico / Digital / Digital  "
   CASE VGRAV == "DDD"                      
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "DDD - Digital / Digital / Digital    "
   CASE VGRAV == "   "                      
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "                                     "
   OTHERWISE
      @ Linha, Coluna SAY ""
      Mensagem(6,'Valido "AAD" / "ADD" / "DDD"')
      RETURN(.F.)
ENDCASE
SETCOLOR(slvcor)
RETURN(.T.)
*****************************************************************************
FUNCTION MUSICA_F

TEMP = TITULO
TEMP1 = REGISTRO
VCONJUNTO = CONJUNTO

do musica
*****************************************************************************
FUNCTION MENU_DBERR( nomeDB )
Mensagem(6,"ERRO NA ABERTURA DO ARQUIVO "+nomeDB, Cor4)
QUIT
RETURN
*****************************************************************************
FUNCTION F_Comenta
PRIVATE W3SLVTELA, W3SLVCOR
W3SLVTELA = SAVESCREEN(0,0,24,79)
W3SLVCOR=SETCOLOR()
SET SCOREBOARD off
SET CONFIRM off
SET CURSOR  on
setcolor(cor3)
@ 4, 15, 20, 63 BOX "ÉÍ»º¼ÍÈº "
@ 6, 15 SAY 'Ì'
@ 6, 63 SAY '¹'
@ 18, 15 SAY 'Ì'
@ 18, 63 SAY '¹'
@ 5, 34 SAY "Comentarios"
@ 6, 16 SAY replicate('Í',47)
@ 18, 16 SAY replicate('Í',47)
@ 19, 26 SAY "ESC=Cancela    Ctrl+W=Salva"
setcolor("N/W,W+/N")
wcomentario = comentario
wcomentario = MEMOEDIT(comentario,7,16,17,62,.T.)
IF LASTKEY() <> 27
   replace comentario with wcomentario
ENDIF
SET CURSOR off
RESTSCREEN(0,0,24,79,W3SLVTELA)
SETCOLOR(W3SLVCOR)
RETURN
******************************************************************************
FUNCTION NOME_ALFA( CONTEUDO, nCAMPO )
IF LEN(ALLTRIM(CONTEUDO)) < 2
   Mensagem(8,"'"+nCAMPO+"' -> Preenchimento Obrigatorio", Cor4)
   RETURN(.F.)
ENDIF
RETURN(.T.)
******************************************************************************
FUNCTION TIPO_TAMANHO
PARAMETERS Linha, Coluna, Moeda, Cor
PRIVATE Linha, Coluna, Moeda, Cor, slvcor
slvcor=SETCOLOR()
DO CASE
   CASE VTAMANHO == "07"
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "07"
   CASE VTAMANHO == "10"
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "10"
   CASE VTAMANHO == "12"
      SETCOLOR(Cor)
      @ Linha, Coluna SAY "12"
   OTHERWISE
      Mensagem(6,'Valido "07" / "10" / "12"')
      RETURN(.F.)
ENDCASE
SETCOLOR(slvcor)
RETURN(.T.)
*****************************************************************************
