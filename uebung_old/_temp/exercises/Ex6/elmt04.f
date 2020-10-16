      subroutine elmt04(d,ul,xl,ix,tl,s,p,ndf,ndm,nst,isw)
c---------------------------------------------------------------------72
c     4-NODE-QUADRILATERAL ELEMENT 
c     LINEAR ELASTIC MATERIAL MODEL: HOOKES LAW
c     SMALL-PLANE-STRAIN STANDARD DISPLACEMENT FORMULATION
c     Parameters:
c     d(1-ndoff)              ! general element informations
c     d(ndoff+1->ndoff+ndele) ! individual element informations
c     d(ndoff+ndele+1)        ! material parameters
c---------------------------------------------------------------------72
      implicit none
      include   'bdata.h'
      include   'cdata.h'
      include   'comblk.h'
      include   'debugs.h'
      include   'eldata.h'
      include   'hdata.h'
      include   'iofile.h'
      include   'pdata6.h'
      include   'prstrs.h'
      include   'strnum.h'
      include   'tdata.h'
      integer ix(*)
      integer ndf,ndm,nst,isw
      integer l,k,i,j,i1,ii,jj,j1,kk,lint
      integer ndoff,ndele
      real*8 f3d(3,3),s3d(24),aa3d(6,6)
      real*8 d(*),ul(ndf,*),xl(ndm,*),tl(*),s(nst,nst),p(*)
      real*8 detj,dvol
      real*8 eg(3,4),wg(4),shp(3,4)
      real*8 sig(4),aa(3,3),bbd(2,3),bbar(3,2,4)
      real*8 sigp(24,4),pmat(4,4)
      real*8 kappa,mue
      logical errck,pinput
c
c---------------------------------------------------------------------72
      if(isw.eq.1) then
c---------------------------------------------------------------------72
c
c....   read parameters
c
    1   if(ior.lt.0) write(*,3000)
        errck=pinput(d,4)
	if(errck) go to 1
        write(*,4000) d(1),d(2)
        write(iow,4000) d(1),d(2)
        kappa  = d(1)
        mue    = d(2)
c
c....   set plot sequence
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
c
c....   read material parameters
        kappa  = d(1)
        mue    = d(2)
c
c...    stiffness matrix and residual: 
c-------------------------------------
c
c...    compute Gausspoints
        if(nen.eq.4) lint = 4
        call gauss04(nen,lint,eg,wg)
c
c....   begin loop over all Gausspoints
        do l = 1,lint  ! Begin Gauss Loop
c
c....     compute ansatz functions and derivatives
          call shape04(nen,eg(1,l),xl,shp,detj)
          dvol = detj*wg(l)
c
c....     compute strains
c
c                   |  e_11 2e_12  0 |
c         f3d(3,3)= | 2e_21  e_22  0 |
c                   |   0      0   0 | 
          call pzero(f3d,3*3)

c....     ??? f3d = ?

c
c....     compute stresses and moduli
c
c         s3d(24) = [sig_11 sig_22 sig_33 sig_12 sig_23 sig_13 ...]
c
c                        11     22     33     12     23     13
c                     11 C_1111 C_1122 C_1133 C_1112 C_1123 C_1113
c                     22 C_2211 C_2222 C_2233 C_2212 C_2223 C_2213 
c                     33 C_3311 C_3322 C_3333 C_3312 C_3323 C_3313
c         aa3d(6,6) = 12 C_1211 C_1222 C_1233 C_1212 C_1223 C_1213
c                     23 C_2311 C_2322 C_2333 C_2312 C_2323 C_2313
c                     13 C_1311 C_1322 C_1333 C_1312 C_1323 C_1313
c

          call pzero(aa3d,6*6)
          call pzero(s3d,24)
          call hooke04(kappa,mue,f3d,s3d,aa3d)
c
c....     plot stresses
          if (isw.eq.4 .or. isw.eq.8) then
            do i = 1,24
              sigp(i,l) = s3d(i)
            end do
c
c...        print stresses
            if(isw.eq.4) then
              mct = mct - 2
              if(mct.le.0) then
                write(iow,2001) o,head
                if(ior.lt.0) write(*,2001) o,head
                mct = 50
              endif
              write(iow,2002) n,ma,l,(sigp(i,l),i=1,4)
              write(*,2002)   n,ma,l,(sigp(i,l),i=1,4)
c
c....       transfer stress values from Gausspoints to nodes
            elseif (isw.eq.8) then
              call smooak4(shp,nen,l,lint,xl,pmat)
              if(l.eq.lint) then
                call stcntq4(numnp,nen,lint,xl,ix,sigp,hr(nph),
     &                       hr(nph+numnp),pmat,1,24)
              endif
            endif
c
          elseif (isw.eq.3) then
