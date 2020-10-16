      program t1_test
!----------------------------------------------------------------------
!     this is a program for testing the subroutines of elmt03
!----------------------------------------------------------------------
      implicit none
      include 't1_param' ! input parameters of the example element

      
!.....test elasticity matrix subroutine   
      aa = 0.0   
      call dmat03(d(1),d(2),aa)
       
  
!.....test b-matrix subroutine 
      bmat = 0.0  ! default values 
      det = (xl(1,2) - xl(1,1))*(xl(2,3) - xl(2,1))
     &       -(xl(1,3) - xl(1,1))*(xl(2,2) - xl(2,1))
      call bmat03(bmat,xl,det)
!       
!.....test element stiffness subroutine
      s = 0.0
      call kemat03(s,bmat,aa,det,nst)
      
      
!.....write cooutput
      include 't1_output_formats'
      
      end program
      
!.....include subroutines of the elmt03.f-file
      include 'elmt03.f'
