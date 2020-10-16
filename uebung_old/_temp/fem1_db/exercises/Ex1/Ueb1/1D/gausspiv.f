      subroutine gausspivot(a,b,x,nmax,n)
c---------------------------------------------------------------------72
c     Gauss- Gleichungslöser mit Pivotstrategie
c     Lösung des linearen Gleichungssystems  A * x = b nach x
c      LR-Zerlegung mit Zeilentausch P*A=L*R
c
c     Programmiert von J. Löblein, 04.10.2000
c
c     Literatur: Schwarz, H. R., Numerische Mathematik, Teubner
c
c     Parameter Liste: 
c...  Übergabeliste
c       a(nmax,nmax) : Koeffizientenmatrix
c       b(nmax)      : Rechte Seite
c       x(nmax)      : Lösungsvektor
c       nmax         : Maximale Feldgröße
c       n            : Anzahl der Gitterpunkte
c...  Lokale Felder
c       ip(nmax)     : Vektor für Zeilenvertauschungen
c       c(nmax)      : Modifizierte rechte Seite
c---------------------------------------------------------------------72
      implicit none
      integer nmax,i,j,k,n
      integer ip(100)
      real*8 max,sum,dabs,q,h
      real*8 a(nmax,nmax),b(nmax), c(nmax),x(nmax)
c
      if(nmax .gt. 100) then
        write(*,*)'     Falsche Dimensionierung von ip(100)'
        stop   
      endif
c      
c...   Pivotsuche
      do k = 1,n-1
         max  = 0.d0
	 ip(k) = 0
	 do i = k,n
	    sum = 0.d0
	    do j = k,n
	       sum = sum + dabs(a(i,j))
	    end do
	    q = dabs(a(i,k))/sum
	    if (q .gt. max) then
	       max  = q
	       ip(k)= i
            endif
         end do
	 if (dabs(max) .lt. 1.d-16) stop
c	 
c...  Zeilen vertauschen	 
 	 if (ip(k) .ne. k) then
	    do j = 1,n
	               h = a(k,j)
  	          a(k,j) = a(ip(k),j)
  	       a(ip(k),j) = h
	    end do
	 end if
c
c...     Bildung der rechten oberen Dreiecksmatrix
	 do i = k+1,n
	    a(i,k)= a(i,k)/a(k,k)
	    do j = k+1,n
	       a(i,j) = a(i,j) - a(i,k)* a(k,j)
	    end do
	 end do
      end do  
c
c...  Aufbau der rechten Seite, Vorwaertseinsetzen, Komponenten von
c...  b vertauschen
      do k = 1,n-1
	 if (ip(k) .ne. k) then
                   h = b(k)
                b(k) = b(ip(k))
            b(ip(k)) = h 
         endif
      end do  
      do i = 1,n
         c(i) = b(i)
         do j = 1,i-1
            c(i) = c(i) - a(i,j)*c(j) 
         end do 
      end do
c
c...  Rückwärtseinsetzen
      do i = n,1,-1
         sum = c(i)
         do k = i+1,n
            sum = sum - a(i,k)*x(k)
         end do
         x(i) = sum/a(i,i)
      end do
c
      return
      end
 
