      subroutine elmt03(d,ul,xl,ix,tl,s,p,ndf,ndm,nst,isw)
c-----------------------------------------------------------------------
c     elmt03  : Lineares Verschiebungs-Dreieckselement
c
c     Parameterliste
c       d(1) = yo    E-Modul
c       d(2) = nu    Querdehnzahl
c       ul(ndf,*)    Loesungsvektor
c       xl(ndm,nel)  Knotenkoordinaten
c       s(nst,nst)   Steifigkeitsmatrix
c       p(nst)       Last-Vektor, Residuum
c       ndf          Anzahl der Freiheitsgrade
c       ndm          Dimensionen der Knoten
c       nst          Anzahl der Elementfreiheitsgrade
c       isw          Execution flag
c     Plot-Befehle
c       stre,1       Plotten von Sigma_xx 
c       stre,2       Plotten von Sigma_yy
c       stre,3       Plotten von Sigma_xy
c-----------------------------------------------------------------------
      implicit none
      include   'bdata.h'
      include   'cdata.h'
      include   'debugs.h'
      include   'eldata.h'
      include   'iofile.h'
      include   'prstrs.h'
      integer ix(*)
      integer ndf,ndm,nst,isw
      integer i,j,kk
      real*8 d(*),ul(ndf,*),xl(ndm,*),tl(*),s(nst,nst),p(*)
      real*8 bmat(3,6),aa(3,3),vl(6),eps(3),sig(3),btc(6,3)
      real*8 det,yo,nu
      real*8 hr(1000)
      common hr
      logical errck,pinput
c
      if(isw.eq.1) then
c-----------------------------------------------------------------------
c...  Einlesen der Materialwerte 
    1 if(ior.lt.0) write(*,3000)
        errck=pinput(d,2)
        if(errck) go to 1
        if(ior.lt.0) then
          write(*,2000) d(1),d(2)
        end if
        write(iow,2000) d(1),d(2)
c
      elseif(isw.eq.2) then
c-----------------------------------------------------------------------
c...  Elementcheck auf Fehler  
        if(d(1) .le. 0.d0) then
          write(*,*)' E-Modul .le. 0'
          stop
        end if
c 
      elseif(isw.eq.3 .or. isw.eq.4 .or. isw.eq.8) then
c-----------------------------------------------------------------------
c...  Berechnung der Steifigkeitsmatrix und des Residuums 
c...  Material- und Elementparameter
        yo  = d(1)
        nu  = d(2)
c...  Berechnung der doppelten Flaeche (Determinante)
        det = (xl(1,2) - xl(1,1))*(xl(2,3) - xl(2,1))
     &       -(xl(1,3) - xl(1,1))*(xl(2,2) - xl(2,1))
c...  Berechnung der B-Matrix
        call pzero(bmat,3*6)
        call bmat03(bmat,xl,det)
c...  Berechnung der Verzerrungen
c...  eps(1) = eps_11 , eps(2) = eps_22 , eps(3) = 2*eps_12
        vl(1) = ul(1,1)
        vl(2) = ul(2,1)
        vl(3) = ul(1,2)
        vl(4) = ul(2,2)
        vl(5) = ul(1,3)
        vl(6) = ul(2,3)
        call pzero(eps,3*1)
        do i = 1,3
          do j = 1,6
            eps(i) = eps(i) + bmat(i,j)*vl(j)
          end do
        end do
c...  Berechnung des Stoffgesetzes
        call pzero(aa,3*3)
        call dmat03(yo,nu,aa)
c...  Berechnung der Spannungen
        call pzero(sig,3*1)
        do i=1,3
          do j=1,3
            sig(i) = sig(i) + aa(i,j)*eps(j)
          end do
        end do
        if (isw .eq. 4) then
c...  Ausgabe der Spannungen Sigma_xx, Sigma_yy, Sigma_xy
          write(*,100)
          write(*,105) n, sig(1), sig(2), sig(3)
          write(iow,100)
          write(iow,105) n, sig(1), sig(2), sig(3)
c...  Graphische Ausgabe der Spannungen
        elseif(isw.eq.8) then
          call stcn03(ix,sig,hr(nph),hr(nph+numnp),
     &                 nel,numnp,ndf)
        elseif(isw.eq.3) then
c...  Berechnung des Residuums
          do i=1,nst
            do j=1,3
              p(i) = p(i) - 0.5d0*det*bmat(j,i)*sig(j)
            end do
          end do
