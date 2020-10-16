      subroutine elmt08(d,ul,xl,ix,tl,s,p,ndf,ndm,nst,isw)
c--------------------------------------------------------------------72
c     Elementtype: 4 - node, quadrilateral, 2D
c     Shapes     : bilinear
c     Integration: 4 - point Gauss Quadrature
c
c     Notation:
c     xl         : x/y coordinates of nodes
c     ul         : sought nodal displacements
c     igp        : number of current Gauss point
c     xi         : xi-coordinate of current Gauss point
c     eta        : eta-coordinate of current Gauss point
c     wgp        : weight of current Gauss point
c     epsilon    : linear strain tensor
c     sig        : stresses
c     cmat       : constitutive tensor
c     bmat       : b-matrix
c     rhs        : right hand side vector
c     kelem      : element stiffness matrix
c
c     (c)University of Duisburg-Essen                     AS 22.11.2004
c--------------------------------------------------------------------72
      implicit none
      include   'bdata.h'
      include   'cdata.h'
      include   'comblk.h'
      include   'debugs.h'
      include   'eldata.h'
      include   'hdata.h'
      include   'iofile.h'
      include   'pdata6.h'
      include   'plotdetq.h'
      include   'prstrs.h'
      include   'strnum.h'
      include   'tdata.h'
      integer ix(*)
      integer ndf,ndm,nst,isw,nds
      integer l,k,i,j,i1,ii,jj,j1,kk,iper
      integer istb,nhistmat,igp
      integer nlin,idim,iswl,numtan,isymm
      integer ndoff,ndele,nhistele,imatID,nd4,nd5,nd7,nd10,nd11
      real*8 g03d(6),g3d(6),s3d(24),aa3d(6,6),sigd(6,6)
      real*8 d(*),tl(*),s(nst,nst),p(*)
      real*8 sigp(24,9),pmat(4,4),aa99(9,9)
      real*8 xi,eta,ul(2,4),xl(2,4),matp(2)
      real*8 epsilon(2,2),eps(3),sig(3),treps,detj,dvol
      real*8 cmat(3,3),wgp,bbd(2,3),bmat(3,2,4),kelem(8,8),rhs(8)
      real*8 shp(3,4)
      logical errck,pinput
c
c---------------------------------------------------------------------72
      if(isw.eq.1) then
c---------------------------------------------------------------------72
c
c.... Einlesen der Materialparameter
c
    1 if(ior.lt.0) write(*,3000)
      errck=pinput(d,4)
	if(errck) go to 1
      write(*,4000) d(1),d(2)
      write(iow,4000) d(1),d(2)
c
c.... set plot sequence
      if(nen.eq.4) then
        inord(iel)    = 5
        ipord( 1,iel) = 1
        ipord( 2,iel) = 2
        ipord( 3,iel) = 3
        ipord( 4,iel) = 4
        ipord( 5,iel) = 1
      else
        write(*,*) 'wrong nen =',nen
        stop
      endif
      return
c
c---------------------------------------------------------------------72
      elseif(isw.eq.3 .or. isw.eq.4 .or. isw.eq.8) then
c---------------------------------------------------------------------72
        matp(1) = d(1)
        matp(2) = d(2)
        nds = 3
        call element1(ul,xl,s,p,ttim,dt,matp,s3d,ndf,nds,nen)
c---------------------------------------------------------------------72
c...  Spannungen ins Plotfeld
c        if (isw.eq.4 .or. isw.eq.8) then
c          do i = 1,24
c            sigp(i,igp) = s3d(i)
c          end do
c        end if
c...  Ausgabe der Spannungen im Gaußpunkt
c        if(isw.eq.4) then
c          mct = mct - 2
c          if(mct.le.0) then
c            write(iow,2001) o,head
c            if(ior.lt.0) write(*,2001) o,head
c            mct = 50
c          endif
c          write(iow,2002) n,ma,igp,(sigp(i,igp),i=1,4)
c          write(*,2002)   n,ma,igp,(sigp(i,igp),i=1,4)
c...  Berechnung der Spannungen an den Knoten
c        elseif (isw.eq.8) then
c          call smooak8(shp,nen,igp,xl,pmat)
c          if(igp.eq.4) then
c            istb = 1
c            call stcntq8(numnp,nen,xl,ix,sigp,hr(nph),
c     &                   hr(nph+numnp),pmat,istb,24)
c          endif
c        endif
c---------------------------------------------------------------------72
      end if  ! isw: 1,3,4,8
      return
c
c.... formats for input-output
c
 2001 format(a1,20a4/'     element stresses'/'      elmt matl  gpt',
     & '  11-stress  22-stress  33-stress  12-stress ')
c
 2002 format(5x,3i5,4e11.4)
