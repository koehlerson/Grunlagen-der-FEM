c$Id: usolve.f,v 1.1 2000/08/24 20:49:58 rlt Exp $
      subroutine usolve(flags, b)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c     Purpose:  User solver interface

c     Inputs:

c        flags(1) - Allocation and/or initialization phase
c        flags(2) - Perform factorization for direct solutions
c        flags(3) - Coefficient array unsymmetric
c        flags(4) - Solve equations
c        b(*)     - Vector for solution

c     Outputs:

c        flags(5) - True if error occurs
c        b(*)     - Vector of solution
c-----[--.----+----.----+----.-----------------------------------------]

      implicit none

      logical  flags(*)
      real*8   b(*)


      end
