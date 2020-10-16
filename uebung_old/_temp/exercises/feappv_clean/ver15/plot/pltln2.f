c$Id: pltln2.f,v 1.1 2000/08/24 20:49:58 rlt Exp $
      subroutine pltln2(iel)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Set 3-d Plot Sequence for 2-node line elements

c      Inputs:
c         iel       - Element type number

c      Outputs:
c         none      - Output through common block data
c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      include  'pdata5.h'
      include  'pdata6.h'

      integer   iel

      save

c     Set number of points

      if(iel.gt.0) then

        inord(iel)    = 3

c       Set plot sequence

        ipord( 1,iel) = 1
        ipord( 2,iel) = 2
        ipord( 3,iel) = 1

      elseif(iel.lt.0) then

        exord(-iel)    = 3

c       Set plot sequence

        epord( 1,-iel) = 1
        epord( 2,-iel) = 2
        epord( 3,-iel) = 1

      endif

      end