c
 3000 format(' Input kappa mu',$)
c
 4000 format(//
     & 5x,'Elementtype: 4 - node, quadrilateral, 2D                ',/
     & 5x,'Shapes     : bilinear                                   ',/
     & 5x,'Integration: 4 - point Gauss Quadrature                 ',/
     & 5x,'[01] [   kappa] Kompressionsmodul..................',e12.5/
     & 5x,'[02] [     mue] Schubmodul   ......................',e12.5)
c
      end
c
      subroutine element1(ul,xl,kelem,rhs,ttim,dt,matp,sig,ndf,nds,nel)
c-----7--------------------------------------------------------------72
c     Elementtype: 4 - node, quadrilateral, 2D
c     Shapes     : bilinear
c     Integration: 4 - point Gauss Quadrature
c
c     Notation:
c     xl         : x/y coordinates of nodes
c     ul         : sought nodal displacements
c     igp        : number of current Gauss point
c     xi         : xi-coordinate of current Gauss point
c     eta        : eta-coordinate of current Gauss point
c     wgp        : weight of current Gauss point
c     epsilon    : linear strain tensor
c     sig        : stresses
c     cmat       : constitutive tensor
c     bmat       : b-matrix
c     rhs        : right hand side vector
c     kelem      : element stiffness matrix
c     nel        : number of nodes
c     nds        : stress dimension number
c
c     (c)University of Duisburg-Essen                     AS 22.11.2004
c-----7--------------------------------------------------------------72
      implicit none
      integer igp,i,k,ndf,ii,kk,jj,j1,i1,j,nel,nds
      real*8 xi,eta,ul(2,4),xl(2,4),ttim,dt,matp(2)
      real*8 epsilon(3,3),sig(3),treps,detj,dvol
      real*8 cmat(3,3),bbd(2,3),bmat(3,2,4),kelem(8,8),rhs(8)
      real*8 shp(3,4),wgp
c-----7--------------------------------------------------------------72
      call pzero(bbd,2*3)
      call pzero(kelem,8*8)
      call pzero(rhs,8*1)
c...  Gauss loop
      do igp = 1,nel
c...  get values for shape functions, derivatives and determinate
        call shape1(igp,xl,shp,detj,wgp)
c...  Volume-element dv for Gauss quadrature
        dvol = detj*wgp
c...  compute linear strain tensor
        call pzero(epsilon,3*3)
        do i = 1,nel
          epsilon(1,1) = epsilon(1,1) + ul(1,i)*shp(1,i)
          epsilon(2,2) = epsilon(2,2) + ul(2,i)*shp(2,i)
          epsilon(1,2) = epsilon(1,2) +
     &                      0.5*(ul(1,i)*shp(2,i) + ul(2,i)*shp(1,i))
        end do
        epsilon(2,1) = epsilon(1,2)
c...  get stresses and moduli
c        call material1(epsilon,ttim,dt,matp,sig,cmat)
        call material2(epsilon,ttim,dt,matp,sig,cmat)
c.... compute b-matrix for all nodes
        do i = 1,nel
         bmat(1,1,i) = shp(1,i)
         bmat(2,1,i) = 0.0d0
         bmat(3,1,i) = shp(2,i)
         bmat(1,2,i) = 0.0d0
         bmat(2,2,i) = shp(2,i)
         bmat(3,2,i) = shp(1,i)
        end do
c.... multiplication with volume element dvol
        do i = 1,nds
          sig(i) = sig(i)*dvol
          do j = 1,nds
            cmat(i,j) = cmat(i,j)*dvol
          end do
        end do
c.... compute part of right hand side vector
        i1 = 0
        do i = 1,nel                     ! Loop 1 over nodes per element
          do ii = 1,ndf
            do jj = 1,nds
              rhs(i1+ii) = rhs(i1+ii) - bmat(jj,ii,i)*sig(jj)
            end do
          end do
          i1 = i1 + ndf
        end do                                              ! End Loop 1
c.... compute element stiffness matrix
        i1 = 0
        do i = 1,nel                     ! Loop 2 over nodes per element
c.... compute (b^t*cmat)
          do ii = 1,ndf
            do jj = 1,nds
              bbd(ii,jj) = 0.0d0
              do kk = 1,nds
                bbd(ii,jj) = bbd(ii,jj) + bmat(kk,ii,i)*cmat(kk,jj)
              end do
            end do
          end do
c.... compute (b^t*cmat)*b*dv
          j1 = i1
          do j = i,nel
            do ii = 1,ndf
              do jj = 1,ndf
                do  kk = 1,nds
                  kelem(i1+ii,j1+jj) =
     &             kelem(i1+ii,j1+jj) + bbd(ii,kk)*bmat(kk,jj,j)
                  end do
                end do
              end do
            j1 = j1 + ndf
          end do
          i1 = i1 + ndf
        end do                                              ! End Loop 2
