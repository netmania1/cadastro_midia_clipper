IF .NOT. FILE ("CADASTRO.DBF"); MENU_DBERR("CADASTRO.DBF"); ENDIF
   USE CADASTRO SHARED NEW
   IF !NETERR()
      *
   ELSE
      cls
      Mensagem(12,'Programa em execu‡„o!')
      quit
   ENDIF
   
   IF .NOT. FILE ("EMPRESTO.DBF"); MENU_DBERR("EMPRESTO.DBF"); ENDIF
      USE EMPRESTO SHARED NEW 
      IF !NETERR()
         *
      ELSE
         cls
         Mensagem(12,'Programa em execu‡„o!')
         quit
      ENDIF
      
      IF .NOT. FILE ("DEVOLVE.DBF"); MENU_DBERR("DEVOLVE.DBF"); ENDIF
         USE DEVOLVE SHARED NEW
         IF !NETERR()
            *
         ELSE
            cls
            Mensagem(12,'Programa em execu‡„o!')
            quit
         ENDIF
         
         IF .NOT. FILE ("NOME.DBF"); MENU_DBERR("NOME.DBF"); ENDIF
            USE NOME SHARED NEW 
            IF !NETERR()
               *
            ELSE
               cls
               Mensagem(12,'Programa em execu‡„o!')
               quit
            ENDIF
            
            IF .NOT. FILE ("MUSICA.DBF"); MENU_DBERR("MUSICA.DBF"); ENDIF
               IF .NOT. FILE ("MUSICA.DBT"); MENU_DBERR("MUSICA.DBT"); ENDIF
                  USE MUSICA SHARED NEW 
                  IF !NETERR()
                     *
                  ELSE
                     Mensagem(12,'Programa em execu‡„o!')
                     quit
                  ENDIF
                  
                  IF .NOT. FILE ("RITMO.DBF"); MENU_DBERR("RITMO.DBF"); ENDIF
                     USE RITMO SHARED NEW 
                     IF !NETERR()
                        *
                     ELSE
                        Mensagem(12,'Programa em execu‡„o!')
                        quit
                     ENDIF
                     
                     CLOSE DATABASE
                     *==================================================*
                     SELECT 1
                     IF FILE("Cadastro.NTX") = .T.
                        USE Cadastro INDEX Cadastro ALIAS Cadastro new
                     ELSE
                        USE Cadastro ALIAS Cadastro new
                        Mensage(12,'Criando o arquivo "Cadastro.ntx", por favor aguarde!')
                        DO WHILE .NOT. EOF()
                           REPLACE REGISTRO WITH RECNO()
                           REPLACE COD_MUSICA WITH RECNO()
                           SKIP +1
                        ENDDO
                        INDEX ON titulo + proprieda + midia + str(registro) to Cadastro
                     ENDIF
                     *==================================================*
                     SELECT 2
                     IF FILE("Musicaf.NTX") = .T. .AND. FILE("Musicam.NTX") = .T.
                        USE Musica INDEX Musicaf, Musicam ALIAS Musica new
                     ELSE
                        USE Musica ALIAS Musica new
                        DO WHILE .NOT. EOF()
                           REPLACE REGISTRO WITH RECNO()
                           SKIP +1
                        ENDDO
                        Mensage(12,'Criando o arquivo "Musicaf.ntx", por favor aguarde!')
                        INDEX ON faixa + cod_musica to Musicaf
                        Mensage(12,'Criando o arquivo "Musicam.ntx", por favor aguarde!')
                        INDEX ON musica + str(cod_musica) to Musicam
                     ENDIF
                     *==================================================*
                     IF FILE("Empresto.NTX") = .T.
                        USE Empresto INDEX Empresto ALIAS Empresto new
                        DO WHILE .NOT. EOF()
                           IF SAIU = CTOD(' / /    ')
                              REPLACE DIAS WITH 9999999999
                           ELSE
                              REPLACE DIAS WITH DATE() - SAIU
                           ENDIF
                           SKIP+1
                        ENDDO
                     ELSE
                        USE Empresto ALIAS Empresto new
                        Mensage(12,'Criando o arquivo "Empresto.ntx", por favor aguarde!')
*                       PACK
                        DO WHILE .NOT. EOF()
                           REPLACE REGISTRO WITH RECNO()
                           IF SAIU = CTOD(' / /    ')
                              REPLACE DIAS WITH 9999999999
                           ELSE
                              REPLACE DIAS WITH DATE() - SAIU
                           ENDIF
                           SKIP+1
                        ENDDO
                        INDEX ON nome + titulo + midia + dtos(saiu) to Empresto
                     ENDIF
                     *==================================================*
                     SELECT 4
                     IF FILE("Devolve.NTX") = .T.
                        USE Devolve INDEX Devolve ALIAS Devolve new
                     ELSE
                        USE Devolve ALIAS Devolve new
                        Mensage(12,'Criando o arquivo "Devolve.ntx", por favor aguarde!')
                        DO WHILE .NOT. EOF()
                           REPLACE REGISTRO WITH RECNO()
                           SKIP +1
                        ENDDO
                        INDEX ON dtos(retornou) + titulo + str(registro) + nome + midia to devolve
                     ENDIF
                     *==================================================*
                     SELECT 5
                     IF FILE("Nome.NTX") = .T.
                        USE Nome INDEX Nome ALIAS Nome new
                     ELSE
                        USE Nome ALIAS Nome new
                        Mensage(12,'Criando o arquivo "Nome.ntx", por favor aguarde!')
                        DO WHILE .NOT. EOF()
                           REPLACE REGISTRO WITH RECNO()
                           SKIP +1
                        ENDDO
                        INDEX ON midia + nome to nome
                     ENDIF
                     *==================================================*
                     SELECT 6
                     IF FILE("Ritmoc.NTX") = .T. .AND. FILE("Ritmot.NTX") = .T.
                        USE Ritmo INDEX Ritmoc, Ritmot ALIAS Ritmo new
                     ELSE
                        USE Ritmo ALIAS Ritmo new
                        Mensage(12,'Criando o arquivo "Ritmoc.ntx", por favor aguarde!')
                        INDEX ON cod_ritmo to Ritmoc
                        Mensage(12,'Criando o arquivo "Ritmot.ntx", por favor aguarde!')
                        INDEX ON ritmo + str(cod_ritmo) to ritmot
                     ENDIF
                     *==================================================*
                     RETURN
