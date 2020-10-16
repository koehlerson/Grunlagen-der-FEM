c$Id: pzerol.f,v 1.1 2000/08/24 20:49:58 rlt Exp $
      subroutine pzerol(fl,val,nn)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Set an array to logical value = val

c      Inputs:
c         val       - Logical value: true or false
c         nn        - Length of array to set

c      Outputs:
c         fl(*)     - Array set to logical state val
c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      integer   n,nn
      logical   fl(nn),val

      save

      do n = 1,nn
        fl(n) = val
      end do

      end
