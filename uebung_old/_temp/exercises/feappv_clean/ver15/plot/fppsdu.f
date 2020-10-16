c$Id: fppsdu.f,v 1.1 2000/08/24 20:49:58 rlt Exp $
      subroutine fppsdu()

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose:  Output string of characters to PostScript file

c      Inputs:
c        none       - Input through common /plpost/

c      Outputs:
c        none       - Outputs are written to PostScript file
c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      include  'iodata.h'
      include  'plpost.h'

      integer   i, first, last

      save

      if (nxtchr .gt. 0) then

c       Write to lun

        do first = 1,nxtchr
          if(buffer(first).ne.' ') go to 100
        end do
        return
100     do last = nxtchr,first,-1
          if(buffer(last).ne.' ') go to 200
        end do

200     write (lun,'(80a1)') (buffer(i), i=first,last)
        nxtchr = 0

c       Clear buffer

        do i=1, 80
          buffer(i) = ' '
        end do

      end if

      end
