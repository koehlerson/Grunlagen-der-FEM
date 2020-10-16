c$Id: usetlib.f,v 1.1 2000/08/24 20:42:44 rlt Exp $
      subroutine usetlib(i,prt)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Interface for user mesh manipulation set  commands

c      Inputs:
c         i      - Command number
c         prt    - Flag, output if true

c      Outputs:
c         None   - Users are responsible for providing outputs in
c                  usetmi routines
c-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      logical   prt
      integer   i

      save

      if(i.eq.1) then
        call usetm1(prt)
      elseif(i.eq.2) then
        call usetm2(prt)
      elseif(i.eq.3) then
        call usetm3(prt)
      elseif(i.eq.4) then
        call usetm4(prt)
      elseif(i.eq.5) then
        call usetm5(prt)
      endif

      end
