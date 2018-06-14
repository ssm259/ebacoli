C        Generated by TAPENADE     (INRIA, Tropics team)
C  Tapenade 3.9 (r5096) - 24 Feb 2014 16:54
C
C  Differentiation of f in forward (tangent) mode:
C   variations   of useful results: fval
C   with respect to varying inputs: u uxx fval
C   RW status of diff variables: u:in uxx:in fval:in-out
      SUBROUTINE F_D_COL17(t,x,u,ud,ux,uxx,uxxd,fval,fvald,npde)
      IMPLICIT NONE
C-----------------------------------------------------------------------
C PURPOSE:
C       THIS SUBROUTINE DEFINES THE RIGHT HAND SIDE VECTOR OF THE 
C       NPDE DIMENSIONAL PARABOLIC PARTIAL DIFFERENTIAL EQUATION 
C                        UT = F(T, X, U, UX, UXX). 
C
C-----------------------------------------------------------------------
C SUBROUTINE PARAMETERS:
C INPUT:
      INTEGER npde
C                               THE NUMBER OF PDES IN THE SYSTEM.
C
      DOUBLE PRECISION t
C                               THE CURRENT TIME COORDINATE.
C
      DOUBLE PRECISION x
C                               THE CURRENT SPATIAL COORDINATE.
C
      DOUBLE PRECISION u(npde)
      DOUBLE PRECISION ud(npde)
C                               U(1:NPDE) IS THE APPROXIMATION OF THE
C                               SOLUTION AT THE POINT (T,X).
C
      DOUBLE PRECISION ux(npde)
C                               UX(1:NPDE) IS THE APPROXIMATION OF THE
C                               SPATIAL DERIVATIVE OF THE SOLUTION AT
C                               THE POINT (T,X).
C
      DOUBLE PRECISION uxx(npde)
      DOUBLE PRECISION uxxd(npde)
C                               UXX(1:NPDE) IS THE APPROXIMATION OF THE
C                               SECOND SPATIAL DERIVATIVE OF THE 
C                               SOLUTION AT THE POINT (T,X).
C
C OUTPUT:
      DOUBLE PRECISION fval(npde)
      DOUBLE PRECISION fvald(npde)
C                               FVAL(1:NPDE) IS THE RIGHT HAND SIDE
C                               VECTOR F(T, X, U, UX, UXX) OF THE PDE.
C working array:
      DOUBLE PRECISION consts(53), rates(19), algbrc(70)
      DOUBLE PRECISION constsd(53), ratesd(19), algbrcd(70)
C-----------------------------------------------------------------------
C Loop indices:
      INTEGER i
      INTRINSIC EXP
      INTRINSIC LOG
      REAL voi
      INTRINSIC INT
      DOUBLE PRECISION arg1
      DOUBLE PRECISION arg1d
      DOUBLE PRECISION pwx1
      DOUBLE PRECISION pwx1d
      DOUBLE PRECISION pwr1
      DOUBLE PRECISION pwr1d
      DOUBLE PRECISION arg2
      DOUBLE PRECISION arg2d
      DOUBLE PRECISION arg3
      DOUBLE PRECISION arg3d
      INTEGER ii1
C-----------------------------------------------------------------------
C
C     ASSIGN FVAL(1:NPDE) ACCORDING TO THE RIGHT HAND SIDE OF THE PDE 
C     IN TERMS OF U(1:NPDE), UX(1:NPDE), UXX(1:NPDE).
      do i = 1, 19
        ud(i)=0.D0
      enddo
      ud(17) = 1.D0
      constsd(1) = 0.D0
      consts(1) = 8314.472
      constsd(2) = 0.D0
      consts(2) = 310
      constsd(3) = 0.D0
      consts(3) = 96485.3415
      constsd(4) = 0.D0
      consts(4) = 0.185
      constsd(5) = 0.D0
      consts(5) = 0.016404
      constsd(6) = 0.D0
      consts(6) = 10
      constsd(7) = 0.D0
      consts(7) = 1000
      constsd(8) = 0.D0
      consts(8) = 1
      constsd(9) = 0.D0
      consts(9) = 52
      constsd(10) = 0.D0
      consts(10) = 0.03
      constsd(11) = 0.D0
      consts(11) = 5.4
      constsd(12) = 0.D0
      consts(12) = 140
      constsd(13) = 0.D0
      consts(13) = 2
      constsd(14) = 0.D0
      consts(14) = 5.405
      constsd(15) = 0.D0
      consts(15) = 0.153
      constsd(16) = 0.D0
      consts(16) = 0.392
      constsd(17) = 0.D0
      consts(17) = 14.838
      constsd(18) = 0.D0
      consts(18) = 0.00029
      constsd(19) = 0.D0
      consts(19) = 0.0000398
      constsd(20) = 0.D0
      consts(20) = 0.000592
      constsd(21) = 0.D0
      consts(21) = 0.294
      constsd(22) = 0.D0
      consts(22) = 2.724
      constsd(23) = 0.D0
      consts(23) = 1
      constsd(24) = 0.D0
      consts(24) = 40
      constsd(25) = 0.D0
      consts(25) = 1000
      constsd(26) = 0.D0
      consts(26) = 0.1
      constsd(27) = 0.D0
      consts(27) = 2.5
      constsd(28) = 0.D0
      consts(28) = 0.35
      constsd(29) = 0.D0
      consts(29) = 1.38
      constsd(30) = 0.D0
      consts(30) = 87.5
      constsd(31) = 0.D0
      consts(31) = 0.1238
      constsd(32) = 0.D0
      consts(32) = 0.0005
      constsd(33) = 0.D0
      consts(33) = 0.0146
      constsd(34) = 0.D0
      consts(34) = 0.15
      constsd(35) = 0.D0
      consts(35) = 0.045
      constsd(36) = 0.D0
      consts(36) = 0.06
      constsd(37) = 0.D0
      consts(37) = 0.005
      constsd(38) = 0.D0
      consts(38) = 1.5
      constsd(39) = 0.D0
      consts(39) = 2.5
      constsd(40) = 0.D0
      consts(40) = 1
      constsd(41) = 0.D0
      consts(41) = 0.102
      constsd(42) = 0.D0
      consts(42) = 0.0038
      constsd(43) = 0.D0
      consts(43) = 0.00025
      constsd(44) = 0.D0
      consts(44) = 0.00036
      constsd(45) = 0.D0
      consts(45) = 0.006375
      constsd(46) = 0.D0
      consts(46) = 0.2
      constsd(47) = 0.D0
      consts(47) = 0.001
      constsd(48) = 0.D0
      consts(48) = 10
      constsd(49) = 0.D0
      consts(49) = 0.3
      constsd(50) = 0.D0
      consts(50) = 0.4
      constsd(51) = 0.D0
      consts(51) = 0.00025
      constsd(52) = 0.D0
      consts(52) = 0.001094
      constsd(53) = 0.D0
      consts(53) = 0.00005468
