      subroutine elmt04(d,ul,xl,ix,tl,s,p,ndf,ndm,nst,isw)
!----------------------------------------------------------------------      
! elmt04: plane strain t1/t2/q1 displacement element
!----------------------------------------------------------------------     
!.....the following parameters are used in this subroutine
      implicit  none
!.....declaration of feap program variables 
      include   'bdata.h'     ! o,head (feap problem description)
      include   'cdata.h'     ! numnp (global number of nodes), nen (max nodes per element)
      include   'comblk.h'    ! hr
      include   'eldata.h'    ! nel (nodes per element), iel (element type), n (element number)
      include   'iofile.h'    ! iow (tag for writing in output file)
      include   'prstrs.h'    ! nph
!.....input
      integer ndf             ! dof per node
      integer ndm             ! space dimension
      integer nst             ! total dof per element
      integer isw             ! task parameter to control computation (used by main feap control program)
      integer ix(*)           ! element global node numbers 
      real*8 d(*)             ! elasticity parameters (here youngs modulus and poisson ratio)
      real*8 ul(ndf,*)        ! solution vector (previous step)
      real*8 xl(ndm,*)        ! nodal coordinates
      real*8 tl               ! nodal temperature values (previous step, not used)
!.....output
      real*8 s(nst,nst)       ! element stiffness matrix
      real*8 p(nst)           ! element residual (previous step, not used)
!.....internal parameters
      real*8 bmat(3,nst)      ! b-operator matrix
      real*8 aa(3,3)          ! elasticity matrix
      logical errck,pinput
      integer lint            ! number of gauss points
      integer l               ! gauss loop increment
      real*8 eg(ndm)          ! coordinate of current gauss point
      real*8 wg               ! weighting factor of current gauss point
      real*8 shp(3,nst/ndf)   ! shape functions and derivatives (depending on gauss point)
      real*8 detj             ! determinant of the jacobian (depending on gauss point)  
      real*8 eps(3)           ! 2d plain strain vector (voigt notation) (depending on gauss point)
      real*8 sig(4)           ! cauchy stresses at gp sig = [ s11, s22, s33, s12 ] 
      real*8 xg(2)            ! physical coordinates of current gauss point
      integer i               ! loop parameter
      real*8 sigp(24)         ! plotvector of stress values sigp(1:4)=sig
      
!.....allocate unused variables
      p  = 0.0 
      tl = 0.0
      

!.....set gauss integration type
      nel = nst/ndf
      if (nel.eq.3) then
        lint = 1
      else if (nel.eq.4) then
        lint = 4
      else if (nel.eq.6) then
        lint = 3
      endif

      
      if(isw.eq.1) then
!.....read material values 
       errck=pinput(d,2) 

      elseif(isw.eq.3 .or. isw.eq.4 .or. isw.eq.8) then
      
!.......set plot sequence
        if (nel.eq.3) then
          call pltri3(iel) ! t1 sequence
        else if (nel.eq.4) then
          call plqud4(iel) ! q1 sequence
        else if (nel.eq.6) then
          call pltri6(iel) ! t2 sequence
        else
          write(*,*) 'Plot sequence not defined!'
        end if
      
!.......compute elasticity matrix    
        call dmat04(d(1),d(2),aa)
        
!----------------------------------------------------------------------      
        do l = 1,lint  ! begin gauss loop
!       
!.........get gauss point coordinate and weighting factor
          call gauss04(l,lint,eg,wg)
! 
!.........evaluate shape function at current gauss point
          call shape04(nel,eg,xl,shp,detj)
! 
!.........compute b-matrix at current gauss point 
          call bmat04(nel,shp,bmat)
!          
!.........add stiffness at current gauss point to element stiffness matrix s
          call kemat04(s,bmat,aa,detj,wg,nst)
        
!.........compute strains and stresses at current gauss point
          call str04(nel,ndf,nst,shp,bmat,aa,ul,eps,sig,xl,xg)

