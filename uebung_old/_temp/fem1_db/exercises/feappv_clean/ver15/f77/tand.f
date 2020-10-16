c$Id:$
      function tand(x)

      implicit none

      real*8 tand, x

      tand = tan(atan(1.d0)*x/45.d0)

      end