c....       multiplication of stresses and moduli with dvol

c...        ???

c
c....       compute B-matrices of all nodes
            do i = 1,nen
              call bmat04(shp(1,i), bbar(1,1,i))
            end do
c
c....       compute residual r := - B^T*sigma*dv

c           ???

c
c....       compute stiffness matrix
            i1 = 0
            do i = 1,nen
c
c....         compute  bbd = B^T*C*dv
              do ii = 1,2
                do jj = 1,3
                  bbd(ii,jj) = 0.0d0
                  do kk = 1,3
                    bbd(ii,jj) = bbd(ii,jj) + bbar(kk,ii,i)*aa(kk,jj)
                  end do
                end do
              end do
c
c....         compute stiffness matrix s = B^T*C*B*dv (upper triangular part)
              j1 = i1
              do j = i,nen
                do ii = 1,2
                  do jj = 1,2
                    do  kk = 1,3
                      s(i1+ii,j1+jj) = s(i1+ii,j1+jj)
     &	                             + bbd(ii,kk)*bbar(kk,jj,j)
                    end do
	          end do
	        end do
                j1 = j1 + ndf
              end do
              i1 = i1 + ndf
            end do ! i
          end if  ! isw=3
        end do  ! End Gauss Loop
c
c....   compute lower triangular part of stiffness matrix via symmetry
        if (isw.eq.3) then
          do i = 1,nst
            do j = i,nst
              s(j,i) = s(i,j)
	    end do
          end do
	endif  ! end isw=3
c
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
     & 5x,'2D SMALL-PLANE-STRAIN ELEMENT                           ',/
     & 5x,'SMALL-STRAIN-HOOKES-LAW                                 ',/
     & 5x,'ELEMENT 04 (4-NODE-QUADRILATERAL)                       ',/
     & 5x,'[01] [   kappa] compression modulus................',e12.5/
     & 5x,'[02] [     mue] shear modulus......................',e12.5)
c
      end
c
c
c
      subroutine gauss04(nel,lint,eg,wg)
c----------------------------------------------------------------------
c     computes positions of Gausspoints and weighting factors
c     for quadrilateral elements
c     parameters:
c       nel       nodes per element
c       wg(9)     weighting factors
c       lint      number of Gausspoints
c       eg(3,4)   coordinates of Gausspoints
c----------------------------------------------------------------------
      implicit none
      integer lint,i,nel
      real*8 r0,r1,r2,g,h
      real*8 eg(3,4),wg(4),lr(4),ls(4),lw(4)
      data lr/-1,1,1,-1/,ls/-1,-1,1,1/
      data lw/4*25/
c
      if (nel.eq.4) then
c.... 4-Gausspoint integration
        if(lint.eq.4) then

c         ???

        else
          write(*,*) 'wrong quadrature lint=',lint
          stop
        endif
      endif
      return
      end
c
c
c
      subroutine shape04(nel,eg,xl,shp,detj)
c----------------------------------------------------------------------
c     computes ansatz functions for quadrilateral elements
c     parameters
c       nel      nodes per element
c       eg       Gausspoints
c       xl       nodal coordinates
c       shp(3,4) ansatzfunctions
c          shp(1,*) -> N,x
c          shp(2,*) -> N,y
c          shp(3,*) -> N
c       detj     Jakobi-determinant
c----------------------------------------------------------------------
      implicit none
      integer nel,i,j,ii
      real*8 eg(3),xl(2,6),shp(3,4)
      real*8 sh0(2,4),rn(4),sn(4),xj(2,2),xjinv(2,2)
      real*8 detj
      data rn/-1.d0,+1.d0,+1.d0,-1.d0/
      data sn/-1.d0,-1.d0,+1.d0,+1.d0/
c
c               | N^I,Ksi |   | N^I,eg(1) |
c     sh0(2,4)= | N^I,Eta | = | N^I,eg(2) |
c
c               | N^I,x |        | N^I,Ksi |
c     shp(2,4)= | N^I,y | = J^-T | N^I,Eta |
c               | N^I   |        | N^I     |
c

c     ???: shp(3,*),sh0 = ?

c
c.... Jacobi-Matrix and derivatives
c
c                      | x_I*N^I,Ksi x_I*N^I,Eta |          | x_I |
c     J = summe(I=1-4) |                         | mit xl = |     |
c                      | y_I*N^I,Ksi y_I*N^I,Eta |          | y_I |
c

c     ???: shp(1,*),shp(2,*),detj = ?

      return
      end
c
c
c
      subroutine bmat04(shp,b)
c----------------------------------------------------------------------
c     computes B-matrix
c     parameters:
c       shp(3) ansatz functions
c       b(3,2) B-matrix
c----------------------------------------------------------------------
      implicit none
      real*8 shp(3),b(3,2)
