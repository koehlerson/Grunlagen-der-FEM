c$Id: udynam.f,v 1.1 2000/08/24 20:49:58 rlt Exp $
      subroutine udynam(du,u,ud,nneq,isw)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Perform updates to solution vectors

c      Inputs :
c        du(*)      - Increments to solution (isw=2 only)
c        u(nneq,2)  - Solution states at t_n+1
c        ud(nneq,*) - User controlled vectors
c        nneq       - Number nodal parameters (ndf*numnp)
c        isw        - Switch: 1 - initial updates at start of step
c                             2 - iterative updates withini step
c                             3 - restore solution to values at start
c                                 of step

c      Outputs:
c        ud(nneq,*) - User controlled vectors
c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      integer   n,nneq,isw
      real*8    du(*),u(nneq,2),ud(nneq,*)

c     Loop structure for partitions

      do n = 1,nneq
c       Perform steps here
      end do

      end