!.........write strains and stresses in output file
          if(isw.eq.4) then
            mct = mct - 2
            if (mct.le.0) then
              write(iow,100) o,head 
              mct = 50
            end if
              write(iow,101) n,sig,xg,eps(1),eps(2),0.0,eps(3) ! n: element number
          end if ! isw=4
      
!.........compute nodal stress values for plot 
          if(isw.eq.8) then
            do i = 1,4
              sigp(i) = sig(i)
            end do
            call stcn04(nel,ix,shp,detj,wg,
     &               sigp,numnp,hr(nph),hr(nph+numnp))
           end if       
    
        end do   ! end gauss loop
!----------------------------------------------------------------------    

      end if
      return
      
      
!.....formats for stress/strain output
 100  format(a1,20a4//,
     &  5x,'Element Stresses'//
     &  '    Elmt          '
     &  '   11-stress   22-stress   33-stress   12-stress'/,
     &  '  1-coord  2-coord',
     &  '   11-strain   22-strain   33-strain   12-strain')
 101  format(i8,10x,1p,4e12.3/0p,2f9.3,1p,4e12.3/1x)
      
      end
      
 
 
 
 
      subroutine dmat04(yo,nu,aa)
!----------------------------------------------------------------------
!     compute 2d elasticity matrix 
!----------------------------------------------------------------------
!.....the following parameters are used in this subroutine
      implicit none
      real*8 yo         ! youngs modulus
      real*8 nu         ! poisson ratio
      real*8 lambda,mue ! Lame parameters
      real*8 aa(3,3)    ! 2d elasticity matrix

!.....compute lame parameters     
      lambda = yo*nu/((1.d0 + nu)*(1.d0 - 2.d0*nu))
      mue = yo/(2.d0*(1+nu))

!.....compute entries of the elacticity matrix
      aa(1,1) = lambda + 2.d0*mue
      aa(2,2) = aa(1,1)
      aa(1,2) = lambda
      aa(2,1) = aa(1,2)
      aa(3,3) = mue

      return
      end 
      
      
    
 

      
      
      subroutine gauss04(l,lint,eg,wg)
!----------------------------------------------------------------------
!     computes weighting factors and coordinates of (t1/t2) gausspoints
!----------------------------------------------------------------------
      implicit none
!.....input
      integer lint      ! number of gauss points
      integer l         ! current gauss loop iteration step
!.....output
      real*8 wg         ! at current gauss point
      real*8 eg(2)      ! coordinates of current gauss point

!.....t2 gauss point coordinates and weight factors
      if (lint.eq.3) then
!.......three point gauss integration type 1
        wg = 1/6.d0
        if (l.eq.1) then
          eg(1) = 0.5d0
          eg(2) = 0.5d0
        elseif (l.eq.2) then
          eg(1) = 0.d0
          eg(2) = 0.5d0
        elseif (l.eq.3) then
          eg(1) = 0.5d0
          eg(2) = 0.d0
        end if
!.........three point gauss integration type 2
!         wg = 1/6.d0
!         if (l.eq.1) then
!           eg(1) = wg
!           eg(2) = wg
!         elseif (l.eq.2) then
!           eg(1) = 2/3.d0
!           eg(2) = wg
!         elseif (l.eq.3) then
!           eg(1) = wg
!           eg(2) = 2/3.d0
!         end if
!.....t1 gausspoint coordinates and weight factors
      else if (lint.eq.1) then
          wg = 1/2.d0
          eg(1) = 1/3.d0
          eg(2) = eg(1)
