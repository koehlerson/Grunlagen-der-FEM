c$Id: pmove.f,v 1.1 2000/08/24 20:42:44 rlt Exp $
      subroutine pmove(a,b,nn)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Move real array a into b

c      Inputs:
c         a(*)      - Array to move
c         nn        - Length of array to move

c      Outputs:
c         b(*)      - Moved array
c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      integer   n,nn
      real*8    a(nn),b(nn)

      save

c     Move a-array into b-array

      do n = 1,nn
        b(n) = a(n)
      end do

      end
