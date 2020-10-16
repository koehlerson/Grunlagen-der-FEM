c$Id: piden.f,v 1.1 2000/08/24 20:42:44 rlt Exp $
      subroutine piden(d,ns,ne)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Sets array to identity (1.0)

c      Inputs:
c         ns      - First entry to set
c         ne      - Last  entry to set

c      Outputs:

c         d(*)    - Array set to unity
c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      integer   n,ns,ne
      real*8    d(*)

      save

      do n = ns,ne
        d(n) = 1.0d0
      end do

      end
