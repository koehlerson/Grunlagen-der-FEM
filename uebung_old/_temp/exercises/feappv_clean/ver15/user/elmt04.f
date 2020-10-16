      subroutine elmt04(d,ul,xl,ix,tl,s,p,ndf,ndm,nst,isw)
c---------------------------------------------------------------------72
c     Nichtlineares 3-D Truss-Element                                   
c     Standard-Verschiebung-Formulierung ???
c
c     Parameterliste
c       d(1-2)       Material- und Elementparameter
c       d(1)  = E    - E-Modul        
c       d(2)  = A    - Querschnittsflaeche  
c       ul(ndf,*)    Loesungsvektor (=Verschiebungen)
c       xl(ndm,nel)  Knotenkoordinaten
c       ix(nel)      Globale Knotennummer
c       s(nst,nst)   Steifigkeitsmatrix
c       p(nst)       Residuum
c       ndf          Anzahl der Freiheitsgrade pro Knoten
c       ndm          Dimensionen der Knoten
c       nst          Anzahl der Elementfreiheitsgrade
c       isw          Execution flag
c       n            Element Number (via eldata common block)
c
c...  Bedeutung der Steuerungsparameter
c       isw = 1 : Einlesen der Materialparameter (Vektor d(*))
c       isw = 2 : Elementueberpruefung auf Eingabefehler
c       isw = 3 : Berechnung der Steifigkeitsmatrix und des Residuums
c       isw = 4 : Ausgabe der Elementvariablen 
c---------------------------------------------------------------------72
      implicit none
      include   'bdata.h'
      include   'cdata.h'
      include   'debugs.h'
      include   'eldata.h'
      include   'iofile.h'
      integer ix(*)
      integer ndf,ndm,nst,isw
      integer i,j
      real*8 d(*),ul(ndf,*),xl(ndm,*),xlA(ndm,nel)
      real*8 tl(*),s(nst,nst),p(*)
      real*8 E, A, lE0, lE, t(3), F11, E11, S11, Sig11
      real*8 force, fInt, kEtilde
      logical errck,pinput
c
      if(isw.eq.1) then
c-----------------------------------------------------------------------
c...  Einlesen der Materialwerte 
    1 if(ior.lt.0) write(*,3000)
        errck=pinput(d,2)
        if(errck) go to 1
c        if(ior.lt.0) then
          write(*,2000) d(1),d(2)
c        end if
        write(iow,2000) d(1),d(2)
c
      elseif(isw.eq.2) then
c-----------------------------------------------------------------------
c...  Elementcheck auf Fehler  
        if(d(1) .le. 0.d0) then
          write(*,*)'  E-Modul .le. 0.d0'
          stop
        endif
        if(ndf .ne. ndm) then
          write(*,*)'  ndf .ne. ndm'
          stop
        endif
c 
        elseif(isw.eq.3 .or. isw.eq.4 .or. isw.eq.6) then
c-----------------------------------------------------------------------
c...  Berechnung der Steifigkeitsmatrix und des Residuums
          E=d(1)
          A=d(2)
c...  Berechnung der Element-Ausgangs-Laenge
          lE0=dsqrt((xl(1,2)-xl(1,1))**2
     &             +(xl(2,2)-xl(2,1))**2
     &             +(xl(3,2)-xl(3,1))**2)
c...  Berechnung der aktuellen Knotenpositionen
          do j=1,nel
            do i=1,ndm
              xlA(i,j)=xl(i,j)+ul(i,j)
            end do
          end do
c...  Berechnung der aktuellen Element-Laenge
          lE=dsqrt((xlA(1,2)-xlA(1,1))**2
     &            +(xlA(2,2)-xlA(2,1))**2
     &            +(xlA(3,2)-xlA(3,1))**2)
c...  Berechnung des (aktuellen) Normalenvektors
c...  in Richtung der Stabachse
          do i=1,ndm
            t(i)=(xlA(i,2)-xlA(i,1))/lE
          end do
c...  Berechnung des Deformationsgradienten
          F11=lE/lE0
c...  Berechnung der Green-Lagrangeschen Verzerrung
          E11=0.5d0*(F11*F11-1.0d0)
c...  Berechnung der 2. Piola-Kirchhoff-Spannung
c...  (St. Venant-Material-Modell)
          S11=E11*E
c...  Berechnung der Cauchy-Spannung Sigma=J^-1 F S F^T
          Sig11=S11*F11
c...  Ausgabeanweisungen, Schnittgroessen
        if(isw .eq. 4)then
          force=Sig11*d(2)
          write(*,3001) n,S11, force
          write(iow,3001) n,S11, force
c...  Berechnung des Anteils der inneren Knotenkr"afte
c...  des Residuums fInt := [-t t]^T A S11 F11
c...  und Subtraktion von FEAP's Fehlkraftvektor p(i);
        elseif(isw .eq. 3 .or. isw.eq.6)then  
          do i=1,ndf
            fInt = -t(i)*A*S11*F11
            p(i)     = p(i)    -fInt
            p(i+ndf) = p(i+ndf)+fInt
          end do
c...  Berechnung der Steifigkeitsmatrix
          if(isw .eq. 3)then  
            do j=1,ndf
              do i=1,ndf
                kEtilde   = E*F11*F11*t(i)*t(j)
                if(i.eq.j)then
                  kEtilde = kEtilde+S11
                endif
                kEtilde = A/lE0*kEtilde
                s(i,j)        =  kEtilde
                s(i+ndf,j)    = -kEtilde
                s(i,j+ndf)    = -kEtilde
                s(i+ndf,j+ndf)=  kEtilde
              end do
            end do
          endif  ! isw=3
        endif  ! isw=3,4,6
      endif   !isw=1,2,3,4,5,6,7,8
c
c----------------------------------------------------------------------
2000  format(/5x,
     & 'NL 3D Truss Element:'/
     &  5x,'Small Strain, Finite Displacement     '//
     &  10x,'E-modulus   ',e25.5/10x,'Cross section',e24.5)
3000  format(/5x,
     & 'NL 3D Truss Element: Stresses and Forces ')
3001  format(5x,'Element:',i3,'   Stress:',e12.5,'   Force:',e12.5)
      end
