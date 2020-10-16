c$Id:$
      function sind(x)

      implicit none

      real*8 sind, x

      sind = sin(atan(1.d0)*x/45.d0)

      end
