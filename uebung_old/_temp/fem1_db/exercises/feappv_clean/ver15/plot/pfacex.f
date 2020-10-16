c$Id: pfacex.f,v 1.1 2000/08/24 20:49:58 rlt Exp $
      subroutine pfacex(il,ix,ixf,nen,nen1,nf,n)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Set up nodes for faces

c      Inputs:
c         il(*)   - Location of face nodes on element
c         ix(*)   - Node numbers on elements
c         nen     - Number of nodes on element
c         nen1    - Location of material set number on element
c         n       - Element number

c      Outputs:
c         ixf(*)  - Face nodes
c         nf      - Face number
c-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      integer   nen,nen1,nf,n, j
      integer   il(4),ix(nen1)
      integer   ixf(7)

      save

c     Set face nodes

      do j = 1,min(4,nen)
        ixf(j) = ix(il(j))
      end do

c     Set region and material number

      ixf(5) = n
      ixf(6) = ix(nen1-1)
      ixf(7) = ix(nen1)
      nf = nf + 1

      end
