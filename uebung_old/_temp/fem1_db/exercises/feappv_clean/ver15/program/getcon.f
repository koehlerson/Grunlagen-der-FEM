c$Id:$
      subroutine getcon(epmac,dops)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Perform installation parameter computations

c      Inputs:

c      Outputs:
c         epmac   - Smallest number that can be added to 1.0
c         dops    - Estimate on computer speed
c-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'psize.h'
      include  'comblk.h'

      real*4    tarr1(2),tarr2(2) , etime , tt
      real*8    epmac,dops
      integer   i, im

      save

c     Compute machine epsilon estimate

      epmac = 1.0d0
100   epmac = epmac*0.5d0
      if(1.d0 .ne. 1.d0 + epmac) go to 100
      epmac = 2.0d0*epmac

c     Compute estimate of floating point speed

      im = min(500000,maxm/2-1)
      do i = 1,im
        hr(i) = 0.33333333333333d0
      end do
      dops = 0.0d0
      tt = etime(tarr1)
      do i = 1,im
        dops = dops + hr(i)*hr(i)
      end do
      tt = etime(tarr2)
      if(tarr2(1)-tarr1(1) .gt.0.0) then
        dops = real(im)/(tarr2(1) - tarr1(1))*2.d0
      endif

      end