c
      end do ! Gauss Loop
c.... assembly lower part of tangent by symmetry
      do i = 1,(ndf*nel)
        do j = i,(ndf*nel)
          kelem(j,i) = kelem(i,j)
        end do
      end do
c
      return
      end
c
      subroutine shape1(igp,xl,shp,detj,wgp)
c--------------------------------------------------------------------72
c      Shape functions, derivates and determinate
c--------------------------------------------------------------------72
      implicit none
      integer i,igp
      real*8 shp(3,4),sh0(3,4),xi,eta,xl(2,4),detj
      real*8 xj(2,2),rn(4),sn(4),wgp
c--------------------------------------------------------------------72
c...  get Gauss point coordinates and weights
      call gauss1(igp,xi,eta,wgp)
c...  shape functions
      shp(3,1) = 0.25d0*(1.d0 - xi)*(1.d0 - eta)
      shp(3,2) = 0.25d0*(1.d0 + xi)*(1.d0 - eta)
      shp(3,3) = 0.25d0*(1.d0 + xi)*(1.d0 + eta)
      shp(3,4) = 0.25d0*(1.d0 - xi)*(1.d0 + eta)
c...  derivates with respect to xi
      sh0(1,1) = -0.25d0*(1.d0 - eta)
      sh0(1,2) =  0.25d0*(1.d0 - eta)
      sh0(1,3) =  0.25d0*(1.d0 + eta)
      sh0(1,4) = -0.25d0*(1.d0 + eta)
c...  derivates with respect to eta
      sh0(2,1) = -0.25d0*(1.d0 - xi)
      sh0(2,2) = -0.25d0*(1.d0 + xi)
      sh0(2,3) =  0.25d0*(1.d0 + xi)
      sh0(2,4) =  0.25d0*(1.d0 - xi)
c...  Jacobian and determinante(detj)
      call pzero(xj,2*2)
      do i = 1,4
        xj(1,1) = xj(1,1) + sh0(1,i)*xl(1,i)
        xj(1,2) = xj(1,2) + sh0(2,i)*xl(1,i)
        xj(2,1) = xj(2,1) + sh0(1,i)*xl(2,i)
        xj(2,2) = xj(2,2) + sh0(2,i)*xl(2,i)
      end do
      detj = xj(1,1)*xj(2,2) - xj(1,2)*xj(2,1)
c...  derivates with respect to x and y
      do i = 1,4
        shp(1,i) =(1.d0/detj)*(+(sh0(1,i)*xj(2,2))-(sh0(2,i)*xj(2,1)))
        shp(2,i) =(1.d0/detj)*(-(sh0(1,i)*xj(1,2))+(sh0(2,i)*xj(1,1)))
      end do
c
      return
      end
c
      subroutine material1(epsilon,ttim,dt,matp,sig,cmat)
c--------------------------------------------------------------------72
c     elastic material for 2D
c     Parameters: kappa, mue
c--------------------------------------------------------------------72
      implicit none
      integer igp
      real*8 epsilon(3,3),eps(3),sig(3),treps
      real*8 cmat(3,3),matp(2),kappa,mue,ttim,dt
c--------------------------------------------------------------------72
c...  Material data
      kappa  = matp(1)
      mue    = matp(2)
c...  compute trace of teh linear strain tensor
      treps  = epsilon(1,1) + epsilon(2,2)
c...  compute stresses in Voigt-Notation
      sig(1) = kappa*treps + 2*mue*(epsilon(1,1) - (treps/3.d0))
      sig(2) = kappa*treps + 2*mue*(epsilon(2,2) - (treps/3.d0))
      sig(3) =               mue*(epsilon(2,1)+epsilon(1,2))
c...  compute moduli
      call pzero(cmat,3*3)
      cmat(1,1) = kappa + (4.d0/3.d0)*mue
      cmat(2,2) = kappa + (4.d0/3.d0)*mue
      cmat(1,2) = kappa - (2.d0/3.d0)*mue
      cmat(2,1) = kappa - (2.d0/3.d0)*mue
      cmat(3,3) = mue
      return
      end
c
      subroutine gauss1(igp,xi,eta,wgp)
c--------------------------------------------------------------------72
c     Gauss point coordinates and weights
c--------------------------------------------------------------------72
      implicit none
      integer i,igp
      real*8 xi,eta,wgp
