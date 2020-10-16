c$Id: pmacr4.f,v 1.1 2000/08/24 20:42:44 rlt Exp $
      subroutine pmacr4(ctl,lct,j)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Command language instruction control:  Part 4.
c               Interface to user command routines

c      Inputs:
c         ctl(*)   - Command parameters for current command
c         lct      - Command option for current command
c         j        - Command number to execute in this routine

c      Outputs:
c         Depends on value of j
c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      include  'print.h'

      integer   j

      character lct*15
      real*8    ctl(3)

      save

c     'macn' command
c     [macn,xxxx,n1,n2,n3]

      call umaclib(j,lct,ctl,prt)

      end
