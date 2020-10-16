      program spring
c---------------------------------------------------------------------72
c
c   lr    - =l0 body position for relaxed springs
c   x     - deflection 
c   Force - force
c   c     - spring constant
c   f     - function 
c   fs    - first derivate
c   dx    - Increment 
c   lsa   - actual length of a spring
c   lsr   - relaxed length of a spring
c
c-----7---------------------------------------------------------------72
      implicit none 
      integer iter
	real*8 h,l,Force,c,f,fs,l0,dx,fnorm,lsr,lsa,tol,x
c      
      h     =  0.1d0
	l0    =  0.3d0
	Force = 10.0d0
	c     = 20.0d0
	tol   = 1e-14
	lsr   = dsqrt(h*h + l0*l0)
      open(40,file='newton.dat',status='unknown')
c
      x = -0.18d0
	do iter = 1,10
        lsa   = dsqrt(h*h + (l0 + x)*(l0 + x))
	  f     = 2.0d0*c*(l0 + x - lsr*(l0 + x)/lsa) - Force
        fs    = 2.0d0*c - 2.0d0*c*lsr*(h*h)/(lsa*lsa*lsa)
        fnorm = dsqrt(f*f)
c	  write(40,*)'current increment',x,'function value',f
	  write(40,*),x,f
	  if (fnorm .lt. tol) then
	    write(*,*)'end value =',x
	    write(*,*)'END'
	    stop
	  else 
          dx = -f/fs
	    x = x + dx
	  end if
	end do
	end
