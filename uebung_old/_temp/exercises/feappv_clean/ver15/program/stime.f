c$Id: stime.f,v 1.1 2000/08/24 20:42:44 rlt Exp $
      subroutine stime()

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Initialize time clock

c      Inputs:
c         none

c      Outputs:
c         none      - Output is tim0 in common etime1
c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      include  'etime1.h'

      real*4    etime, tt(2)

      save

      tim0 = 0.0d0
      tim0 = etime(tt)
      tim0 = tt(1)

      end