!.....q1 gausspoint coordinates and weight factors
      else if (lint.eq.4) then
        wg = 1.d0
        if (l.eq.1) then
          eg(1) = - 1.d0/dsqrt(3.d0)
          eg(2) = - 1.d0/dsqrt(3.d0)
        else if (l.eq.2) then
          eg(1) =   1.d0/dsqrt(3.d0)
          eg(2) = - 1.d0/dsqrt(3.d0)
        else if (l.eq.3) then
          eg(1) =   1.d0/dsqrt(3.d0)
          eg(2) =   1.d0/dsqrt(3.d0)
        else if (l.eq.4) then
          eg(1) = - 1.d0/dsqrt(3.d0)
          eg(2) =   1.d0/dsqrt(3.d0)
        end if
      else
        write(*,*) 'wrong quadrature lint=',lint
        stop
      end if
      
      return
      end
      
      
      
      subroutine shape04(nel,eg,xl,shp,detj)
!----------------------------------------------------------------------
!     gives ansatz functions for t1/t2 elements
!----------------------------------------------------------------------
      implicit none
!.....input
      integer nel        ! nodes per element 
      real*8 eg(2)       ! current gauss point coordinates (eg(1):xi, eg(2):eta)
      real*8 xl(2,nel)   ! nodal coordinates 
!.....output
      real*8 shp(3,nel)  ! shape functions and derivatives (output)
!                            shp(1,*) -> N,x
!                            shp(2,*) -> N,y
!                            shp(3,*) -> N
      real*8 detj        ! jacobi determinant (output)
!.....internal parameters
      integer i,j,ii     ! do loop parameters
      real*8 sh0(2,nel)  ! shape function derivatives wrt parameter coordinates
!                            sh0(1,*) -> N,xi
!                            sh0(2,*) -> N,eta
      real*8 jac(2,2)    ! jacobian   
      real*8 jiv(2,2)    ! inverse of the jacobian 

      if (nel.eq.6) then
!.......t2 shape functions
        shp(3,1) = (2.d0*eg(1)-1.d0)*eg(1) 
        shp(3,2) = (2.d0*eg(2)-1.d0)*eg(2) 
        shp(3,3) = (2.d0*(1.d0-eg(1)-eg(2))-1.d0)*(1.d0-eg(1)-eg(2)) 
        shp(3,4) = 4.d0*eg(1)*eg(2) 
        shp(3,5) = 4.d0*(1.d0-eg(1)-eg(2))*eg(2)
        shp(3,6) = 4.d0*eg(1)*(1.d0-eg(1)-eg(2)) 
!.......t2 shape function derivatives wrt parameter coordinates
        sh0(1,1) = 4.d0*eg(1)-1.d0
        sh0(1,2) = 0.d0
        sh0(1,3) = 1.d0-(4.d0*(1.d0-eg(1)-eg(2)))
        sh0(1,4) = 4.d0*eg(2)
        sh0(1,5) = -4.d0*eg(2)
        sh0(1,6) = 4.d0*((1.d0-eg(1)-eg(2))-eg(1))
        sh0(2,1) = 0.d0
        sh0(2,2) = 4.d0*eg(2)-1.d0
        sh0(2,3) = sh0(1,3)
        sh0(2,4) = 4.d0*eg(1)
        sh0(2,5) = 4.d0*((1.d0-eg(1)-eg(2))-eg(2))
        sh0(2,6) = -4.d0*eg(1)
      else if (nel.eq.3) then
!.......t1 shape functions
        shp(3,1) = eg(1) 
        shp(3,2) = eg(2) 
        shp(3,3) = 1.d0-eg(1)-eg(2) 
!.......t1 shape function derivatives wrt parameter coordinates
        sh0(1,1) = 1.d0
        sh0(1,2) = 0.d0
        sh0(1,3) = -1.d0
        sh0(2,1) = 0.d0
        sh0(2,2) = 1.d0
        sh0(2,3) = -1.d0
      else if (nel.eq.4) then
!.......q1 shape functions
        shp(3,1) = 0.25d0 * (1.d0 - eg(1)) * (1.d0 - eg(2))
        shp(3,2) = 0.25d0 * (1.d0 + eg(1)) * (1.d0 - eg(2))
        shp(3,3) = 0.25d0 * (1.d0 + eg(1)) * (1.d0 + eg(2))
        shp(3,4) = 0.25d0 * (1.d0 - eg(1)) * (1.d0 + eg(2))
