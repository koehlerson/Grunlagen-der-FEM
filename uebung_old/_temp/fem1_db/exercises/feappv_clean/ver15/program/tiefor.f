c$Id: tiefor.f,v 1.1 2000/08/24 20:42:44 rlt Exp $
      subroutine tiefor(id,f,ip,ndf,numnp)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Procedure to connect nodes which have same coordinates.

c      Inputs:
c         id(ndf,*)  - Equation number list
c         ip(*)      - Node numbers for ties
c         ndf        - Number dof/node
c         numnp      - Number of nodes in mesh

c      Outputs:
c         f(ndf,*)   - Forces after tie accounted for
c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      include  'iofile.h'

      integer   ndf, numnp, i, j, k
      integer   id(ndf,*),ip(numnp)
      real*8    f(ndf,*)

      save

c     Set force/b.c. to tie nodes

      do k = 1,numnp
        j = ip(k)
        if(k.ne.j) then
          do i = 1,ndf
            f(i,k) = f(i,k) + f(i,j)
            f(i,j) = f(i,k)
          end do
        endif
      end do

c     Delete equations and forces for all unused nodes from a tie

      do j = 1,numnp
        if(ip(j).ne.j) then
          do i = 1,ndf
            if(id(i,j).eq.0 .and. id(i,ip(j)).lt.-999) then
              id(i,ip(j)) = 0
              f (i,ip(j)) = f(i,j)
            endif
            id(i,j) = 1
            f (i,j) = 0.0d0
          end do
        endif
      end do

      end
