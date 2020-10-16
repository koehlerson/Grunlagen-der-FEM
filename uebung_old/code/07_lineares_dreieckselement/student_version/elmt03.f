      subroutine dmat03(yo,nu,aa)
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

!.....compute entries of the elacticity matrix

      return
      end 
      
      
      subroutine bmat03(bmat,xl,det)
!--------------------------------------------------------------------72
!     compute b-operator matrix
!----------------------------------------------------------------------
!.....the following parameters are used in this subroutine
      implicit none
      real*8 bmat(3,6)   ! b-operator matrix
      real*8 xl(2,3)     ! nodal coordinates of the element
      real*8 det         ! det(A) = 2 A_e elment area

!.....compute entries of the b-operator matrix  

      return
      end

      
      
      subroutine kemat03(s,bmat,aa,det,nst)
!----------------------------------------------------------------------      
!     compute element stiffness matrix
!----------------------------------------------------------------------    
      implicit none
!.....the following parameters are used in this subroutine
      integer i,j,kk      ! integers for do loops
      integer nst         ! total dof per element
      real*8 bmat(3,nst)  ! b-operator matrix
      real*8 aa(3,3)      ! elasticity matrix
      real*8 btc(nst,3)   ! matrix product B^T C 
      real*8 s(nst,nst)   ! element stiffness matrix
      real*8 det          ! det(A) = 2 Ae element area

!.....compute B^T.C
      
!.....compute ke = Ae B^T.C.B
       
      end
      
      
      subroutine elmt03(d,ul,xl,ix,tl,s,p,ndf,ndm,nst,isw)
!----------------------------------------------------------------------      
! elmt03: triangular linear displacement element (t1)
!----------------------------------------------------------------------     
      implicit  none
!.....the following parameters are used in this subroutine
      integer ndf         ! dof per node
      integer ndm         ! space dimension
      integer nst         ! total dof per element
      integer isw         ! task parameter to control computation (used by main feap control program)
      integer ix(*)       ! element global node numbers 
      real*8 d(*)         ! elasticity parameters (here youngs modulus and poisson ratio)
      real*8 ul(ndf,*)    ! solution vector
      real*8 xl(ndm,*)    ! nodal coordinates
      real*8 tl(*)        ! nodal temperature values (not used)
      real*8 s(nst,nst)   ! element stiffness matrix
      real*8 p(nst)       ! element residual
      real*8 det          ! det(A) = 2 Ae element area
      real*8 bmat(3,nst)  ! b-operator matrix
      real*8 aa(3,3)      ! elasticity matrix
      logical errck,pinput

      
      if(isw.eq.1) then
!.....read material values 
!       errck=pinput(d,2) ! (uncomment this line when placing in feappv)

      elseif(isw.eq.3 .or. isw.eq.4 .or. isw.eq.8) then    

!.....compute element area det(A) = 2 Ae

!.....compute b-operator matrix     
            
!.....compute elasticity matrix C
    
!.....compute ke
      
      endif
      end
      