!.......q1 shape function derivatives wrt parameter coordinates
        sh0(1,1) = - 0.25d0 * (1d0 - eg(2))
        sh0(1,2) =   0.25d0 * (1d0 - eg(2))
        sh0(1,3) =   0.25d0 * (1d0 + eg(2))
        sh0(1,4) = - 0.25d0 * (1d0 + eg(2))
        sh0(2,1) = - 0.25d0 * (1d0 - eg(1))
        sh0(2,2) = - 0.25d0 * (1d0 + eg(1))
        sh0(2,3) =   0.25d0 * (1d0 + eg(1))
        sh0(2,4) =   0.25d0 * (1d0 - eg(1))
      endif

!.....compute jacobian
      do i = 1,2
        do j = 1,2
          jac(i,j) = 0.d0
          do ii = 1,nel
            jac(i,j) = jac(i,j) + xl(i,ii)*sh0(j,ii)
          end do
         end do
      end do
      
!.....compute determinant of jacobian
      detj = jac(1,1)*jac(2,2) - jac(1,2)*jac(2,1)
      
!.....compute inverse of the jacobian
      jiv(1,1) =   jac(2,2)/detj
      jiv(2,2) =   jac(1,1)/detj
      jiv(2,1) = - jac(2,1)/detj
      jiv(1,2) = - jac(1,2)/detj
      
!.....compute shape function derivatives
      do ii = 1,nel
        shp(1,ii) = jiv(1,1)*sh0(1,ii)+ jiv(2,1)*sh0(2,ii)
        shp(2,ii) = jiv(1,2)*sh0(1,ii)+ jiv(2,2)*sh0(2,ii)
      end do
      return
      end
    
   
   
   
      subroutine bmat04(nel,shp,bmat)
!--------------------------------------------------------------------72
!     compute b-operator matrix
!----------------------------------------------------------------------
!.....the following parameters are used in this subroutine
      implicit none
!.....input
      integer nel        ! nodes per element
      real*8 shp(3,nel)  ! shape functions and derivatives
!                            shp(1,*) -> N,x
!                            shp(2,*) -> N,y
!                            shp(3,*) -> N 
      real*8 bmat(3,2*nel)! b-operator matrix at current gauss point
!     internal parameters
      integer i,j        ! do loop parameter

!.....compute entries of the b-operator matrix
      do i = 1,nel
        j = (2*i)-1
        bmat(1,j) = shp(1,i)
        bmat(2,j) = 0.d0 
        bmat(3,j) = shp(2,i)
        j = 2*i
        bmat(1,j) = 0.d0
        bmat(2,j) = shp(2,i)
        bmat(3,j) = shp(1,i)
      end do
      return
      end

     
     
     
     
      
      subroutine kemat04(s,bmat,aa,detj,wg,nst)
!----------------------------------------------------------------------      
!     compute element stiffness matrix
!----------------------------------------------------------------------    
!.....the following parameters are used in this subroutine
      implicit none
!.....input
      real*8 bmat(3,nst)  ! b-operator matrix at current gauss point
      real*8 aa(3,3)      ! elasticity matrix
      real*8 detj         ! jacobi determinant at current gauss point
      real*8 wg           ! weighting factor of current gauss point
      integer nst         ! total dof per element
!.....output
      real*8 s(nst,nst)   ! element stiffness matrix at current gauss point
!.....internal parameters
      integer i,j,kk      ! integers for do loops
      real*8 btc(nst,3)   ! matrix product B^T C 

!.....compute B^T.C
      btc = 0.0
      do i  = 1,nst
          do j  = 1,3
              do kk = 1,3
                  btc(i,j) = btc(i,j) + bmat(kk,i)*aa(kk,j)
              end do
          end do
      end do
      
