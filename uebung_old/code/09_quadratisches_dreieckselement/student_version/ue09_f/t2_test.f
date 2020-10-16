      program t2_test
!----------------------------------------------------------------------
!     this is a program for testing the subroutines of elmt04
!----------------------------------------------------------------------
      implicit none
      include 't2_param'                ! input parameters of the example element

!.....set default values
      aa   = 0.0 ! elasticity matrix
      bmat = 0.0 ! b-matrix
      s    = 0.0 ! ke-matrix
      

      
!.....compute elasticity matrix subroutine   
       call dmat04(d(1),d(2),aa)
!       
! !----------------------------------------------------------------------      
       do l = 1,lint  ! begin gauss loop (numerical integration)
!       
!.......get gauss point coordinate and weighting factor
        call gauss04(l,lint,eg,wg)
! 
!.......evaluate shape function at current gauss point
        call shape04(nel,eg,xl,shp,detj)
!            
!.......compute b-matrix at current gauss point 
        call bmat04(nel,shp,bmat)
!        
!.......compute element stiffness at current gauss point
        call kemat04(s,bmat,aa,detj,wg,nst)
!      
      end do         ! end gauss loop
!----------------------------------------------------------------------      
     
!      call elmt04(d,ul,xl,ix,tl,s,p,ndf,ndm,nst,isw)
      
!.....write cooutput
      include 't2_output_formats'
      
      
      end program
      
!.....include subroutines of the elmt03.f-file
      include 'elmt04.f'