c
c           | N^I,x  0    |
c     B^I = |  0    N^I,y |
c           | N^I,y N^I,x |
c

c....   ???

      return
      end
c
c
c
      subroutine smooak4(shp,nel,l,lint,xl,p)
c----------------------------------------------------------------------
c     smoothing the stresses
c     paramaters:
c         shp(3,nel)  ansatz functions
c         nel         nodes per element
c         l           actual Gausspoint number
c         lint        number of Gausspoints
c         xl(2,*)     nodal coordinates
c         p(4,4)      smoothing matrix
c----------------------------------------------------------------------
      implicit none
      integer nel,l,i,lint
      real*8 shp(3,nel),xl(2,*),p(4,4)
      real*8 gx,gy
c
c.... compute global coordinates of gauss points
      gx = 0.d0
      gy = 0.d0
      do i=1,nel
        gx = gx + shp(3,i)*xl(1,i)
        gy = gy + shp(3,i)*xl(2,i)
      end do
      p(l,1) = gx
      p(l,2) = gy
      if (lint.eq.4) then
        p(l,3) = gx*gy
        p(l,4) = 1.d0
      else if (lint.eq.3) then
        p(l,3) = 1.d0
      endif
      end
c
c
c
      subroutine stcntq4(numnp,nel,lint,xl,ix,sigp,dt,st,pmat,istb,iste)
c-----------------------------------------------------------------------
c     transfers stresses at Gausspoints to nodes
c     parameters:
c         numnp         global number of nodes in considered system
c         nel           nodes per element
c         lint          number of Gausspoints
c         xl(2,*)       nodal coordinates
c         ix(*)         global node numbers
c         sigp(12,*)    projection
c         st(numnp,*)   projected data
c         dt(*)         weighting coefficients
c         pmat(4,4)     coefficient matrix
c         istb,iste     ID for projection field
c-----------------------------------------------------------------------
      implicit none
      integer numnp, nel, lint, ix(*), i, j, k, iste, istb
      real*8 xl(2,*), sigp(24,*), st(numnp,*), dt(numnp),pmat(4,4)
      real*8 xmat(6,4), xpmat(6,4), xpm
c
c.... compute nodal stresses for quads with 4 Gausspoints
      if (lint.eq.4) then
        call invert(pmat,4,4)
        do i=1, nel
          xmat(i,1) = xl(1,i)
          xmat(i,2) = xl(2,i)
          xmat(i,3) = xl(1,i)*xl(2,i)
          xmat(i,4) = 1.d0
        end do
      endif
c
      do i=1, nel
        do j=1, lint
          xpm = 0.d0
          do k=1, lint
            xpm = xpm + xmat(i,k)*pmat(k,j)
          end do
          xpmat(i,j) = xpm
         end do
       end do
        do i=1, nel
          dt(ix(i)) = dt(ix(i)) + 1.d0
          do k=istb, iste
            do j=1, lint
              st(ix(i),k) = st(ix(i),k) + xpmat(i,j)*sigp(k,j)
            end do
	  end do
	end do
      end
c
c
c
      subroutine hooke04(kappa,mue,f3d,s3d,aa3d)
c---------------------------------------------------------------------72
c     computes material response
c     Linear elastic material model: Hookes Law
c...  parameters:
c      kappa:  bulk modulus
c      mue:    shear modulus
c...  NOTES
c     storrage of strains e := (11,22,33,12,23,13)
c---------------------------------------------------------------------72
      implicit none
      include  'iofile.h'
      integer i,j
      real*8 kappa,mue
      real*8 f3d(3,3),s3d(24),aa3d(6,6)
      real*8 e(6),twomue,elam,etr,etr3 
c---------------------------------------------------------------------72
c
c.... strain values
      e(1) = f3d(1,1)
      e(2) = f3d(2,2)
      e(3) = f3d(3,3)
      e(4) = f3d(1,2)
      e(5) = f3d(2,3)
      e(6) = f3d(1,3)
      twomue = mue + mue
      elam   = kappa - twomue/3.0d0
      etr    = e(1) + e(2) + e(3)
      etr3   = etr/3.0d0
c
c.... stresses
      s3d(1) = kappa*etr + twomue*(e(1) - etr3)
      s3d(2) = kappa*etr + twomue*(e(2) - etr3)
      s3d(3) = kappa*etr + twomue*(e(3) - etr3)
      s3d(4) = mue * e(4)
      s3d(5) = mue * e(5)
      s3d(6) = mue * e(6)
c
c.... modulus
      do i = 1,3
        do j = 1,3
          aa3d(i,j) = elam
	end do
       aa3d(i,i) = elam + twomue
      end do
      aa3d(4,4) = mue
      aa3d(5,5) = mue
      aa3d(6,6) = mue
c
      return
      end



