      program tensorf
c
      implicit none 
      integer i,j,k
	real*8 H(3,3),expH(3,3),I1,I2,I3,lambda(3),nni(3,3,3),squares(3,3)
      real*8 invH(3,3),fi,alpha,fac,pi,sinusH(3,3),cosinusH(3,3)
	real*8 altsquare(3,3)
c      
      H(1,1) = 3.0d0
	H(1,2) = 2.0d0
	H(1,3) = 0.0d0
	H(2,1) = 2.0d0
	H(2,2) = 4.0d0
	H(2,3) = 0.0d0
	H(3,1) = 0.0d0
	H(3,2) = 0.0d0
	H(3,3) = 1.0d0
      call eigensol(H,I1,I2,I3,nni,lambda)
	call exponetialH(nni,lambda,expH)
	call sinusfunH(nni,lambda,sinusH)
	call cosinusfunH(nni,lambda,cosinusH)
	call squaresincosH(sinusH,cosinusH,squares)
	call altsquarefunH(nni,lambda,altsquare)
      write(*,*)'EXPONENTIAL'
	do j = 1,3
        write(*,*)expH(j,1),expH(j,2),expH(j,3)
      end do
      write(*,*)'------------------------------------------------------'
      write(*,*)'SINUS'
      do j = 1,3
        write(*,*)sinusH(j,1),sinusH(j,2),sinusH(j,3)
      end do
      write(*,*)'------------------------------------------------------'
      write(*,*)'COSINUS'
      do j = 1,3
        write(*,*)cosinusH(j,1),cosinusH(j,2),cosinusH(j,3)
      end do
      write(*,*)'------------------------------------------------------'
      write(*,*)'SQUARES'
      do j = 1,3
        write(*,*)squares(j,1),squares(j,2),squares(j,3)
      end do
      write(*,*)'------------------------------------------------------'
      write(*,*)'ALTSQUARE'
      do j = 1,3
        write(*,*)altsquare(j,1),altsquare(j,2),altsquare(j,3)
      end do
      end

	subroutine eigensol(H,I1,I2,I3,nni,lambda)
c---------------------------------------------------------------------72
c   Input: H
c
c   Output: I1, I2, I3, nni, lambda
c
c   I1-3       - invariants of H
c   lambda1-3  - eigenvalues of H
c   nni(3,3,i) - for i=1,2,3 eigenbases of H
c  
c-----7---------------------------------------------------------------72
      implicit none 
      integer i,j,k
	real*8 H(3,3),I1,I2,I3,lambda(3),nni(3,3,3),fi,alpha,fac,pi
      real*8 invH(3,3)
c
	pi = 4.0d0*datan(1.0d0)
c     invariants
      I1 = H(1,1) + H(2,2) + H(3,3)
      I2 = H(2,2)*H(3,3) - H(3,2)*H(2,3) + H(1,1)*H(3,3) -H(3,1)*H(1,3)
     &    +H(1,1)*H(2,2) - H(2,1)*H(1,2)
      I3 =  (H(2,2)*H(3,3) - H(3,2)*H(2,3))*H(1,1)
     &    - (H(2,1)*H(3,3) - H(3,1)*H(2,3))*H(1,2)    
     &    + (H(2,1)*H(3,2) - H(3,1)*H(2,2))*H(1,3) 
c     eigenvalues of H
      alpha = acos((2.0d0*(I1**3) - 9.0d0*I1*I2 + 27.0d0*I3)
     &        /(2.0d0*dsqrt( (I1**2 - 3.0d0*I2)**3 ) ))
      do i = 1,3
        lambda(i) = (I1 + 2.0d0*dsqrt(I1**2 - 3.0d0*I2)
     &              *cos( (alpha+(2.0d0*pi*i))/3.0d0) )/3.0d0
      end do
c     inverse of H
      invH(1,1) = + (H(2,2)*H(3,3) - H(3,2)*H(2,3))/I3
	invH(1,2) = - (H(2,1)*H(3,3) - H(3,2)*H(1,3))/I3
	invH(1,3) = + (H(1,2)*H(2,3) - H(2,2)*H(1,3))/I3
	invH(2,1) = - (H(2,1)*H(3,3) - H(3,1)*H(2,3))/I3
	invH(2,2) = + (H(1,1)*H(3,3) - H(3,1)*H(1,3))/I3
	invH(2,3) = - (H(1,1)*H(2,3) - H(2,1)*H(1,3))/I3
	invH(3,1) = + (H(2,1)*H(3,2) - H(3,1)*H(2,2))/I3
	invH(3,2) = - (H(1,1)*H(3,2) - H(3,1)*H(1,2))/I3
	invH(3,3) = + (H(1,1)*H(2,2) - H(2,1)*H(1,2))/I3
