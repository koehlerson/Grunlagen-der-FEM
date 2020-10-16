c$Id: umacr4.f,v 1.1 2000/08/24 20:49:58 rlt Exp $
      subroutine umacr4(lct,ctl,prt)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose:  User interface for adding solution command language
c                instructions.

c      Inputs:
c         lct       - Command character parameters
c         ctl(3)    - Command numerical parameters
c         prt       - Flag, output if true

c      Outputs:
c         N.B.  Users are responsible for command actions.  See
c               programmers manual for example.
c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      include  'iofile.h'
      include  'umac1.h'

      logical   pcomp,prt
      character lct*15
      real*8    ctl(3)

      save

c     Set command word

      if(.not.pcomp(uct,'mac4',4)) then
        write(iow,2000)
        if(ior.lt.0) write(*,2000)
      endif

2000  format('  *WARNING* Call to dummy procedure UMACR4 *')

      end
