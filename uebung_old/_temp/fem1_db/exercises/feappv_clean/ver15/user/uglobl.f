c$Id: uglobl.f,v 1.1 2000/08/24 20:49:58 rlt Exp $
      subroutine uglobl(type,td)

c      * * F E A P * * A Finite Element Analysis Program

c....  Copyright (c) 1984-2000: Robert L. Taylor

c-----[--.----+----.----+----.-----------------------------------------]
c      Purpose: Dummy user global parameter routine

c      Inputs:
c         type(2)   - Character array describing user global command
c         td(5)     - Real array of data for global command

c      Outputs:
c         N.B. Users must provide output via common blocks, etc.
c-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      character type(2)*15
      real*8    td(5)

      end
