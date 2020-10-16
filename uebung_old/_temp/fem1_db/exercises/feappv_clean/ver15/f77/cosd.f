c$Id:$
      function cosd(x)

      implicit none

      real*8 cosd, x

      cosd = cos(atan(1.d0)*x/45.d0)

      end
