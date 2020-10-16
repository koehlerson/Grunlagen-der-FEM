c$Id: merges.f,v 1.1 2000/08/24 20:49:58 rlt Exp $
      subroutine merges ( dir, za, nip, ip, numa, ic )

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Merge sort routine

c      Inputs:
c          dir        - direction of sort
c                        > 0 for increasing sort;
c                        = 0 for increasing sort;
c                        < 0 for decreasing sort.
c          za(i)      - list of unsorted values
c          nip        - Dimension of ip array
c          ip(nip,i)  - list of pointer  values
c          numa       - number of items in list

c      Scratch:
c          ic(i)      - working array for sort
c                         ic must contain numa locations

c      Output:
c          za(i)      - unsorted list of values
c          ip(nip,i)  - sorted list of pointer values

c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      integer   a,au,b,bu,c,dir,i,ii,inc,nip,numa,step,pass

      integer   ip(nip,*), ic(*)
      real*4    za(*)

      save

      inc = 1
      do ii = 1,numa
        ic(ii) = 0
      end do

c     Perform sort on list pairs in increments of step

      pass = 0
 100  step = min(2*inc,max(1,numa))
      do ii = 1,numa,step

c       Set values for pointers - limit to entries in list

        a    = ii
        au   = min(a  - 1 + inc,numa)
        b    = min(au + 1,      numa)
        bu   = min(b  - 1 + inc,numa)
        c = 1

c       Perform merge of two lists

 110    if(dir.ge.0) then

c         Increasing sort

          if(za(ip(1,a)).le.za(ip(1,b))) then
            ic(c) = ip(1,a)
            a     = a + 1
          else
            ic(c) = ip(1,b)
            b     = b + 1
          endif

        else

c         Decreasing sort

          if(za(ip(1,a)).ge.za(ip(1,b))) then
            ic(c) = ip(1,a)
            a     = a + 1
          else
            ic(c) = ip(1,b)
            b     = b + 1
          endif
        endif

c       Copy remaining list when first list is finished

        if(a.gt.au) then
          do i = b, bu
            c     = c + 1
            ic(c) = ip(1,i)
          end do
        elseif(b.gt.bu) then
          do i = a, au
            c     = c + 1
            ic(c) = ip(1,i)
          end do

c       Increment and repeat for next list items

        else
          c = c + 1
          go to 110
        endif

c       Lists have been sorted into ic, copy back to original list

        b = ii - 1
        do i = ii,bu
          ip(1,i) = ic(i-b)
        end do
      end do

c     Increment step size for next pass

      inc  = step
      pass = pass + 1

      if(inc.lt.numa) go to 100

      end
