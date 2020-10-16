!$Id:$
      subroutine uplot3(ctl)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Dummy user plot routine

!      Inputs:
!         ctl(3) - Parameters for plots

!      Outputs:
!         none   - Users are responsible for generating outputs
!                  through common blocks, etc.  See programmer
!                  manual for example.
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include 'umac1.h'  ! uct

      logical  pcomp
      real*8   ctl(3)

!     Provide user plot name

      if (pcomp(uct,'plt3',4)) then
!         uct = 'name'

!     Perform user plot function

      else

      end if

      end
