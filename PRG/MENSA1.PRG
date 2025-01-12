FUNCTION Mensage
PARAMETERS Lm, Msg_Texto, M_cor
LOCAL wslvtela, slvcor, slvcur, t_msg, col_msg
IF PCOUNT() <> 3
   M_cor = "W/R"
ENDIF
slvcor=SETCOLOR()
slvcur=SETCURSOR()
t_msg=LEN(Msg_Texto)
col_msg=INT((80-t_msg)/2)
SETCOLOR(M_cor)
@ Lm,col_msg-2 CLEAR TO lm+2,col_msg+t_msg+1
@ Lm,col_msg-2 TO Lm+2,col_msg+t_msg+1 DOUBLE
@ Lm+1,col_msg SAY Msg_Texto
SETCURSOR(0)
TONE(200,1)
TONE(300,1)
TONE(400,1)
