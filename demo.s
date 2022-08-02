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

wait1:
       move.w (pos_low),d7
       cmp.b  $dff006,d7
       bne    wait1
       move.w #$fff,$dff180
       add    d6,d7
       move.w d7,(pos_low)
wait2:
       move.w (pos_high),d7
       cmp.b  $dff006,d7
       bne    wait2
       move.w #$000,$dff180
       add    d6,d7
       move.w d7,(pos_high)

       cmp    #$f0,d7
       blo    down
       neg    d6
down
       cmp    #$40,d7
       bhi    up 
       neg    d6
up
       btst #6,$bfe001
       bne  waitframe
       rts

pos_low    dc.w   $ac
pos_high   dc.w   $ad