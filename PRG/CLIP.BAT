@echo off
clipper cadastro /b /r:neto /l
clipper inclui /b /r:neto /l
clipper altera /b /r:neto /l
clipper inf_mus /b /r:neto /l
clipper informe /b /r:neto /l
clipper devolve /b /r:neto /l
clipper nome /b /r:neto /l
clipper ritmo /b /r:neto /l
clipper empresto /b /r:neto /l
clipper registro /b /r:neto /l

rem if not errorlevel 1 rtlink file cadastro,informe,devolve,nome,inf_mus,ritmo,empresto,registro,inclui,altera,ntxpor,msg

if not errorlevel 1 rtlink file cadastro,informe,devolve,nome,inf_mus,ritmo,empresto,registro,inclui,altera
if exist inclui.obj del inclui.obj
if exist altera.obj del altera.obj
if exist inf_mus.obj del inf_mus.obj
if exist nome.obj del nome.obj
if exist devolve.obj del devolve.obj
if exist cadastro.obj del cadastro.obj
if exist informe.obj del informe.obj
if exist musica.obj del musica.obj
if exist music.obj del music.obj
if exist ritmo.obj del ritmo.obj
if exist empresto.obj del empresto.obj
if exist registro.obj del registro.obj

if exist cadastro\prg\cadastro.exe move cadastro\prg\cadastro.exe cadastro\cadastro.exe

cd..
