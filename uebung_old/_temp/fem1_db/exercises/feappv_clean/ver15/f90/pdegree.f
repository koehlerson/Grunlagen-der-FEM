c$Id:$
      subroutine pdegree(angle, sindeg,cosdeg)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2002: Regents of the University of California
c                               All rights reserved

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Compute sin and cos in terms of degree angle.
c               F90 version

c      Input:
c         angle  - Angle in degrees

c      Outputs:
c         sindeg - Sine of angle
c         cosdeg - Cosine of angle
c-----[--.----+----.----+----.-----------------------------------------]
      implicit   none

      real*8     angle, sindeg,cosdeg

      sindeg = sind(angle)
      cosdeg = cosd(angle)

      end
