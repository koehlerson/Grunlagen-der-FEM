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
      endif

!.....compute jacobian
    
      
!.....compute determinant of jacobian
      
      
!.....compute inverse of the jacobian
      
      
!.....compute shape function derivatives
      
      
      return
      end
      
      
      
      
      
      subroutine elmt04(d,ul,xl,ix,tl,s,p,ndf,ndm,nst,isw)
!----------------------------------------------------------------------      
! elmt04: linear/quadratic isoparametric triangular displacement element
!----------------------------------------------------------------------     
!.....the following parameters are used in this subroutine
      implicit  none
      include   'eldata.h'    ! nel (nodes per element)
!.....input
      integer ndf             ! dof per node
      integer ndm             ! space dimension
      integer nst             ! total dof per element
      integer isw             ! task parameter to control computation (used by main feap control program)
      integer ix(*)           ! element global node numbers 
      real*8 d(*)             ! elasticity parameters (here youngs modulus and poisson ratio)
      real*8 ul(ndf,*)        ! solution vector (previous step)
      real*8 xl(ndm,*)        ! nodal coordinates
      real*8 tl(*)            ! nodal temperature values (previous step, not used)
!.....output
      real*8 s(nst,nst)       ! element stiffness matrix
      real*8 p(nst)           ! element residual
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
      

!.....set gauss integration type
      nel = nst/ndf
      if (nel.eq.3) then
        lint = 1
      elseif (nel.eq.6) then
        lint = 3
      endif

      
      if(isw.eq.1) then
!.....read material values 
!       errck=pinput(d,2) ! (uncomment when placing in feappv)

      elseif(isw.eq.3 .or. isw.eq.4 .or. isw.eq.8) then
      
!.......compute elasticity matrix subroutine   
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
!.........compute element stiffness at current gauss point
          call kemat04(s,bmat,aa,detj,wg,nst)

    
        end do   ! end gauss loop
!----------------------------------------------------------------------    

      endif
      return
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
!     computes weighting factors ans coordinates of (t1/t2) gausspoints
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
        wg = 1/6.d0
        if (l.eq.1) then
          eg(1) = wg
          eg(2) = wg
        elseif (l.eq.2) then
          eg(1) = 2/3.d0
          eg(2) = wg
        elseif (l.eq.3) then
          eg(1) = wg
          eg(2) = 2/3.d0
        end if
!.....t1 gausspoint coordinates and weight factors
      else if (lint.eq.1) then
          wg = 1/2.d0
          eg(1) = 1/3.d0
          eg(2) = eg(1)
      else
        write(*,*) 'wrong quadrature lint=',lint
        stop
      endif
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
      real*8 bmat(3,2*nel)   ! b-operator matrix at current gauss point
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
        
