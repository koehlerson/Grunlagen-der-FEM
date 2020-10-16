c$Id: pinput.f,v 1.1 2000/08/24 20:42:44 rlt Exp $
      logical function pinput(d,nn)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Input routine for real data.: returns true on error

c      Inputs:
c         nn     - Number of data items to extract from input string
c                  N.B. Input performed by this function

c      Outputs:
c         d(*)   - Values of data input
c         pinput - Flag, returns true if error occurs during input
c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      character tl*15
      logical   tinput
      integer   nn
      real*8    d(nn)

      save

c     Use routine TINPUT to perform the inputs

      pinput = tinput(tl,0,d,nn)

      end
