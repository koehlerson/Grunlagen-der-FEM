      subroutine elmt06(d,ul,xl,ix,tl,s,p,ndf,ndm,nst,isw)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

      implicit  none

      integer   ndf , ndm , nst , isw
      integer   ix(*)
      real*8    d(*), ul(*), xl(*), tl(*), s(*), p(*)

      if(isw.gt.0) write(*,2000)
2000  format('    Elmt 01: *WARNING* Dummy subroutine called')
      end
