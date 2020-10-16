c$Id:$
      function padd(val)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

      implicit  none

      real*8    padd, val, xval

      save

      data      xval /0.0d0/

c     Look at parameter

      if(val.eq.0.0d0) then
        xval = 0.0d0
      else
        xval = xval + val
      endif

      padd = xval

      end
