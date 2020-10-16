c$Id: uconst.f,v 1.1 2000/08/24 20:49:58 rlt Exp $
      subroutine uconst(type,vv, ud,n1,n3, umat)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: User material model interface

c      Inputs:
c         type    - Name of constitutive model (character variable)
c         vv(*)   - Parameters: user parameters from command line

c      Outputs:
c         n1      - Number history terms: nh1,nh2
c         n3      - Number history terms: nh3
c         ud(*)   - User material parameters
c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      logical   pcomp
      character type*15
      integer   n1,n3,umat

      real*8    vv(5), ud(*)

      save

c     Specify types of user models - replace 'user' by desired name

      if(pcomp(type,'mat1',4)) then


        write(*,*) '  User Constitutive Inputs: E = ',vv(1)

        ud(1) = vv(1)

c       Set user constitutive equation number (positive)

        umat = 1

c       Call to other routine to do input or do it here!

      endif

      end
