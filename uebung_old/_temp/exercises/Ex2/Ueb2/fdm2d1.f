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
c     ???
c
c
c...  coefficient matrix a
c     ???
c
c
c...  right hand side vector
c     ???
c
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
