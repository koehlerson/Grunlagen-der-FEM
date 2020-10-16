c$Id: prtdis.f,v 1.1 2000/08/24 20:42:44 rlt Exp $
      subroutine prtdis(x,b,ttim,prop,ndm,ndf,n1,n2,n3,ii,prth)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Output nodal values for real solutions

c      Inputs:
c         x(ndm,*)  - Nodal coordinates of mesh
c         b(*)      - Current value of solution
c         ttim      - Value of solution time
c         prop      - Value of total proportional load
c         ndm       - Spatial dimension of mesh
c         ndf       - Number dof/node
c         n1        - First node to output
c         n2        - Last noed to output
c         n3        - Increment to n1
c         ii        - Type of output: 1 = displacement; 2 = velocity;
c                                     3 = acceleration
c         prth      - Output title/header data if true

c      Outputs:
c         None      - Outputs to file
c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      include  'fdata.h'
      include  'iofile.h'
      include  'xtout.h'
      include  'pointer.h'
      include  'comblk.h'

      logical   prth,tot
      character nd*4,cd*6,di(4)*6,fmt1*30,fmt2*30
      integer   ndm,ndf,n1,n2,n3,ii, i,n, count, nxt1,nty
      real*8    ttim,prop

      real*8    x(ndm,*),b(ndf,*)

      save

      data      nd   /'Node'/,cd /' Coord'/
      data      di   /' Displ',' Veloc',' Accel',' EigV.'/
      data      fmt1 /'(3x,a4,3(i6,a6)/(7x,6(i6,a6)))'/
      data      fmt2 /'(i7,1p,3e12.4/(7x,1p,6e12.4))'/

      tot   = (ndf+ndm).le.6
      if(.not.tot) then
        write(fmt1(8:8),'(i1)') ndm
        write(fmt2(8:8),'(i1)') ndm
      endif

      count = 0
      nxt1  = max(1,nxt)
      nty   = np(49) - 1
      do n = n1,n2,n3
        if( (mr(nty+n).ge.0) .and. ( nxt.eq.0  .or.
     &     ( abs(x(nxt1,n)-xt).le.xtol ) ) ) then
          count = count - 1
          if(count.le.0) then
            call prtitl(prth)
            if(ii.le.3) then
              write(iow,2000) ttim,prop
              if(ior.lt.0.and.pfr) then
                write(*,2000) ttim,prop
              endif
            else
              write(iow,2001) ttim,prop
              if(ior.lt.0.and.pfr) then
                write(*,2001) ttim,prop
              endif
            endif
            if(tot) then
              write(iow,2002) (i,cd,i=1,ndm),(i,di(ii),i=1,ndf)
              if(ior.lt.0.and.pfr) then
                write(*,2002) (i,cd,i=1,ndm),(i,di(ii),i=1,ndf)
              endif
            else
              write(iow,fmt1) nd,(i,cd,i=1,ndm),(i,di(ii),i=1,ndf)
              if(ior.lt.0.and.pfr) then
                write(*,fmt1) nd,(i,cd,i=1,ndm),(i,di(ii),i=1,ndf)
              endif
            endif
            count = 48
          endif
          if(tot) then
            write(iow,2003) n,(x(i,n),i=1,ndm),(b(i,n),i=1,ndf)
            if(ior.lt.0.and.pfr) then
              write(*,2003) n,(x(i,n),i=1,ndm),(b(i,n),i=1,ndf)
            endif
          else
            write(iow,fmt2) n,(x(i,n),i=1,ndm),(b(i,n),i=1,ndf)
            if(ior.lt.0.and.pfr) then
              write(*,fmt2) n,(x(i,n),i=1,ndm),(b(i,n),i=1,ndf)
            endif
          endif
        endif
      end do

c     Format

2000  format('  N o d a l   D i s p l a c e m e n t s',5x,
     &  'Time',e18.5/44x,'Prop. Ld.',1pe13.5/1x)

2001  format('  N o d a l   D i s p l a c e m e n t s',5x,
     &  'Time',e18.5/43x,'Eigenvalue',1pe13.5/1x)

2002  format('   Node',6(i6,a6):/(7x,6(i6,a6)))

2003  format(i7,1p,6e12.4/(7x,1p,6e12.4))

      end