C
C The following part is from the subroutine computeRates in the file TenTusscher.f
      DO ii1=1,70
        algbrcd(ii1) = 0.D0
      ENDDO
      algbrcd(8) = -(ud(1)*EXP((u(1)+20.0000)/7.00000)/7.00000/(1.00000+
     +  EXP((u(1)+20.0000)/7.00000))**2)
      algbrc(8) = 1.00000/(1.00000+EXP((u(1)+20.0000)/7.00000))
      arg1d = -(2.00000*(u(1)+27.0000)*ud(1)/225.000)
      arg1 = -((u(1)+27.0000)**2.00000/225.000)
      algbrcd(21) = 1102.50*arg1d*EXP(arg1) - (-(200.000*ud(1)*EXP((
     +  13.0000-u(1))/10.0000)/10.0000))/(1.00000+EXP((13.0000-u(1))/
     +  10.0000))**2 - 180.000*ud(1)*EXP((u(1)+30.0000)/10.0000)/10.0000
     +  /(1.00000+EXP((u(1)+30.0000)/10.0000))**2
      algbrc(21) = 1102.50*EXP(arg1) + 200.000/(1.00000+EXP((13.0000-u(1
     +  ))/10.0000)) + 180.000/(1.00000+EXP((u(1)+30.0000)/10.0000)) + 
     +  20.0000
      DO ii1=1,19
        ratesd(ii1) = 0.D0
      ENDDO
      ratesd(13) = ((algbrcd(8)-ud(13))*algbrc(21)-(algbrc(8)-u(13))*
     +  algbrcd(21))/algbrc(21)**2
      rates(13) = (algbrc(8)-u(13))/algbrc(21)
      algbrcd(9) = -(0.670000*ud(1)*EXP((u(1)+35.0000)/7.00000)/7.00000/
     +  (1.00000+EXP((u(1)+35.0000)/7.00000))**2)
      algbrc(9) = 0.670000/(1.00000+EXP((u(1)+35.0000)/7.00000)) + 
     +  0.330000
      arg1d = -(2.00000*(u(1)+27.0000)*ud(1)/240.000)
      arg1 = -((u(1)+27.0000)**2.00000/240.000)
      algbrcd(22) = 562.000*arg1d*EXP(arg1) - (-(31.0000*ud(1)*EXP((
     +  25.0000-u(1))/10.0000)/10.0000))/(1.00000+EXP((25.0000-u(1))/
     +  10.0000))**2 - 80.0000*ud(1)*EXP((u(1)+30.0000)/10.0000)/10.0000
     +  /(1.00000+EXP((u(1)+30.0000)/10.0000))**2
      algbrc(22) = 562.000*EXP(arg1) + 31.0000/(1.00000+EXP((25.0000-u(1
     +  ))/10.0000)) + 80.0000/(1.00000+EXP((u(1)+30.0000)/10.0000))
      ratesd(14) = ((algbrcd(9)-ud(14))*algbrc(22)-(algbrc(9)-u(14))*
     +  algbrcd(22))/algbrc(22)**2
      rates(14) = (algbrc(9)-u(14))/algbrc(22)
      algbrcd(10) = -(0.600000*2.00000*u(11)*ud(11)/0.0500000**2/(
     +  1.00000+(u(11)/0.0500000)**2.00000)**2)
      algbrc(10) = 0.600000/(1.00000+(u(11)/0.0500000)**2.00000) + 
     +  0.400000
      algbrcd(23) = -(80.0000*2.00000*u(11)*ud(11)/0.0500000**2/(1.00000
     +  +(u(11)/0.0500000)**2.00000)**2)
      algbrc(23) = 80.0000/(1.00000+(u(11)/0.0500000)**2.00000) + 
     +  2.00000
      ratesd(15) = ((algbrcd(10)-ud(15))*algbrc(23)-(algbrc(10)-u(15))*
     +  algbrcd(23))/algbrc(23)**2
      rates(15) = (algbrc(10)-u(15))/algbrc(23)
      algbrcd(11) = -(ud(1)*EXP((u(1)+20.0000)/5.00000)/5.00000/(1.00000
     +  +EXP((u(1)+20.0000)/5.00000))**2)
      algbrc(11) = 1.00000/(1.00000+EXP((u(1)+20.0000)/5.00000))
      arg1d = -(2.00000*(u(1)+45.0000)*ud(1)/320.000)
      arg1 = -((u(1)+45.0000)**2.00000/320.000)
      algbrcd(24) = 85.0000*arg1d*EXP(arg1) - ud(1)*EXP((u(1)-20.0000)/
     +  5.00000)/(1.00000+EXP((u(1)-20.0000)/5.00000))**2
      algbrc(24) = 85.0000*EXP(arg1) + 5.00000/(1.00000+EXP((u(1)-
     +  20.0000)/5.00000)) + 3.00000
      ratesd(16) = ((algbrcd(11)-ud(16))*algbrc(24)-(algbrc(11)-u(16))*
     +  algbrcd(24))/algbrc(24)**2
      rates(16) = (algbrc(11)-u(16))/algbrc(24)
      algbrcd(12) = -((-(ud(1)*EXP((20.0000-u(1))/6.00000)/6.00000))/(
     +  1.00000+EXP((20.0000-u(1))/6.00000))**2)
      algbrc(12) = 1.00000/(1.00000+EXP((20.0000-u(1))/6.00000))
      arg1d = -(2.00000*(u(1)+40.0000)*ud(1)/1800.00)
      arg1 = -((u(1)+40.0000)**2.00000/1800.00)
      algbrcd(25) = 9.50000*arg1d*EXP(arg1)
      algbrc(25) = 9.50000*EXP(arg1) + 0.800000
      ratesd(17) = ((algbrcd(12)-ud(17))*algbrc(25)-(algbrc(12)-u(17))*
     +  algbrcd(25))/algbrc(25)**2
      rates(17) = (algbrc(12)-u(17))/algbrc(25)
      algbrcd(1) = -((-(ud(1)*EXP((-26.0000-u(1))/7.00000)/7.00000))/(
     +  1.00000+EXP((-26.0000-u(1))/7.00000))**2)
      algbrc(1) = 1.00000/(1.00000+EXP((-26.0000-u(1))/7.00000))
      algbrcd(14) = -((-(450.000*ud(1)*EXP((-45.0000-u(1))/10.0000)/
     +  10.0000))/(1.00000+EXP((-45.0000-u(1))/10.0000))**2)
      algbrc(14) = 450.000/(1.00000+EXP((-45.0000-u(1))/10.0000))
      algbrcd(27) = -(6.00000*ud(1)*EXP((u(1)+30.0000)/11.5000)/11.5000/
     +  (1.00000+EXP((u(1)+30.0000)/11.5000))**2)
      algbrc(27) = 6.00000/(1.00000+EXP((u(1)+30.0000)/11.5000))
      algbrcd(35) = algbrcd(14)*algbrc(27) + algbrc(14)*algbrcd(27)
      algbrc(35) = 1.00000*algbrc(14)*algbrc(27)
      ratesd(5) = ((algbrcd(1)-ud(5))*algbrc(35)-(algbrc(1)-u(5))*
     +  algbrcd(35))/algbrc(35)**2
      rates(5) = (algbrc(1)-u(5))/algbrc(35)
      algbrcd(2) = -(ud(1)*EXP((u(1)+88.0000)/24.0000)/24.0000/(1.00000+
     +  EXP((u(1)+88.0000)/24.0000))**2)
      algbrc(2) = 1.00000/(1.00000+EXP((u(1)+88.0000)/24.0000))
      algbrcd(15) = -((-(3.00000*ud(1)*EXP((-60.0000-u(1))/20.0000)/
     +  20.0000))/(1.00000+EXP((-60.0000-u(1))/20.0000))**2)
      algbrc(15) = 3.00000/(1.00000+EXP((-60.0000-u(1))/20.0000))
      algbrcd(28) = -(1.12000*ud(1)*EXP((u(1)-60.0000)/20.0000)/20.0000/
     +  (1.00000+EXP((u(1)-60.0000)/20.0000))**2)
      algbrc(28) = 1.12000/(1.00000+EXP((u(1)-60.0000)/20.0000))
      algbrcd(36) = algbrcd(15)*algbrc(28) + algbrc(15)*algbrcd(28)
      algbrc(36) = 1.00000*algbrc(15)*algbrc(28)
      ratesd(6) = ((algbrcd(2)-ud(6))*algbrc(36)-(algbrc(2)-u(6))*
     +  algbrcd(36))/algbrc(36)**2
      rates(6) = (algbrc(2)-u(6))/algbrc(36)
      algbrcd(3) = -((-(ud(1)*EXP((-5.00000-u(1))/14.0000)/14.0000))/(
     +  1.00000+EXP((-5.00000-u(1))/14.0000))**2)
      algbrc(3) = 1.00000/(1.00000+EXP((-5.00000-u(1))/14.0000))
      pwx1d = -(ud(1)*EXP((5.00000-u(1))/6.00000)/6.00000)
      pwx1 = 1.00000 + EXP((5.00000-u(1))/6.00000)
      IF (pwx1 .GT. 0.0 .OR. (pwx1 .LT. 0.0 .AND. 1.0/2 .EQ. INT(1.0/2))
     +) THEN
        pwr1d = pwx1**(1.0/2-1)*pwx1d/2
      ELSE IF (pwx1 .EQ. 0.0 .AND. 1.0/2 .EQ. 1.0) THEN
        pwr1d = pwx1d
      ELSE
        pwr1d = 0.0
      END IF
      pwr1 = pwx1**(1.0/2)
      algbrcd(16) = -(1400.00*pwr1d/pwr1**2)
      algbrc(16) = 1400.00/pwr1
      algbrcd(29) = -(ud(1)*EXP((u(1)-35.0000)/15.0000)/15.0000/(1.00000
     +  +EXP((u(1)-35.0000)/15.0000))**2)
      algbrc(29) = 1.00000/(1.00000+EXP((u(1)-35.0000)/15.0000))
      algbrcd(37) = algbrcd(16)*algbrc(29) + algbrc(16)*algbrcd(29)
      algbrc(37) = 1.00000*algbrc(16)*algbrc(29) + 80.0000
      ratesd(7) = ((algbrcd(3)-ud(7))*algbrc(37)-(algbrc(3)-u(7))*
     +  algbrcd(37))/algbrc(37)**2
      rates(7) = (algbrc(3)-u(7))/algbrc(37)
      algbrcd(4) = -((-(2.00000*(1.00000+EXP((-56.8600-u(1))/9.03000))*
     +  ud(1)*EXP((-56.8600-u(1))/9.03000)/9.03000))/((1.00000+EXP((-
     +  56.8600-u(1))/9.03000))**2.00000)**2)
      algbrc(4) = 1.00000/(1.00000+EXP((-56.8600-u(1))/9.03000))**
     +  2.00000
      algbrcd(17) = -((-(ud(1)*EXP((-60.0000-u(1))/5.00000)/5.00000))/(
     +  1.00000+EXP((-60.0000-u(1))/5.00000))**2)
      algbrc(17) = 1.00000/(1.00000+EXP((-60.0000-u(1))/5.00000))
      algbrcd(30) = -(0.100000*ud(1)*EXP((u(1)+35.0000)/5.00000)/5.00000
     +  /(1.00000+EXP((u(1)+35.0000)/5.00000))**2) - 0.100000*ud(1)*EXP(
     +  (u(1)-50.0000)/200.000)/200.000/(1.00000+EXP((u(1)-50.0000)/
     +  200.000))**2
      algbrc(30) = 0.100000/(1.00000+EXP((u(1)+35.0000)/5.00000)) + 
     +  0.100000/(1.00000+EXP((u(1)-50.0000)/200.000))
      algbrcd(38) = algbrcd(17)*algbrc(30) + algbrc(17)*algbrcd(30)
      algbrc(38) = 1.00000*algbrc(17)*algbrc(30)
      ratesd(8) = ((algbrcd(4)-ud(8))*algbrc(38)-(algbrc(4)-u(8))*
     +  algbrcd(38))/algbrc(38)**2
      rates(8) = (algbrc(4)-u(8))/algbrc(38)
      algbrcd(5) = -(2.00000*(1.00000+EXP(u(1)+71.5500)/7.43000)*ud(1)*
     +  EXP(u(1)+71.5500)/7.43000/((1.00000+EXP(u(1)+71.5500)/7.43000)**
     +  2.00000)**2)
      algbrc(5) = 1.00000/(1.00000+EXP(u(1)+71.5500)/7.43000)**2.00000
      IF (u(1) .LT. -40.0000d0) THEN
        algbrcd(18) = -(0.0570000*ud(1)*EXP(-((u(1)+80.0000)/6.80000))/
     +    6.80000)
        algbrc(18) = 0.0570000*EXP(-((u(1)+80.0000)/6.80000))
      ELSE
        algbrcd(18) = 0.D0
        algbrc(18) = 0.00000d0
      END IF
      IF (u(1) .LT. -40.0000d0) THEN
        algbrcd(31) = 2.70000*0.0790000*ud(1)*EXP(0.0790000*u(1)) + 
     +    310000.*0.348500*ud(1)*EXP(0.348500*u(1))
        algbrc(31) = 2.70000*EXP(0.0790000*u(1)) + 310000.*EXP(0.348500*
     +    u(1))
      ELSE
        algbrcd(31) = -((-(0.770000*0.130000*ud(1)*EXP((u(1)+10.6600)/(-
     +    11.1000))/11.1000))/(0.130000*(1.00000+EXP((u(1)+10.6600)/(-
     +    11.1000))))**2)
        algbrc(31) = 0.770000/(0.130000*(1.00000+EXP((u(1)+10.6600)/(-
     +    11.1000))))
      END IF
      algbrcd(39) = -((algbrcd(18)+algbrcd(31))/(algbrc(18)+algbrc(31))
     +  **2)
      algbrc(39) = 1.00000/(algbrc(18)+algbrc(31))
      ratesd(9) = ((algbrcd(5)-ud(9))*algbrc(39)-(algbrc(5)-u(9))*
     +  algbrcd(39))/algbrc(39)**2
      rates(9) = (algbrc(5)-u(9))/algbrc(39)
      algbrcd(6) = -(2.00000*(1.00000+EXP(u(1)+71.5500)/7.43000)*ud(1)*
     +  EXP(u(1)+71.5500)/7.43000/((1.00000+EXP(u(1)+71.5500)/7.43000)**
     +  2.00000)**2)
      algbrc(6) = 1.00000/(1.00000+EXP(u(1)+71.5500)/7.43000)**2.00000
      IF (u(1) .LT. -40.0000d0) THEN
        algbrcd(19) = (((6.94800d-06*0.0439100*ud(1)*EXP(-(0.0439100*u(1
     +    )))-25428.0*0.244400*ud(1)*EXP(0.244400*u(1)))*(u(1)+37.7800)+
     +    (-(25428.0*EXP(0.244400*u(1)))-6.94800d-06*EXP(-(0.0439100*u(1
     +    ))))*ud(1))*(1.00000+EXP(0.311000*(u(1)+79.2300)))-(-(25428.0*
     +    EXP(0.244400*u(1)))-6.94800d-06*EXP(-(0.0439100*u(1))))*(u(1)+
     +    37.7800)*0.311000*ud(1)*EXP(0.311000*(u(1)+79.2300)))/(1.00000
     +    +EXP(0.311000*(u(1)+79.2300)))**2
        algbrc(19) = (-(25428.0*EXP(0.244400*u(1)))-6.94800d-06*EXP(-(
     +    0.0439100*u(1))))*(u(1)+37.7800)/1.00000/(1.00000+EXP(0.311000
     +    *(u(1)+79.2300)))
      ELSE
        algbrcd(19) = 0.D0
        algbrc(19) = 0.00000d0
      END IF
      IF (u(1) .LT. -40.0000d0) THEN
        algbrcd(32) = (0.0242400*EXP(-(0.0105200*u(1)))*0.137800*ud(1)*
     +    EXP(-(0.137800*(u(1)+40.1400)))-0.0242400*0.0105200*ud(1)*EXP(
     +    -(0.0105200*u(1)))*(1.00000+EXP(-(0.137800*(u(1)+40.1400)))))/
     +    (1.00000+EXP(-(0.137800*(u(1)+40.1400))))**2
        algbrc(32) = 0.0242400*EXP(-(0.0105200*u(1)))/(1.00000+EXP(-(
     +    0.137800*(u(1)+40.1400))))
      ELSE
        algbrcd(32) = (0.600000*0.0570000*ud(1)*EXP(0.0570000*u(1))*(
     +    1.00000+EXP(-(0.100000*(u(1)+32.0000))))+0.600000*EXP(
     +    0.0570000*u(1))*0.100000*ud(1)*EXP(-(0.100000*(u(1)+32.0000)))
     +    )/(1.00000+EXP(-(0.100000*(u(1)+32.0000))))**2
        algbrc(32) = 0.600000*EXP(0.0570000*u(1))/(1.00000+EXP(-(
     +    0.100000*(u(1)+32.0000))))
      END IF
      algbrcd(40) = -((algbrcd(19)+algbrcd(32))/(algbrc(19)+algbrc(32))
     +  **2)
      algbrc(40) = 1.00000/(algbrc(19)+algbrc(32))
      ratesd(10) = ((algbrcd(6)-ud(10))*algbrc(40)-(algbrc(6)-u(10))*
     +  algbrcd(40))/algbrc(40)**2
      rates(10) = (algbrc(6)-u(10))/algbrc(40)
      algbrcd(7) = -((-(ud(1)*EXP((-8.00000-u(1))/7.50000)/7.50000))/(
     +  1.00000+EXP((-8.00000-u(1))/7.50000))**2)
      algbrc(7) = 1.00000/(1.00000+EXP((-8.00000-u(1))/7.50000))
      algbrcd(20) = -((-(1.40000*ud(1)*EXP((-35.0000-u(1))/13.0000)/
     +  13.0000))/(1.00000+EXP((-35.0000-u(1))/13.0000))**2)
      algbrc(20) = 1.40000/(1.00000+EXP((-35.0000-u(1))/13.0000)) + 
     +  0.250000
      algbrcd(33) = -(1.40000*ud(1)*EXP((u(1)+5.00000)/5.00000)/5.00000/
     +  (1.00000+EXP((u(1)+5.00000)/5.00000))**2)
      algbrc(33) = 1.40000/(1.00000+EXP((u(1)+5.00000)/5.00000))
      algbrcd(41) = -((-(ud(1)*EXP((50.0000-u(1))/20.0000)/20.0000))/(
     +  1.00000+EXP((50.0000-u(1))/20.0000))**2)
      algbrc(41) = 1.00000/(1.00000+EXP((50.0000-u(1))/20.0000))
      algbrcd(43) = algbrcd(20)*algbrc(33) + algbrc(20)*algbrcd(33) + 
     +  algbrcd(41)
      algbrc(43) = 1.00000*algbrc(20)*algbrc(33) + algbrc(41)
      ratesd(12) = ((algbrcd(7)-ud(12))*algbrc(43)-(algbrc(7)-u(12))*
     +  algbrcd(43))/algbrc(43)**2
      rates(12) = (algbrc(7)-u(12))/algbrc(43)
      arg1d = (-(0.100000*consts(3)*ud(1)))/(consts(1)*consts(2))
      arg1 = (-(0.100000*u(1)*consts(3)))/(consts(1)*consts(2))
      arg2d = (-(consts(3)*ud(1)))/(consts(1)*consts(2))
      arg2 = (-(u(1)*consts(3)))/(consts(1)*consts(2))
      algbrcd(56) = ((consts(22)*consts(11)*ud(3)*(u(3)+consts(24))/(
     +  consts(11)+consts(23))-consts(22)*consts(11)*u(3)*ud(3)/(consts(
     +  11)+consts(23)))*(1.00000+0.124500*EXP(arg1)+0.0353000*EXP(arg2)
     +  )/(u(3)+consts(24))**2-consts(22)*consts(11)*u(3)*(0.124500*
     +  arg1d*EXP(arg1)+0.0353000*arg2d*EXP(arg2))/((consts(11)+consts(
     +  23))*(u(3)+consts(24))))/(1.00000+0.124500*EXP(arg1)+0.0353000*
     +  EXP(arg2))**2
      algbrc(56) = consts(22)*consts(11)/(consts(11)+consts(23))*u(3)/(u
     +  (3)+consts(24))/(1.00000+0.124500*EXP(arg1)+0.0353000*EXP(arg2))
      arg1d = -(consts(12)*ud(3)/u(3)**2)
      arg1 = consts(12)/u(3)
      algbrcd(26) = consts(1)*consts(2)*arg1d/(consts(3)*arg1)
      algbrc(26) = consts(1)*consts(2)/consts(3)*LOG(arg1)
      algbrcd(51) = consts(17)*(3.00000*u(8)**2.0*ud(8)*u(9)*u(10)*(u(1)
     +  -algbrc(26))+u(8)**3.00000*((ud(9)*u(10)+u(9)*ud(10))*(u(1)-
     +  algbrc(26))+u(9)*u(10)*(ud(1)-algbrcd(26))))
      algbrc(51) = consts(17)*u(8)**3.00000*u(9)*u(10)*(u(1)-algbrc(26))
      algbrcd(52) = consts(18)*(ud(1)-algbrcd(26))
      algbrc(52) = consts(18)*(u(1)-algbrc(26))
      arg1d = consts(28)*consts(3)*ud(1)/(consts(1)*consts(2))
      arg1 = consts(28)*u(1)*consts(3)/(consts(1)*consts(2))
      arg2d = (consts(28)-1.00000)*consts(3)*ud(1)/(consts(1)*consts(2))
      arg2 = (consts(28)-1.00000)*u(1)*consts(3)/(consts(1)*consts(2))
      arg3d = (consts(28)-1.00000)*consts(3)*ud(1)/(consts(1)*consts(2))
      arg3 = (consts(28)-1.00000)*u(1)*consts(3)/(consts(1)*consts(2))
      algbrcd(57) = (consts(25)*(consts(13)*(arg1d*EXP(arg1)*u(3)**
     +  3.00000+EXP(arg1)*3.00000*u(3)**2.0*ud(3))-consts(12)**3.00000*
     +  consts(27)*(arg2d*EXP(arg2)*u(4)+EXP(arg2)*ud(4)))*(consts(30)**
     +  3.00000+consts(12)**3.00000)*(consts(29)+consts(13))*(1.00000+
     +  consts(26)*EXP(arg3))-consts(25)*(EXP(arg1)*u(3)**3.00000*consts
     +  (13)-EXP(arg2)*consts(12)**3.00000*u(4)*consts(27))*(consts(30)
     +  **3.00000+consts(12)**3.00000)*(consts(29)+consts(13))*consts(26
     +  )*arg3d*EXP(arg3))/((consts(30)**3.00000+consts(12)**3.00000)*(
     +  consts(29)+consts(13))*(1.00000+consts(26)*EXP(arg3)))**2
      algbrc(57) = consts(25)*(EXP(arg1)*u(3)**3.00000*consts(13)-EXP(
     +  arg2)*consts(12)**3.00000*u(4)*consts(27))/((consts(30)**3.00000
     +  +consts(12)**3.00000)*(consts(29)+consts(13))*(1.00000+consts(26
     +  )*EXP(arg3)))
      ratesd(3) = -(consts(4)*(algbrcd(51)+algbrcd(52)+3.00000*algbrcd(
     +  56)+3.00000*algbrcd(57))/(consts(5)*consts(3)))
      rates(3) = (-(1.00000*(algbrc(51)+algbrc(52)+3.00000*algbrc(56)+
     +  3.00000*algbrc(57))))/(1.00000*consts(5)*consts(3))*consts(4)
      arg1d = -(consts(11)*ud(2)/u(2)**2)
      arg1 = consts(11)/u(2)
      algbrcd(34) = consts(1)*consts(2)*arg1d/(consts(3)*arg1)
      algbrc(34) = consts(1)*consts(2)/consts(3)*LOG(arg1)
      arg1d = 0.0600000*(ud(1)-algbrcd(34))
      arg1 = 0.0600000*(u(1)-algbrc(34)-200.000)
      algbrcd(45) = -(0.100000*arg1d*EXP(arg1)/(1.00000+EXP(arg1))**2)
      algbrc(45) = 0.100000/(1.00000+EXP(arg1))
      arg1d = 0.000200000*(ud(1)-algbrcd(34))
      arg1 = 0.000200000*(u(1)-algbrc(34)+100.000)
      arg2d = 0.100000*(ud(1)-algbrcd(34))
      arg2 = 0.100000*(u(1)-algbrc(34)-10.0000)
      arg3d = -(0.500000*(ud(1)-algbrcd(34)))
      arg3 = -(0.500000*(u(1)-algbrc(34)))
      algbrcd(46) = ((3.00000*arg1d*EXP(arg1)+arg2d*EXP(arg2))*(1.00000+
     +  EXP(arg3))-(3.00000*EXP(arg1)+EXP(arg2))*arg3d*EXP(arg3))/(
     +  1.00000+EXP(arg3))**2
      algbrc(46) = (3.00000*EXP(arg1)+EXP(arg2))/(1.00000+EXP(arg3))
      algbrcd(47) = (algbrcd(45)*(algbrc(45)+algbrc(46))-algbrc(45)*(
     +  algbrcd(45)+algbrcd(46)))/(algbrc(45)+algbrc(46))**2
      algbrc(47) = algbrc(45)/(algbrc(45)+algbrc(46))
      pwx1 = consts(11)/5.40000
      pwr1 = pwx1**(1.0/2)
      algbrcd(48) = consts(14)*pwr1*(algbrcd(47)*(u(1)-algbrc(34))+
     +  algbrc(47)*(ud(1)-algbrcd(34)))
      algbrc(48) = consts(14)*algbrc(47)*pwr1*(u(1)-algbrc(34))
      algbrcd(55) = consts(21)*((ud(17)*u(16)+u(17)*ud(16))*(u(1)-algbrc
     +  (34))+u(17)*u(16)*(ud(1)-algbrcd(34)))
      algbrc(55) = consts(21)*u(17)*u(16)*(u(1)-algbrc(34))
      pwx1 = consts(11)/5.40000
      pwr1 = pwx1**(1.0/2)
      algbrcd(49) = consts(15)*pwr1*((ud(5)*u(6)+u(5)*ud(6))*(u(1)-
     +  algbrc(34))+u(5)*u(6)*(ud(1)-algbrcd(34)))
      algbrc(49) = consts(15)*pwr1*u(5)*u(6)*(u(1)-algbrc(34))
      arg1d = -((consts(11)+consts(10)*consts(12))*(ud(2)+consts(10)*ud(
     +  3))/(u(2)+consts(10)*u(3))**2)
      arg1 = (consts(11)+consts(10)*consts(12))/(u(2)+consts(10)*u(3))
      algbrcd(42) = consts(1)*consts(2)*arg1d/(consts(3)*arg1)
      algbrc(42) = consts(1)*consts(2)/consts(3)*LOG(arg1)
      algbrcd(50) = consts(16)*(2.00000*u(7)*ud(7)*(u(1)-algbrc(42))+u(7
     +  )**2.00000*(ud(1)-algbrcd(42)))
      algbrc(50) = consts(16)*u(7)**2.00000*(u(1)-algbrc(42))
      arg1d = 2.00000*consts(3)*ud(1)/(consts(1)*consts(2))
      arg1 = 2.00000*(u(1)-15.0000)*consts(3)/(consts(1)*consts(2))
      arg2d = 2.00000*consts(3)*ud(1)/(consts(1)*consts(2))
      arg2 = 2.00000*(u(1)-15.0000)*consts(3)/(consts(1)*consts(2))
      algbrcd(53) = ((consts(19)*4.00000*consts(3)**2.00000*(((ud(12)*u(
     +  13)+u(12)*ud(13))*(u(1)-15.0000)+u(12)*u(13)*ud(1))*u(14)*u(15)+
     +  u(12)*u(13)*(u(1)-15.0000)*(ud(14)*u(15)+u(14)*ud(15)))*(
     +  0.250000*u(11)*EXP(arg1)-consts(13))/(consts(1)*consts(2))+
     +  consts(19)*u(12)*u(13)*u(14)*u(15)*4.00000*(u(1)-15.0000)*consts
     +  (3)**2.00000*0.250000*(ud(11)*EXP(arg1)+u(11)*arg1d*EXP(arg1))/(
     +  consts(1)*consts(2)))*(EXP(arg2)-1.00000)-consts(19)*u(12)*u(13)
     +  *u(14)*u(15)*4.00000*(u(1)-15.0000)*consts(3)**2.00000*(0.250000
     +  *u(11)*EXP(arg1)-consts(13))*arg2d*EXP(arg2)/(consts(1)*consts(2
     +  )))/(EXP(arg2)-1.00000)**2
      algbrc(53) = consts(19)*u(12)*u(13)*u(14)*u(15)*4.00000*(u(1)-
     +  15.0000)*consts(3)**2.00000/(consts(1)*consts(2))*(0.250000*u(11
     +  )*EXP(arg1)-consts(13))/(EXP(arg2)-1.00000)
      arg1d = -(consts(13)*ud(4)/u(4)**2)
      arg1 = consts(13)/u(4)
      algbrcd(44) = 0.500000*consts(1)*consts(2)*arg1d/(consts(3)*arg1)
      algbrc(44) = 0.500000*consts(1)*consts(2)/consts(3)*LOG(arg1)
      algbrcd(54) = consts(20)*(ud(1)-algbrcd(44))
      algbrc(54) = consts(20)*(u(1)-algbrc(44))
      algbrcd(59) = (consts(33)*(ud(1)-algbrcd(34))*(1.00000+EXP((
     +  25.0000-u(1))/5.98000))+consts(33)*(u(1)-algbrc(34))*ud(1)*EXP((
     +  25.0000-u(1))/5.98000)/5.98000)/(1.00000+EXP((25.0000-u(1))/
     +  5.98000))**2
      algbrc(59) = consts(33)*(u(1)-algbrc(34))/(1.00000+EXP((25.0000-u(
     +  1))/5.98000))
      algbrcd(58) = (consts(31)*ud(4)*(u(4)+consts(32))-consts(31)*u(4)*
     +  ud(4))/(u(4)+consts(32))**2
      algbrc(58) = consts(31)*u(4)/(u(4)+consts(32))
      IF (voi - INT(voi/consts(7))*consts(7) .GE. consts(6) .AND. voi - 
     +    INT(voi/consts(7))*consts(7) .LE. consts(6) + consts(8)) THEN
        algbrcd(13) = 0.D0
        algbrc(13) = -consts(9)
      ELSE
        algbrcd(13) = 0.D0
        algbrc(13) = 0.00000d0
      END IF
      ratesd(1) = -(algbrcd(48)+algbrcd(55)+algbrcd(49)+algbrcd(50)+
     +  algbrcd(53)+algbrcd(56)+algbrcd(51)+algbrcd(52)+algbrcd(57)+
     +  algbrcd(54)+algbrcd(59)+algbrcd(58)+algbrcd(13))
      rates(1) = (-(1.00000/1.00000))*(algbrc(48)+algbrc(55)+algbrc(49)+
     +  algbrc(50)+algbrc(53)+algbrc(56)+algbrc(51)+algbrc(52)+algbrc(57
     +  )+algbrc(54)+algbrc(59)+algbrc(58)+algbrc(13))
      ratesd(2) = -(consts(4)*(algbrcd(48)+algbrcd(55)+algbrcd(49)+
     +  algbrcd(50)+algbrcd(59)+algbrcd(13)-2.00000*algbrcd(56))/(consts
     +  (5)*consts(3)))
      rates(2) = (-(1.00000*(algbrc(48)+algbrc(55)+algbrc(49)+algbrc(50)
     +  +algbrc(59)+algbrc(13)-2.00000*algbrc(56))))/(1.00000*consts(5)*
     +  consts(3))*consts(4)
      algbrcd(60) = -((-(consts(45)*consts(43)**2.00000*2.00000*u(4)*ud(
     +  4)/(u(4)**2.00000)**2))/(1.00000+consts(43)**2.00000/u(4)**
     +  2.00000)**2)
      algbrc(60) = consts(45)/(1.00000+consts(43)**2.00000/u(4)**2.00000
     +  )
      algbrcd(61) = consts(44)*(ud(18)-ud(4))
      algbrc(61) = consts(44)*(u(18)-u(4))
      algbrcd(62) = consts(42)*(ud(11)-ud(4))
      algbrc(62) = consts(42)*(u(11)-u(4))
      algbrcd(64) = -((-(consts(46)*consts(47)*2.00000*(u(4)+consts(47))
     +  *ud(4)/((u(4)+consts(47))**2.00000)**2))/(1.00000+consts(46)*
     +  consts(47)/(u(4)+consts(47))**2.00000)**2)
      algbrc(64) = 1.00000/(1.00000+consts(46)*consts(47)/(u(4)+consts(
     +  47))**2.00000)
      ratesd(4) = algbrcd(64)*((algbrc(61)-algbrc(60))*consts(52)/consts
     +  (5)+algbrc(62)-1.00000*(algbrc(54)+algbrc(58)-2.00000*algbrc(57)
     +  )*consts(4)/(2.00000*1.00000*consts(5)*consts(3))) + algbrc(64)*
     +  (consts(52)*(algbrcd(61)-algbrcd(60))/consts(5)+algbrcd(62)-
     +  consts(4)*(algbrcd(54)+algbrcd(58)-2.00000*algbrcd(57))/(2.00000
     +  *1.00000*consts(5)*consts(3)))
      rates(4) = algbrc(64)*((algbrc(61)-algbrc(60))*consts(52)/consts(5
     +  )+algbrc(62)-1.00000*(algbrc(54)+algbrc(58)-2.00000*algbrc(57))*
     +  consts(4)/(2.00000*1.00000*consts(5)*consts(3)))
      algbrcd(63) = (-((consts(39)-consts(40))*2.00000*consts(38)**2*ud(
     +  18)/u(18)**3))/(1.00000+(consts(38)/u(18))**2.00000)**2
      algbrc(63) = consts(39) - (consts(39)-consts(40))/(1.00000+(consts
     +  (38)/u(18))**2.00000)
      algbrcd(66) = consts(35)*algbrcd(63)
      algbrc(66) = consts(35)*algbrc(63)
      ratesd(19) = -((algbrcd(66)*u(11)+algbrc(66)*ud(11))*u(19)) - 
     +  algbrc(66)*u(11)*ud(19) - consts(37)*ud(19)
      rates(19) = -(algbrc(66)*u(11)*u(19)) + consts(37)*(1.00000-u(19))
      algbrcd(65) = -(consts(34)*algbrcd(63)/algbrc(63)**2)
      algbrc(65) = consts(34)/algbrc(63)
      algbrcd(67) = (((algbrcd(65)*u(19)+algbrc(65)*ud(19))*u(11)**
     +  2.00000+algbrc(65)*u(19)*2.00000*u(11)*ud(11))*(consts(36)+
     +  algbrc(65)*u(11)**2.00000)-algbrc(65)*u(11)**2.00000*u(19)*(
     +  algbrcd(65)*u(11)**2.00000+algbrc(65)*2.00000*u(11)*ud(11)))/(
     +  consts(36)+algbrc(65)*u(11)**2.00000)**2
      algbrc(67) = algbrc(65)*u(11)**2.00000*u(19)/(consts(36)+algbrc(65
     +  )*u(11)**2.00000)
      algbrcd(68) = consts(41)*(algbrcd(67)*(u(18)-u(11))+algbrc(67)*(ud
     +  (18)-ud(11)))
      algbrc(68) = consts(41)*algbrc(67)*(u(18)-u(11))
      algbrcd(69) = -((-(consts(48)*consts(49)*2.00000*(u(18)+consts(49)
     +  )*ud(18)/((u(18)+consts(49))**2.00000)**2))/(1.00000+consts(48)*
     +  consts(49)/(u(18)+consts(49))**2.00000)**2)
      algbrc(69) = 1.00000/(1.00000+consts(48)*consts(49)/(u(18)+consts(
     +  49))**2.00000)
      ratesd(18) = algbrcd(69)*(algbrc(60)-(algbrc(68)+algbrc(61))) + 
     +  algbrc(69)*(algbrcd(60)-algbrcd(68)-algbrcd(61))
      rates(18) = algbrc(69)*(algbrc(60)-(algbrc(68)+algbrc(61)))
      algbrcd(70) = -((-(consts(50)*consts(51)*2.00000*(u(11)+consts(51)
     +  )*ud(11)/((u(11)+consts(51))**2.00000)**2))/(1.00000+consts(50)*
     +  consts(51)/(u(11)+consts(51))**2.00000)**2)
      algbrc(70) = 1.00000/(1.00000+consts(50)*consts(51)/(u(11)+consts(
     +  51))**2.00000)
      ratesd(11) = algbrcd(70)*((-(1.00000*algbrc(53)*consts(4)))/(
     +  2.00000*1.00000*consts(53)*consts(3))+algbrc(68)*consts(52)/
     +  consts(53)-algbrc(62)*consts(5)/consts(53)) + algbrc(70)*((-(
     +  consts(4)*algbrcd(53)))/(2.00000*1.00000*consts(53)*consts(3))+
     +  consts(52)*algbrcd(68)/consts(53)-consts(5)*algbrcd(62)/consts(
     +  53))
      rates(11) = algbrc(70)*((-(1.00000*algbrc(53)*consts(4)))/(2.00000
     +  *1.00000*consts(53)*consts(3))+algbrc(68)*consts(52)/consts(53)-
     +  algbrc(62)*consts(5)/consts(53))