c     eigenbases of H
      do i = 1,3
        fi = lambda(i)/((lambda(i)**2)*2.0d0-I1*lambda(i)+I3/lambda(i))
        do j = 1,3
	    do k = 1,3
	      nni(j,k,i) = fi*(H(j,k) + (I3*invH(j,k))/lambda(i))        
            if(j .eq. k) nni(j,k,i) = nni(j,k,i) - fi*(I1-lambda(i)) 
          end do
	  end do
      end do
	return
      end

	subroutine exponetialH(nni,lambda,expH)
c---------------------------------------------------------------------72
c   Input: nni, lambda
c
c   Output: expH
c
c   lambda1-3  - eigenvalues of H
c   nni(3,3,i) - for i=1,2,3 eigenbases of H
c   expH       - exponetial function of H
c  
c-----7---------------------------------------------------------------72
      implicit none 
      integer i,j,k
	real*8 expH(3,3),lambda(3),nni(3,3,3)
c     set expH equal zero
      do j = 1,3
        do k = 1,3
          expH(j,k) = 0.0d0 
        end do
      end do
c     exponential of H
      do i = 1,3
	  do j = 1,3
	    do k = 1,3
	      expH(j,k) = expH(j,k) + dexp(lambda(i))*nni(j,k,i) 
          end do
	  end do
	end do
	return
      end

	subroutine sinusfunH(nni,lambda,sinusH)
c---------------------------------------------------------------------72
c   Input: nni, lambda
c
c   Output: sinusH
c
c   lambda1-3  - eigenvalues of H
c   nni(3,3,i) - for i=1,2,3 eigenbases of H
c   sinusH     - sinus function of H
c  
c-----7---------------------------------------------------------------72
      implicit none 
      integer i,j,k
	real*8 lambda(3),nni(3,3,3),sinusH(3,3)
c     set sinusH equal zero
      do j = 1,3
        do k = 1,3
          sinusH(j,k) = 0.0d0 
        end do
      end do
c     sinus of H
      do i = 1,3
	  do j = 1,3
	    do k = 1,3
	      sinusH(j,k) = sinusH(j,k) + dsin(lambda(i))*nni(j,k,i) 
          end do
	  end do
	end do
	return
      end

	subroutine cosinusfunH(nni,lambda,cosinusH)
c---------------------------------------------------------------------72
c   Input: nni, lambda
c
c   Output: cosinusH
c
c   lambda1-3  - eigenvalues of H
c   nni(3,3,i) - for i=1,2,3 eigenbases of H
c   cosinusH   - cosinus function of H
c  
c-----7---------------------------------------------------------------72
      implicit none 
      integer i,j,k
	real*8 lambda(3),nni(3,3,3),cosinusH(3,3)
c     set sinusH equal zero
      do j = 1,3
        do k = 1,3
          cosinusH(j,k) = 0.0d0 
        end do
      end do
c     cosinus of H
      do i = 1,3
	  do j = 1,3
	    do k = 1,3
	      cosinusH(j,k) = cosinusH(j,k) + dcos(lambda(i))*nni(j,k,i) 
          end do
	  end do
	end do
	return
      end

	subroutine squaresincosH(sinusH,cosinusH,squares)
c---------------------------------------------------------------------72
c   Input: sinusH, cosinusH
c
c   Output: squares
c
c   cosinusH   - cosinus function of H
c   sinusH     - sinus function of H
c   squares    - cosH^2 +  sinH^2
c
c-----7- --------------------------------------------------------------72
      implicit none 
      integer i,j,k
	real*8 cosinusH(3,3),sinusH(3,3),squares(3,3)
c     set squares equal zero
      do j = 1,3
        do k = 1,3
          squares(j,k) = 0.0d0 
        end do
      end do
c     compute squares
      do i = 1,3
        do j = 1,3
          do k = 1,3
            squares(i,j) = squares(i,j) + cosinusH(i,k)*cosinusH(k,j) +
     &                     sinusH(i,k)*sinusH(k,j)
          end do
        end do
	end do
	return
      end

c     ALTERNATIV
	subroutine altsquarefunH(nni,lambda,altsquare)
c---------------------------------------------------------------------72
c   Input: nni, lambda
c
c   Output: altsquareH
c
c   lambda1-3  - eigenvalues of H
c   nni(3,3,i) - for i=1,2,3 eigenbases of H
c   altsquareH - cosH^2 +  sinH^2
c  
c-----7---------------------------------------------------------------72
      implicit none 
      integer i,j,k
	real*8 lambda(3),nni(3,3,3),altsquare(3,3)
c     set sinusH equal zero
      do j = 1,3
        do k = 1,3
          altsquare(j,k) = 0.0d0 
        end do
      end do
c     cosinus of H
      do i = 1,3
	  do j = 1,3
	    do k = 1,3
	      altsquare(j,k) = altsquare(j,k) 
     &	                   + (dsin(lambda(i))**2)*nni(j,k,i) 
     &	                   + (dcos(lambda(i))**2)*nni(j,k,i) 
          end do
	  end do
	end do
	return
      end

