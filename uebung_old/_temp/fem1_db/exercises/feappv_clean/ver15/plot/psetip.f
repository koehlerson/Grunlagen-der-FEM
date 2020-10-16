c$Id: psetip.f,v 1.1 2000/08/24 20:49:58 rlt Exp $
      subroutine psetip(ip,numel)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Set integer array to its position value for sorting
c               elements by z-sort for hidden surface plots

c      Inputs:
c         numel    - Number of elements in mesh

c      Outputs:
c         ip(*)    - Integer array with positions set
c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      integer   n, numel
      integer   ip(numel)

      save

      do n = 1,numel
        ip(n) = n
      end do

      end
