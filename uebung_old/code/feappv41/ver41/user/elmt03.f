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
      bmat(1,1) = (xl(2,2) - xl(2,3))/det
      bmat(1,3) = (xl(2,3) - xl(2,1))/det
      bmat(1,5) = (xl(2,1) - xl(2,2))/det
      bmat(2,2) = (xl(1,3) - xl(1,2))/det
      bmat(2,4) = (xl(1,1) - xl(1,3))/det
      bmat(2,6) = (xl(1,2) - xl(1,1))/det
      bmat(3,1) = bmat(2,2)
      bmat(3,2) = bmat(1,1)
      bmat(3,3) = bmat(2,4)
      bmat(3,4) = bmat(1,3)
      bmat(3,5) = bmat(2,6)
      bmat(3,6) = bmat(1,5)

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
                  s(i,j) = s(i,j) + 0.5d0*det*btc(i,kk)*bmat(kk,j)
              end do
          end do
      end do
         
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
       errck=pinput(d,2) ! (uncomment when placing in feappv)

      elseif(isw.eq.3 .or. isw.eq.4 .or. isw.eq.8) then    
!.....compute element area det(A) = 2 Ae
      det = (xl(1,2) - xl(1,1))*(xl(2,3) - xl(2,1))
     &       -(xl(1,3) - xl(1,1))*(xl(2,2) - xl(2,1))

!.....compute b-operator matrix     
      call bmat03(bmat,xl,det)
            
!.....compute elasticity matrix C
      call dmat03(d(1),d(2),aa)
    
!.....compute ke
      call kemat03(s,bmat,aa,det,nst)
      
      endif
      return
      end
      