c...  Berechne B^T C
        call pzero(btc,6*3)
          do i  = 1,nst
            do j  = 1,3
               do kk = 1,3
                 btc(i,j) = btc(i,j) + bmat(kk,i)*aa(kk,j)
               end do
            end do
          end do
c...  Berechne B^T C B = Steifigkeitsmatrix
          do i  = 1,nst
            do j  = 1,nst
              do kk = 1,3
                s(i,j) = s(i,j) + 0.5d0*det*btc(i,kk)*bmat(kk,j)
              end do
            end do
          end do
c
        end if  ! isw=3,4,8
      end if   !isw=1,2,3,4,5,6,7,8
c
c----------------------------------------------------------------------
c...  Formatanweisungen
 100  format(5x,'Elementnr.', 3x,'Sigma x',6x,'Sigma y',6x,'Sigma xy')
 105  format(7x,i3.1,4x,e12.5,1x,e12.5,1x,e12.5)
2000  format(5x,'Lineares Dreieckselement:'//
     &   5x,'E-Modul                           yo = ',e12.5/
     &   5x,'Querdehnzahl                      nu = ',e12.5/)
3000  format(' Input:   yo, nu '/'   >',$)
      end
c
c 
      subroutine bmat03(bmat,xl,fakt)
c--------------------------------------------------------------------72
c     Berechnung des B-Operators
c       Paramterliste
c       bmat(3,6)  B-Operator
c       xl         Knotenkoordinaten 
c       fakt       Faktor (hier: Determinante von A)
c----------------------------------------------------------------------
      implicit none
      real*8 bmat(3,6),xl(2,3)
      real*8 fakt
c
      bmat(1,1) = (xl(2,2) - xl(2,3))/fakt
      bmat(1,3) = (xl(2,3) - xl(2,1))/fakt
      bmat(1,5) = (xl(2,1) - xl(2,2))/fakt
      bmat(2,2) = (xl(1,3) - xl(1,2))/fakt
      bmat(2,4) = (xl(1,1) - xl(1,3))/fakt
      bmat(2,6) = (xl(1,2) - xl(1,1))/fakt
      bmat(3,1) = bmat(2,2)
      bmat(3,2) = bmat(1,1)
      bmat(3,3) = bmat(2,4)
      bmat(3,4) = bmat(1,3)
      bmat(3,5) = bmat(2,6)
      bmat(3,6) = bmat(1,5)
c
      return
      end
c
c
      subroutine dmat03(yo,nu,aa)
c----------------------------------------------------------------------
c     Berechnung des Stoffgesetzes
c       Parameterliste
c       yo      E-Modul
c       nu      Querdehnzahl
c       aa(3,3) Materialgesetz
c----------------------------------------------------------------------
      implicit none
      real*8 yo,nu,lambda,mue
      real*8 aa(3,3)
c
      lambda = yo*nu/((1.d0 + nu)*(1.d0 - 2.d0*nu))
      mue = yo/(2.d0*(1+nu))
      aa(1,1) = lambda + 2.d0*mue
      aa(2,2) = aa(1,1)
      aa(1,2) = lambda
      aa(2,1) = aa(1,2)
      aa(3,3) = mue
c
      return
      end
c      
c
      subroutine stcn03(ix,sig,dt,st,nel,numnp,ndf)
c---------------------------------------------------------------------
c     Graphische Ausgabe der Spannungen
c     Resulate werden direkt in den blank common hr geschrieben
c     Parameterliste
c       ix(nel)       Globale Knotennummern
c       sig(3)        Spannungen
c       st(numnp,1)   Projizierte Temperaturwerte
c       nel           Anzahl der Knoten pro Element
c       numnp         Anzahl der Knoten des Systems
c       ndf           Anzahl der Elementfreiheitsgrade
c---------------------------------------------------------------------
      implicit none
      integer nel,numnp,nod,gnod,ndf
      integer ix(nel)
      real*8 dt(numnp),st(numnp,3),sig(3)
c      
      do nod=1,nel
        gnod = ix(nod)
        if (gnod.gt.0) then
          dt(gnod) = 1.d0
          st(gnod,1) = sig(1)
          st(gnod,2) = sig(2)
          st(gnod,3) = sig(3)
        end if
      end do
c
      return
      end
    

