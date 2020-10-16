c$Id: wprojm.f,v 1.1 2000/08/24 20:42:44 rlt Exp $
      subroutine wprojm(a,nn,ah)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Outputs projected subspace arrays: G and H

c      Inputs:
c         a(*)        - Array to output
c         nn          - Number row/columns in array
c         ah          - Header to write (G or H)

c      Outputs:
c         none
c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      include  'iofile.h'

      character ah*(*)
      real*8    a(*)
      integer   nn,i,k,n

      save

      i = 0
      write(iow,2000) ah
      do n = 1,nn
        write(iow,2001) (a(i+k),k=1,n)
        i = i + n
      end do
      if(ior.lt.0) then
        i = 0
        write(  *,2000) ah
        do n = 1,nn
          write(  *,2001) (a(i+k),k=1,n)
          i = i + n
        end do
      endif

c     Formats

2000  format(' ',a,'-Matrix ')

2001  format(1p,8d10.2)

      end