!.....compute ke = Ae B^T.C.B
      do i  = 1,nst
          do j  = 1,nst
              do kk = 1,3
                  s(i,j) = s(i,j) + detj*wg*btc(i,kk)*bmat(kk,j)
              end do
          end do
      end do
      return   
      end
      
      
      
      
      subroutine str04(nel,ndf,nst,shp,bmat,aa,ul,eps,sig,xl,xg)
!----------------------------------------------------------------------
!     compute stresses and strains from current solution vector
!----------------------------------------------------------------------
!.....the following parameters are used in this subroutine
      implicit none
!.....input
      integer nel        ! nodes per element
      integer ndf        ! dof per node
      integer nst        ! total dof per element
      real*8 xl(2,nel)   ! nodal coordinates 
      real*8 shp(3,nel)  ! shape functions and derivatives
      real*8 bmat(3,nst) ! b-operator matrix at current gauss point
      real*8 aa(3,3)     ! 2d elasticity matrix
      real*8 ul(ndf,nel) ! solution vector (previous step)
!.....output
      real*8 eps(3)      ! 2d plain strain vector (voigt notation) (depending on gauss point)
      real*8 sig(4)      ! cauchy stresses at gp sig = [ s11, s22, s33, s12 ]     
      real*8 xg(2)       ! physical coordinates of current gauss point
!.....internal parameters
      real*8 du(nst)     ! flattened solution vector
      integer i          ! loop parameters

!.....compute flattened solution vector du
      if (nst.eq.(ndf*nel)) then
        do i = 1,nel
          du(2*i-1) = ul(1,i)
          du(2*i) = ul(2,i)
      end do
      else
        write(*,*) 'error occured when calculating strains: '
        write(*,*) 'element topology mismatch nst.neq.(ndf*nel)'
      end if
      
      
!.....compute physical gauss point coordinates
      xg = 0.0
      do i = 1,nel
        xg(1) = xg(1) + shp(3,i) * xl(1,i)
        xg(2) = xg(2) + shp(3,i) * xl(2,i)
      end do
      
!.....compute eps=B.du
      eps = 0.0
      do i = 1,nst
        eps(1) = eps(1) + bmat(1,i) * du(i) 
        eps(2) = eps(2) + bmat(2,i) * du(i)
        eps(3) = eps(3) + bmat(3,i) * du(i)
      end do
      
!.....compute sig=C.eps
      sig = 0.0
      do i = 1,3
        sig(1) = sig(1) + aa(1,i) * eps(i) ! sig11
        sig(2) = sig(2) + aa(2,i) * eps(i) ! sig22
        sig(4) = sig(4) + aa(3,i) * eps(i) ! sig12
      end do
      sig(3) = aa(2,1) * (eps(1) + eps(2)) ! sig33 = lambda*(eps11+eps22)
      
      return
      end
        
        
        
        
      subroutine stcn04(nel,ix,shp,detj,wg,sigp,numnp,dt,st)
!----------------------------------------------------------------------
!     project stresses to nodes for postprocessing plot
!----------------------------------------------------------------------
      implicit none
!...  add contribution of gauss point to global smoothed nodal stresses
!     number 24 of plot variables must correspond with npstr in /pdata3/
!.....input
      integer nel        ! nodes per element
      integer ix(*)      ! element global node numbers 
      real*8 shp(3,nel)  ! shape functions and derivatives at current gp
      real*8 detj        ! jacobi determinant at current gauss point
      real*8 wg          ! weighting factor of current gauss point
      real*8 sigp(24)    ! plotvector of stress values sigp(1::4).eq.sig
      integer numnp      ! number of global nodes
!.....output
      real*8 dt(*)       ! weighting coefficients
      real*8 st(numnp,*) ! projected data
!.....internal parameters
      integer i,ll,j

!.....compute st and dt
      do i = 1,nel
        ll = ix(i)
        if (ll.gt.0) then
          dt(ll)   = dt(ll) + shp(3,i) * wg * detj
          do j = 1,4!24
            st(ll,j) = st(ll,j) + shp(3,i) * sigp(j) * wg * detj
          end do
        end if
      end do
      
      return
      end
        
   
        
