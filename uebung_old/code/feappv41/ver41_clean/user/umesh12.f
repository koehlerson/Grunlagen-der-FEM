!$Id:$
      subroutine umesh12(tx,prt)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Dummy user input routine

!      Inputs:
!         tx(*)  - Command line input data
!         prt    - Flag, output results if true

!      Outputs:
!         none   - Users are responsible for generating outputs
!                  through common blocks, etc.  See programmer
!                  manual for example.
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'umac1.h'

      logical   prt,pcomp
      character tx(*)*15

!     Set command

      if(pcomp(uct,'me12',4)) then      ! Usual    form
!       uct = 'name'                    ! Specify 'name'
      elseif(ucount) then               ! Count elements and nodes

      elseif(urest.eq.1) then           ! Read  restart data

      elseif(urest.eq.2) then           ! Write restart data

      else                              ! Perform user operation

      endif

      end
