c$Id:$
      subroutine int3d(ll,lint,s)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Gauss quadrature for 3-d element

c      Inputs:
c         ll     - Number of points/direction

c      Outputs:
c         lint   - Total number of quadrature points
c         s(4,*) - Gauss points (1-3) and weights (4)
c-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      integer   i,ll,lint, ig(4),jg(4)
      real*8    g, s(4,*)

      data      ig/-1,1,1,-1/,jg/-1,-1,1,1/

c     1 pt. quadrature

      if(ll.eq.1) then
        lint = 1
        do i = 1,3
          s(i,1) = 0.0d0
        end do
        s(4,1) = 8.0d0

c     2 x 2 x 2 pt. quadrature

      elseif(ll.lt.9) then
        lint = 8
        g    = 1.d0/sqrt(3.0d0)
        do i = 1,4
          s(1,i)   = ig(i)*g
          s(1,i+4) = s(1,i)
          s(2,i)   = jg(i)*g
          s(2,i+4) = s(2,i)
          s(3,i)   =  g
          s(3,i+4) = -g
          s(4,i)   = 1.d0
          s(4,i+4) = 1.d0
        end do

c     Special 9 pt. quadrature

      elseif(ll.eq.9) then
       lint = 9
       g    = sqrt(0.6d0)
       do i = 1,4
          s(1,i)   = ig(i)*g
          s(1,i+4) = s(1,i)
          s(2,i)   = jg(i)*g
          s(2,i+4) = s(2,i)
          s(3,i)   =  g
          s(3,i+4) = -g
          s(4,i)   = 5.d0/9.d0
          s(4,i+4) = 5.d0/9.d0
        end do
        s(1,9)     =  0.d0
        s(2,9)     =  0.d0
        s(3,9)     =  0.d0
        s(4,9)     =  32.d0/9.d0

c     Special 4 pt. quadrature

      else
        lint = 4
        g    = 1.d0/sqrt(3.0d0)
        do i = 1,4
          s(1,i) = ig(i)*g
          s(2,i) = s(1,i)
          s(3,i) = jg(i)*g
          s(4,i) = 2.0d0
        end do
        s(2,3) = -g
        s(2,4) =  g
      endif

      end
