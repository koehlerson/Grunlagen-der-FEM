      program fdm1d1
c---------------------------------------------------------------------72
c     Beispiel1: Beam with constant stiffness under constant load
c     Numerical solution with the Finite-Difference-Method
c
c     copyright Daniel Balzani, 2008
c
c     Parameters:
c...  Input:                                                          
c       n,ll,yo,area,pp
c       n            : Number of grid points
c       ll           : beam length
c       yo           : E-Modulus
c       area         : cross-sectional area
c       pp           : constant load
c...  Output:
c       x            : physical location x
c       u            : displacement u(x)
c...  Local fields:
c       a(nmax,nmax) : coefficient matrix
c       b(nmax)      : right hand side vector
c---------------------------------------------------------------------72
      implicit none
      integer nmax,i,j,n
      parameter (nmax=15)
      real*8 ll,yo,area,pp,hh,fakt
      real*8 a(nmax,nmax),b(nmax),x,u(nmax)
c
c...  Open input and output file
      open (1, file='beispein.dat')
      open (2, file='beispaus.dat')
c
c...  Read system values from file 'beispein.dat'
      read (1, *) n,ll,yo,area,pp 
c 
c...  Initialisize quantities     
c     ???
c
c 
c...  Compute coefficient matrix
c     ???
c
c
c...  Compute right hand side vektor
c     ???
c
c
c...  Solve linear system of equations
      call gausspivot(a,b,u,nmax,n-1)
c
c...  Plot solution into file 'beispaus.dat'
      write (2,200) 0.d0, 0.d0
      do i=1,n-1
         x = dble(i)*hh
         write (2,200) x, u(i)
      end do
      write (2,200) ll, 0.d0
 200  format (f10.3,f10.3)
      end


