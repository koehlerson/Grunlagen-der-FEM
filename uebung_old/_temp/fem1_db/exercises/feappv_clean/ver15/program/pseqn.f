c$Id: pseqn.f,v 1.1 2000/08/24 20:42:44 rlt Exp $
      subroutine pseqn(ip,numnp)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Set sequential numbers to integer vector

c      Inputs:
c         numnp  - Number nodes in mesh

c      Outputs:
c         ip(*)  - Equation numbers
c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      integer   n, numnp
      integer   ip(*)

      save

      do n = 1,numnp
        ip(n) = n
      end do

      end
