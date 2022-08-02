;------------------------------
; Example inspired by Photon's Tutorial:
;  https://www.youtube.com/user/ScoopexUs
;
;---------- Includes ----------
              INCDIR      "include"
              INCLUDE     "startup.s"
;---------- Const ----------

START:
init:
       move.w #$ac,d7              ;start y position
       move.w #1,d6                ; y add
waitframe:
       cmp.b  #$ff,$dff006
       bne    waitframe
       add    d6,d7            
       cmp.b  #$f0,d7
       blo    bottom
       neg    d6
bottom:
       cmp.b #$40,d7
       bhi   wait1
       neg   d6
wait1:
       cmp.b  $dff006,d7
       bne    wait1
       move.w #$fff,$dff180
   ;    add    #1,d7
wait2:
     
       cmp.b  $dff006,d7
       bne    wait2
       move.w #$000,$dff180

       btst #6,$bfe001
       bne  waitframe
       rts

pos    dc.w   $ac