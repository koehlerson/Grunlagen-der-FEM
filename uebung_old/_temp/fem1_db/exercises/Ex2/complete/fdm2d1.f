      program fdm
c---------------------------------------------------------------------72
c     Example 2: Metal plate with stationary temperature distribution
c     Numerical solution with Finite-Difference-Method
c
c     D. Balzani, April 21, 2008
c
c     Parameters:
c     n        size of coefficient matrix a
c     a(n,n)   coefficient matrix
c     b(n)     right hand side vector
c...  output
c     x(n)     solution vector
c----------------------------------------------------------------------
      implicit none
c
      integer n,nmax,i,k,j
      parameter (nmax=10)                                            
      real*8 a(nmax,nmax),b(nmax),x(nmax)
c
c...  Number of inner grid points
      n = 9
c
c...  Open output file
      open (1, file='example2.dat')
c
c...  Initialize fields
      do i=1,n
        do j=1,n
          a(i,j) = 0.d0
        enddo
        b(i) = 0.d0
      enddo
c
c...  coefficient matrix a
      do i=1,n
        a(i,i) = 4.d0
      enddo
      a(1,2) = -1.d0
      a(1,4) = -1.d0
      a(2,3) = -1.d0
      a(2,5) = -1.d0
      a(3,6) = -1.d0
      a(4,5) = -1.d0
      a(4,7) = -1.d0
      a(5,6) = -1.d0
      a(5,8) = -1.d0
      a(6,9) = -1.d0
      a(7,8) = -1.d0
      a(8,9) = -1.d0
c     symmetrize
      do i=1,n
        do j=i+1,n
          a(j,i) = a(i,j)
        enddo
      enddo
c
c...  right hand side vector
      b(3) = 25.d0
      b(6) = 50.d0
      b(7) = 25.d0
      b(8) = 50.d0
      b(9) = 150.d0
c
c...  screen output
      write(*,*)
      write(*,*)'coefficient matrix:'
      do i=1,n
        write(*,100)(a(i,j),j=1,n)
      enddo
      write(*,*)
      write(*,*)'right hand side:'
      do i=1,n
        write(*,200)b(i)
      enddo
      write(*,*)
c
c...  solve system of equations
      call gausspivot(a,b,x,nmax,n)
c
c...  screen output of solution vector
      write(*,*)'solution vector:'
      do i=1,n
        write(*,200)x(i)
      enddo
      write(*,*)
c
c...  file output of solution vector
      do i=1,n
        write (1, 200) x(i)
      end do	
c
 100  format (9f6.1)
 200  format (f10.3)
      end 
