c$Id: polar.f,v 1.1 2000/08/24 20:42:44 rlt Exp $
      subroutine polar(nty,x,ndm,prt,prth)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Convert polar/cylindrical to cartesian coordinates

c      Inputs:
c         nty(*)    - Node type
c         x(ndm,*)  - Polar coordinate values
c         ndm       - Spatial dimension of mesh
c         prt       - Output generated data if true
c         prth      - Output title/header data if true

c      Outputs:
c         x(ndm,*)  - Cartesian coordinate values
c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      include  'cdata.h'
      include  'cdat2.h'
      include  'crotas.h'
      include  'iofile.h'
      include  'pointer.h'
      include  'comblk.h'

      logical   prt,prth, errck, tinput, pcomp
      character type*15
      integer   i,n, inc,mct,ne,ni,ndm
      real*8    r,th

      integer   nty(*)
      real*8    x(ndm,*),td(6)

      save

      if(ndm.eq.1) return
      mct = 0
      th = atan(1.0d0)/45.0
100   if(ior.lt.0) write(*,4000)
      errck = tinput(type,1,td,6)
      if(errck) go to 100
      if(pcomp(type,'node',4)) then
        ni  = td(1)
        if(ni.le.0) return
        ne  = td(2)
        if(ni.gt.numnp.or.ne.gt.numnp) go to 300
        if(ne.eq.0) ne = ni
        inc = td(3)
        inc = sign(max(abs(inc),1),ne-ni)
      elseif(pcomp(type,'all',3)) then
        ni  = 1
        ne  = numnp
        inc = 1
      else
        return
      endif
      n = ni
200   if(nty(n).eq.0) then
        nty(n) = 1
        r      = x(1,n)
        x(1,n) = x0(1) + r*cos(x(2,n)*th) + td(4)
        x(2,n) = x0(2) + r*sin(x(2,n)*th) + td(5)
        if(ndm.eq.3) x(3,n) = x0(3) + x(3,n) + td(6)

        if(mct.le.0) then
          if(prt) then
            call prtitl(prth)
            write(iow,2000) x0,td(4),td(5),td(6),(i,i=1,ndm)
            if(ior.lt.0) then
              write(*,2000) x0,td(4),td(5),td(6),(i,i=1,ndm)
            endif
          endif
          mct = 50
        endif
        if(prt) then
          write(iow,2001) n,(x(i,n),i=1,ndm)
          if(ior.lt.0) write(*,2001) n,(x(i,n),i=1,ndm)
        endif
        mct = mct - 1
      elseif(nty(n).gt.0) then
        write(iow,3001) n
        if(ior.lt.0) then
          write(iow,3001) n
        endif
      else
        write(iow,3002) n
        if(ior.lt.0) then
          write(iow,3002) n
        endif
      endif
      n = n + inc
      if((ne-n)*inc.ge.0) go to 200
      if(mod(ne-ni,inc).eq.0) go to 100
      ni = ne
      n = ne
      go to 200

c     Error

300   write(iow,3000) ni,ne
      if(ior.lt.0) write(*,3000) ni,ne
      call plstop()

c     Formats

2000  format('  Cartesian coordinates computed from polar inputs.'//
     & '  Global: x0 =',1p,1e12.4,' y0 =',1p,1e12.4,' z0 =',1p,1e12.4/
     & '  Local:  x0 =',1p,1e12.4,' y0 =',1p,1e12.4,' z0 =',1p,1e12.4/
     &   /4x,'Node',6(i6,'-Coord')/(8x,6(i6,'-Coord')))

2001  format(i8,6f12.4)

3000  format(' *ERROR* Attempt to convert nodes ni =',i8,' to ne =',i8)

3001  format(' *ERROR* Attempt to convert cartesian node',i9)

3002  format(' *ERROR* Attempt to convert undefined node',i9)

4000  format(' Input: node-1,node-2,inc, x0, y0, z0'/'   >',$)

      end