C
C
C
      fvald(1) = 1.75d0*uxxd(1)/1400.0d0 + ratesd(1)
      fval(1) = 1.75d0/1400.0d0*uxx(1) + rates(1)
      fvald(2) = ratesd(2)
      fval(2) = rates(2)
      fvald(3) = ratesd(3)
      fval(3) = rates(3)
      fvald(4) = ratesd(4)
      fval(4) = rates(4)
      fvald(5) = ratesd(5)
      fval(5) = rates(5)
      fvald(6) = ratesd(6)
      fval(6) = rates(6)
      fvald(7) = ratesd(7)
      fval(7) = rates(7)
      fvald(8) = ratesd(8)
      fval(8) = rates(8)
      fvald(9) = ratesd(9)
      fval(9) = rates(9)
      fvald(10) = ratesd(10)
      fval(10) = rates(10)
      fvald(11) = ratesd(11)
      fval(11) = rates(11)
      fvald(12) = ratesd(12)
      fval(12) = rates(12)
      fvald(13) = ratesd(13)
      fval(13) = rates(13)
      fvald(14) = ratesd(14)
      fval(14) = rates(14)
      fvald(15) = ratesd(15)
      fval(15) = rates(15)
      fvald(16) = ratesd(16)
      fval(16) = rates(16)
      fvald(17) = ratesd(17)
      fval(17) = rates(17)
      fvald(18) = ratesd(18)
      fval(18) = rates(18)
      fvald(19) = ratesd(19)
      fval(19) = rates(19)
      RETURN
      END
