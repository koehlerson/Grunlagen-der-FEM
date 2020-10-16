c$Id: umodel.f,v 1.1 2000/08/24 20:49:58 rlt Exp $
      subroutine umodel(umat,eps,theta,td,d,ud,hn,h1,nh, sig,dd, isw)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c     Purpose: User Constitutive Model

c     Input:
c          umat    -  User material type
c          eps(*)  -  Current strains at point      (small deformation)
c                  -  Deformation gradient at point (finite deformation)
c          theta   -  Trace of strain at point
c                  -  Determinant of deforamtion gradient
c          td      -  Temperature change
c          d(*)    -  Program material parameters (ndd)
c          ud(*)   -  User material parameters (nud)
c          hn(nh)  -  History terms at point: t_n
c          h1(nh)  -  History terms at point: t_n+1
c          nh      -  Number of history terms
c          isw     -  Solution option from element

c     Output:
c          sig(6)  -  Stresses at point.
c          dd(6,6) -  Current material tangent moduli

c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      integer   umat,nh,isw, i
      real*8    td

      real*8    eps(*),theta(*),d(*),ud(*),hn(nh),h1(nh), sig(6),dd(6,6)

      save

c     Material Model 1

      if(umat.eq.1) then

c       Dummy model:  sig = d(1)*eps

        do i = 1,6
          dd(i,i) = d(1)
          sig(i)  = d(1)*eps(i)
        end do

      endif

      end
