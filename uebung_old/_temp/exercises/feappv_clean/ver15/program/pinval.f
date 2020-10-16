c$Id: pinval.f,v 1.1 2000/08/24 20:42:44 rlt Exp $
      subroutine pinval(xs,val,error)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose:  Moves character string into real value

c      Inputs:
c         xs(*)   - Character string

c      Outputs:
c         val     - Value extracted from character string
c         error   - Flag, true if error occurs
c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      logical   error
      character xs*15
      real*8    val

      save

      read(xs,1000,err=100) val
      return
100   error = .true.

c     Format

1000  format(f15.0)

      end