c--------------------------------------------------------------------72
c...  get Gauss point coordinates and weights
      if(igp .eq. 1) then
        xi  = -1.d0/dsqrt(3.d0)
        eta = -1.d0/dsqrt(3.d0)
        wgp =  1.d0
      elseif(igp .eq. 2) then
        xi  =  1.d0/dsqrt(3.d0)
        eta = -1.d0/dsqrt(3.d0)
        wgp =  1.d0
      elseif(igp .eq. 3) then
        xi  =  1.d0/dsqrt(3.d0)
        eta =  1.d0/dsqrt(3.d0)
        wgp =  1.d0
      elseif(igp .eq. 4) then
        xi  = -1.d0/dsqrt(3.d0)
        eta =  1.d0/dsqrt(3.d0)
        wgp =  1.d0
      end if
      return
      end
c
      subroutine smooak8(shp,nel,igp,xl,p)
c----------------------------------------------------------------------
c     Glaettung der Spannungen
c     Paramater
c         shp(3,nel)  Ansatzfunktionen
c         nel         Knotenanzahl der Elemente
c         l           Gausspunkt
c         lint        Anzahl der Gausspunkt
c         xl(2,*)     Knotenkoordinaten
c         p(4,4)      Smoothing Matrix
c----------------------------------------------------------------------
      implicit none
      integer nel,i,igp
      real*8 shp(3,nel),xl(2,*),p(4,4)
      real*8 gx,gy
c
c.... compute global coordinates of gauss points
        gx = 0.d0
        gy = 0.d0
        do i=1,4
          gx = gx + shp(3,i)*xl(1,i)
          gy = gy + shp(3,i)*xl(2,i)
        end do
        p(igp,1) = gx
        p(igp,2) = gy
        p(igp,3) = gx*gy
        p(igp,4) = 1.d0
      end
c
c
      subroutine stcntq8(numnp,nel,xl,ix,sigp,dt,st,pmat,istb,iste)
c-----------------------------------------------------------------------
c     Berechnung der Spannungen an den Knoten
c     Parameter
c         numnp         Anzahl der Knoten des Systems
c         nel           Anzahl der Elementknoten
c         lint          Anzahl der Gausspunkte
c         xl(2,*)       Knotenkoordinaten
c         ix(*)         Knotennummerierung
c         sigp(12,*)    Projektionen fuer Plotausgabe
c         st(numnp,*)   Projizierte Daten
c         dt(*)         Wichtungskoeffizienten
c         pmat(4,4)     Koeffizientenmatrix
c         istb,iste     ID für Projektionsfeld
c-----------------------------------------------------------------------
      implicit none
      integer numnp, nel, ix(*), i, j, k, iste, istb
      real*8 xl(2,*), sigp(24,*), st(numnp,*), dt(numnp),pmat(4,4)
      real*8 xmat(6,4), xpmat(6,4), xpm
c
c.... compute nodal stresses for quads with 4 gauss points
      call invert(pmat,4,4)
      do i=1, 4
        xmat(i,1) = xl(1,i)
        xmat(i,2) = xl(2,i)
        xmat(i,3) = xl(1,i)*xl(2,i)
        xmat(i,4) = 1.d0
      end do
c
      do i=1, 4 ! node
        do j=1, 4  ! max GP
          xpm = 0.d0
          do k=1, 4 ! max GP
            xpm = xpm + xmat(i,k)*pmat(k,j)
          end do
          xpmat(i,j) = xpm
        end do
      end do
      do i=1, 4 ! node
        dt(ix(i)) = dt(ix(i)) + 1.d0
        do k=istb, iste
          do j=1, 4 ! max GP
            st(ix(i),k) = st(ix(i),k) + xpmat(i,j)*sigp(k,j)
          end do
        end do
      end do
      end
c
      subroutine material2(epsilon,ttim,dt,matp,sig,cmat)
c--------------------------------------------------------------------72
c     elastic material for 2D
c     Parameters: kappa, mue
c--------------------------------------------------------------------72
      implicit none
      integer igp
      real*8 epsilon(3,3),eps(3),sig(3),treps
      real*8 cmat(3,3),matp(2),kappa,mue,ttim,dt
c--------------------------------------------------------------------72
c...  Material data
      kappa  = matp(1)
      mue    = matp(2)
c...  compute moduli
      call pzero(cmat,3*3)
      cmat(1,1) = kappa + (4.d0/3.d0)*mue
      cmat(2,2) = kappa + (4.d0/3.d0)*mue
      cmat(1,2) = kappa - (2.d0/3.d0)*mue
      cmat(2,1) = kappa - (2.d0/3.d0)*mue
      cmat(3,3) = mue
c...  compute stresses in Voigt-Notation
      sig(1) = cmat(1,1)*epsilon(1,1) + cmat(1,2)*epsilon(2,2)
      sig(2) = cmat(2,1)*epsilon(1,1) + cmat(2,2)*epsilon(2,2)
      sig(3) = cmat(3,3)*epsilon(2,1) + cmat(3,3)*epsilon(1,2)
      return
      end
c
