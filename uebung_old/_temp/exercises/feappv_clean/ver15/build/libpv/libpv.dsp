# Microsoft Developer Studio Project File - Name="libpv" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=libpv - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "libpv.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "libpv.mak" CFG="libpv - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "libpv - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "libpv - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
F90=df.exe
RSC=rc.exe

!IF  "$(CFG)" == "libpv - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE F90 /compile_only /nologo /warn:nofileopt
# ADD F90 /compile_only /include:"..\..\include" /nologo /warn:nofileopt
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "libpv - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
# ADD BASE F90 /check:bounds /compile_only /dbglibs /debug:full /nologo /traceback /warn:argument_checking /warn:nofileopt
# ADD F90 /check:bounds /compile_only /dbglibs /debug:full /nologo /traceback /warn:argument_checking /warn:nofileopt
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /GZ /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /GZ /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ENDIF 

# Begin Target

# Name "libpv - Win32 Release"
# Name "libpv - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat;f90;for;f;fpp"
# Begin Source File

SOURCE=..\..\program\acheck.f
# End Source File
# Begin Source File

SOURCE=..\..\program\addext.f
# End Source File
# Begin Source File

SOURCE=..\..\program\arcint1.f
# End Source File
# Begin Source File

SOURCE=..\..\program\arclen.f
DEP_F90_ARCLE=\
	"..\..\..\ver14\include\arclei.h"\
	"..\..\..\ver14\include\arcler.h"\
	"..\..\..\ver14\include\eqsym.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\print.h"\
	"..\..\..\ver14\include\prlod.h"\
	"..\..\..\ver14\include\tdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\autbac.f
DEP_F90_AUTBA=\
	"..\..\..\ver14\include\augdat.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\print.h"\
	"..\..\..\ver14\include\prld1.h"\
	"..\..\..\ver14\include\prlod.h"\
	"..\..\..\ver14\include\rdata.h"\
	"..\..\..\ver14\include\sdata.h"\
	"..\..\..\ver14\include\tdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\bjac2d.f
# End Source File
# Begin Source File

SOURCE=..\..\program\bjac3d.f
# End Source File
# Begin Source File

SOURCE=..\..\program\blkgen.f
DEP_F90_BLKGE=\
	"..\..\..\ver14\include\cblktr.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\crotas.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\region.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\blktem.f
DEP_F90_BLKTE=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\caprod.f
# End Source File
# Begin Source File

SOURCE=..\..\program\cashift.f
# End Source File
# Begin Source File

SOURCE=..\..\program\cassem.f
DEP_F90_CASSE=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\constant.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\cfunc.f
# End Source File
# Begin Source File

SOURCE=..\..\program\chkblk.f
# End Source File
# Begin Source File

SOURCE=..\..\program\chlbac.f
# End Source File
# Begin Source File

SOURCE=..\..\program\chlfwd.f
# End Source File
# Begin Source File

SOURCE=..\..\program\ckbrk8.f
DEP_F90_CKBRK=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\ckisop.f
DEP_F90_CKISO=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\ckno0i.f
# End Source File
# Begin Source File

SOURCE=..\..\program\cknon0.f
# End Source File
# Begin Source File

SOURCE=..\..\program\cksep.f
# End Source File
# Begin Source File

SOURCE=..\..\program\cktets.f
DEP_F90_CKTET=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\cktris.f
DEP_F90_CKTRI=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\clpan.f
DEP_F90_CLPAN=\
	"..\..\..\ver14\include\pdatap.h"\
	"..\..\..\ver14\include\pdataq.h"\
	"..\..\..\ver14\include\pdatps.h"\
	"..\..\..\ver14\include\plflag.h"\
	"..\..\..\ver14\include\psdat3.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\colbac.f
# End Source File
# Begin Source File

SOURCE=..\..\program\colred.f
# End Source File
# Begin Source File

SOURCE=..\..\program\compro.f
DEP_F90_COMPR=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\compac.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\conjgd.f
DEP_F90_CONJG=\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\elements\convec2d.f
DEP_F90_CONVE=\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\eltran.h"\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\elements\convec3d.f
DEP_F90_CONVEC=\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\eltran.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\prstrs.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\cvtc2i.f
# End Source File
# Begin Source File

SOURCE=..\..\program\dasble.f
DEP_F90_DASBL=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\compac.h"\
	"..\..\..\ver14\include\compas.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\setups.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\dasol.f
DEP_F90_DASOL=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\datest.f
# End Source File
# Begin Source File

SOURCE=..\..\program\datri.f
DEP_F90_DATRI=\
	"..\..\..\ver14\include\counts.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\print.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\datric.f
DEP_F90_DATRIC=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\dcheck.f
DEP_F90_DCHEC=\
	"..\..\..\ver14\include\conval.h"\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\dfind.f
DEP_F90_DFIND=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\dicont.f
DEP_F90_DICON=\
	"..\..\..\ver14\include\arclei.h"\
	"..\..\..\ver14\include\arclel.h"\
	"..\..\..\ver14\include\arcler.h"\
	"..\..\..\ver14\include\comfil.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ioincl.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\dosgin.f
DEP_F90_DOSGI=\
	"..\..\..\ver14\include\wdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\dot.f
# End Source File
# Begin Source File

SOURCE=..\..\program\dotid.f
# End Source File
# Begin Source File

SOURCE=..\..\program\dotx.f
# End Source File
# Begin Source File

SOURCE=..\..\program\dparam.f
DEP_F90_DPARA=\
	"..\..\..\ver14\include\ddata.h"\
	"..\..\..\ver14\include\dyndat.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\gltran.h"\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\dplot.f
DEP_F90_DPLOT=\
	"..\..\..\ver14\include\pdata2.h"\
	"..\..\..\ver14\include\pdatap.h"\
	"..\..\..\ver14\include\pdataq.h"\
	"..\..\..\ver14\include\pdatps.h"\
	"..\..\..\ver14\include\pdatxt.h"\
	"..\..\..\ver14\include\plclip.h"\
	"..\..\..\ver14\include\plflag.h"\
	"..\..\..\ver14\include\wdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\dsetci.f
DEP_F90_DSETC=\
	"..\..\..\ver14\include\ddata.h"\
	"..\..\..\ver14\include\gltran.h"\
	"..\..\..\ver14\include\tdata.h"\
	"..\..\..\ver14\include\tdatb.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\dsred.f
# End Source File
# Begin Source File

SOURCE=..\..\program\dured.f
# End Source File
# Begin Source File

SOURCE=..\..\program\dyna01.f
DEP_F90_DYNA0=\
	"..\..\..\ver14\include\ddata.h"\
	"..\..\..\ver14\include\tdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\dyna02.f
DEP_F90_DYNA02=\
	"..\..\..\ver14\include\ddata.h"\
	"..\..\..\ver14\include\tdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\eisql.f
DEP_F90_EISQL=\
	"..\..\..\ver14\include\machnc.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\elcnt.f
DEP_F90_ELCNT=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\elmlib.f
DEP_F90_ELMLI=\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\user\elmt01.f
# End Source File
# Begin Source File

SOURCE=..\..\user\elmt02.f
# End Source File
# Begin Source File

SOURCE=..\..\user\elmt03.f
# End Source File
# Begin Source File

SOURCE=..\..\user\elmt04.f
# End Source File
# Begin Source File

SOURCE=..\..\user\elmt05.f
# End Source File
# Begin Source File

SOURCE=..\..\program\elpint1.f
# End Source File
# Begin Source File

SOURCE=..\..\program\endclr.f
DEP_F90_ENDCL=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\errclr.f
DEP_F90_ERRCL=\
	"..\..\..\ver14\include\comfil.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ioincl.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\etime.f
DEP_F90_ETIME=\
	"..\..\..\ver14\include\etime1.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\evalex.f
DEP_F90_EVALE=\
	"..\..\..\ver14\include\corfil.h"\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\filnam.f
DEP_F90_FILNA=\
	"..\..\..\ver14\include\chdata.h"\
	"..\..\..\ver14\include\comfil.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\machnc.h"\
	"..\..\..\ver14\include\psize.h"\
	"..\..\..\ver14\include\vdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\formfe.f
DEP_F90_FORMF=\
	"..\..\..\ver14\include\cdat1.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\hdatam.h"\
	"..\..\..\ver14\include\ndata.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\prflag.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\fpplcl.f
DEP_F90_FPPLC=\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pdatps.h"\
	"..\..\..\ver14\include\plflag.h"\
	"..\..\..\ver14\include\psdat4.h"\
	"..\..\..\ver14\include\psdat6.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\fpplps.f
DEP_F90_FPPLP=\
	"..\..\..\ver14\include\plflag.h"\
	"..\..\..\ver14\include\plpost.h"\
	"..\..\..\ver14\include\psdat2.h"\
	"..\..\..\ver14\include\psdat5.h"\
	"..\..\..\ver14\include\psdat6.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\fppsdu.f
DEP_F90_FPPSD=\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\plpost.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\fppsin.f
DEP_F90_FPPSI=\
	"..\..\..\ver14\include\plpost.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\fppsop.f
DEP_F90_FPPSO=\
	"..\..\..\ver14\include\bdata.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pdatps.h"\
	"..\..\..\ver14\include\plflag.h"\
	"..\..\..\ver14\include\plpost.h"\
	"..\..\..\ver14\include\psdat2.h"\
	"..\..\..\ver14\include\psdat4.h"\
	"..\..\..\ver14\include\psdat5.h"\
	"..\..\..\ver14\include\psdat6.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\fppspl.f
DEP_F90_FPPSP=\
	"..\..\..\ver14\include\plflag.h"\
	"..\..\..\ver14\include\plpost.h"\
	"..\..\..\ver14\include\prmptd.h"\
	"..\..\..\ver14\include\psdat2.h"\
	"..\..\..\ver14\include\psdat5.h"\
	"..\..\..\ver14\include\psdat6.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\fptplt.f
DEP_F90_FPTPL=\
	"..\..\..\ver14\include\plflag.h"\
	"..\..\..\ver14\include\plpost.h"\
	"..\..\..\ver14\include\psdat2.h"\
	"..\..\..\ver14\include\psdat5.h"\
	"..\..\..\ver14\include\psdat6.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\frame.f
DEP_F90_FRAME=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pdata1.h"\
	"..\..\..\ver14\include\pdata4.h"\
	"..\..\..\ver14\include\pdatxt.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\elements\frame2d.f
DEP_F90_FRAME2=\
	"..\..\..\ver14\include\augdat.h"\
	"..\..\..\ver14\include\bdata.h"\
	"..\..\..\ver14\include\bm2com.h"\
	"..\..\..\ver14\include\cdat1.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\ddata.h"\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\eltran.h"\
	"..\..\..\ver14\include\hdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pmod2d.h"\
	"..\..\..\ver14\include\prld1.h"\
	"..\..\..\ver14\include\prstrs.h"\
	"..\..\..\ver14\include\ptdat6.h"\
	"..\..\..\ver14\include\tdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\elements\frame3d.f
DEP_F90_FRAME3=\
	"..\..\..\ver14\include\bdata.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\eltran.h"\
	"..\..\..\ver14\include\hdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pmod2d.h"\
	"..\..\..\ver14\include\prld1.h"\
	"..\..\..\ver14\include\prstrs.h"\
	"..\..\..\ver14\include\refnd.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\gamma1.f
DEP_F90_GAMMA=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\counts.h"\
	"..\..\..\ver14\include\ddata.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\ndata.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\prlod.h"\
	"..\..\..\ver14\include\sdata.h"\
	"..\..\..\ver14\include\tdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\geig.f
# End Source File
# Begin Source File

SOURCE=..\..\program\genclr.f
# End Source File
# Begin Source File

SOURCE=..\..\program\genint.f
DEP_F90_GENIN=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\genvec.f
DEP_F90_GENVE=\
	"..\..\..\ver14\include\cblktr.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\trdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\getcon.f
DEP_F90_GETCO=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\psize.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\global.f
DEP_F90_GLOBA=\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\modcon.h"\
	"..\..\..\ver14\include\pglob1.h"\
	"..\..\..\ver14\include\refng.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\histex.f
DEP_F90_HISTE=\
	"..\..\..\ver14\include\chdata.h"\
	"..\..\..\ver14\include\idata1.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\int1d.f
# End Source File
# Begin Source File

SOURCE=..\..\program\INT1DG.F
# End Source File
# Begin Source File

SOURCE=..\..\program\int1dl.f
DEP_F90_INT1D=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\int2d.f
DEP_F90_INT2D=\
	"..\..\..\ver14\include\eldata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\int3d.f
# End Source File
# Begin Source File

SOURCE=..\..\program\interp1.f
# End Source File
# Begin Source File

SOURCE=..\..\program\invert.f
# End Source File
# Begin Source File

SOURCE=..\..\program\inza.f
DEP_F90_INZA_=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\ipos.f
# End Source File
# Begin Source File

SOURCE=..\..\program\iprint.f
DEP_F90_IPRIN=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\iterat.f
DEP_F90_ITERA=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\counts.h"\
	"..\..\..\ver14\include\ddata.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\hdatam.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ndata.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\rdata.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\iters.f
DEP_F90_ITERS=\
	"..\..\..\ver14\include\allotd.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\compac.h"\
	"..\..\..\ver14\include\compas.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ndata.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\psize.h"\
	"..\..\..\ver14\include\sdata.h"\
	"..\..\..\ver14\include\ssolve.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\just.f
# End Source File
# Begin Source File

SOURCE=..\..\plot\lclip.f
DEP_F90_LCLIP=\
	"..\..\..\ver14\include\plclip.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\elements\material.f
DEP_F90_MATER=\
	"..\..\..\ver14\include\augdat.h"\
	"..\..\..\ver14\include\cdat1.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\ddata.h"\
	"..\..\..\ver14\include\debugs.h"\
	"..\..\..\ver14\include\elcount.h"\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\elengy.h"\
	"..\..\..\ver14\include\elplot.h"\
	"..\..\..\ver14\include\hdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pglob1.h"\
	"..\..\..\ver14\include\pmod2d.h"\
	"..\..\..\ver14\include\rdata.h"\
	"..\..\..\ver14\include\refnd.h"\
	"..\..\..\ver14\include\refng.h"\
	"..\..\..\ver14\include\sdata.h"\
	"..\..\..\ver14\include\tdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\maxcor.f
DEP_F90_MAXCO=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pdata0.h"\
	"..\..\..\ver14\include\pdatas.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\elements\membr3d.f
DEP_F90_MEMBR=\
	"..\..\..\ver14\include\bdata.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\elplot.h"\
	"..\..\..\ver14\include\eltran.h"\
	"..\..\..\ver14\include\evdata.h"\
	"..\..\..\ver14\include\hdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\mdata.h"\
	"..\..\..\ver14\include\prld1.h"\
	"..\..\..\ver14\include\prstrs.h"\
	"..\..\..\ver14\include\shlc16.h"\
	"..\..\..\ver14\include\shld16.h"\
	"..\..\..\ver14\include\shpf16.h"\
	"..\..\..\ver14\include\sstr16.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\mergei.f
# End Source File
# Begin Source File

SOURCE=..\..\plot\merges.f
# End Source File
# Begin Source File

SOURCE=..\..\program\meshck.f
DEP_F90_MESHC=\
	"..\..\..\ver14\include\cblend.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\prflag.h"\
	
NODEP_F90_MESHC=\
	".\Release\elflag.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\mkface.f
DEP_F90_MKFAC=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\modify.f
# End Source File
# Begin Source File

SOURCE=..\..\program\mprint.f
DEP_F90_MPRIN=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\nbuck.f
# End Source File
# Begin Source File

SOURCE=..\..\program\numass.f
DEP_F90_NUMAS=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\nwprof.f
# End Source File
# Begin Source File

SOURCE=..\..\program\opnfil.f
DEP_F90_OPNFI=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\outary.f
DEP_F90_OUTAR=\
	"..\..\..\ver14\include\allotd.h"\
	"..\..\..\ver14\include\allotn.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\paboun.f
DEP_F90_PABOU=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\padd.f
# End Source File
# Begin Source File

SOURCE=..\..\program\paddv.f
DEP_F90_PADDV=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\palloc.f
DEP_F90_PALLO=\
	"..\..\..\ver14\include\allotd.h"\
	"..\..\..\ver14\include\allotn.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pangl.f
# End Source File
# Begin Source File

SOURCE=..\..\program\parexp.f
DEP_F90_PAREX=\
	"..\..\..\ver14\include\conval.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pblend.f
DEP_F90_PBLEN=\
	"..\..\..\ver14\include\cblend.h"\
	"..\..\..\ver14\include\cblktr.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\region.h"\
	"..\..\..\ver14\include\trdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\PBLEND1.F
DEP_F90_PBLEND=\
	"..\..\..\ver14\include\cblend.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\region.h"\
	"..\..\..\ver14\include\trdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pblend2.f
DEP_F90_PBLEND2=\
	"..\..\..\ver14\include\cblend.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\region.h"\
	"..\..\..\ver14\include\trdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pblend3.f
DEP_F90_PBLEND3=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\region.h"\
	"..\..\..\ver14\include\trdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pblendm.f
DEP_F90_PBLENDM=\
	"..\..\..\ver14\include\cblend.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\region.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pblendx.f
DEP_F90_PBLENDX=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pbouin.f
DEP_F90_PBOUI=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pcboun.f
DEP_F90_PCBOU=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pcdisp.f
DEP_F90_PCDIS=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pcharr.f
# End Source File
# Begin Source File

SOURCE=..\..\program\pcheck.f
# End Source File
# Begin Source File

SOURCE=..\..\program\pcomp.f
# End Source File
# Begin Source File

SOURCE=..\..\program\pconst.f
DEP_F90_PCONS=\
	"..\..\..\ver14\include\comfil.h"\
	"..\..\..\ver14\include\conval.h"\
	"..\..\..\ver14\include\corfil.h"\
	"..\..\..\ver14\include\errchk.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ioincl.h"\
	"..\..\..\ver14\include\iosave.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pcontr.f
DEP_F90_PCONT=\
	"..\..\..\ver14\include\allotd.h"\
	"..\..\..\ver14\include\bdata.h"\
	"..\..\..\ver14\include\cblend.h"\
	"..\..\..\ver14\include\cdat1.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\chdata.h"\
	"..\..\..\ver14\include\codat.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\comfil.h"\
	"..\..\..\ver14\include\compac.h"\
	"..\..\..\ver14\include\conval.h"\
	"..\..\..\ver14\include\cornum.h"\
	"..\..\..\ver14\include\corset.h"\
	"..\..\..\ver14\include\crotas.h"\
	"..\..\..\ver14\include\debugs.h"\
	"..\..\..\ver14\include\edgdat.h"\
	"..\..\..\ver14\include\errchk.h"\
	"..\..\..\ver14\include\hlpdat.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ioincl.h"\
	"..\..\..\ver14\include\iosave.h"\
	"..\..\..\ver14\include\linka.h"\
	"..\..\..\ver14\include\mdata.h"\
	"..\..\..\ver14\include\mxsiz.h"\
	"..\..\..\ver14\include\pdata2.h"\
	"..\..\..\ver14\include\pdata5.h"\
	"..\..\..\ver14\include\pdata6.h"\
	"..\..\..\ver14\include\pdatps.h"\
	"..\..\..\ver14\include\plflag.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\prflag.h"\
	"..\..\..\ver14\include\print.h"\
	"..\..\..\ver14\include\psize.h"\
	"..\..\..\ver14\include\refng.h"\
	"..\..\..\ver14\include\region.h"\
	"..\..\..\ver14\include\sdata.h"\
	"..\..\..\ver14\include\umac1.h"\
	"..\..\..\ver14\include\vdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pcprop.f
DEP_F90_PCPRO=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\pdefm.f
DEP_F90_PDEFM=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\f77.h"\
	"..\..\..\ver14\include\pdata4.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\f90\pdegree.f
# End Source File
# Begin Source File

SOURCE=..\..\program\pdelfl.f
DEP_F90_PDELF=\
	"..\..\..\ver14\include\comfil.h"\
	"..\..\..\ver14\include\cornum.h"\
	"..\..\..\ver14\include\iodata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pdiff.f
DEP_F90_PDIFF=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pedges.f
DEP_F90_PEDGE=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pedgin.f
DEP_F90_PEDGI=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\comfil.h"\
	"..\..\..\ver14\include\conval.h"\
	"..\..\..\ver14\include\edgdat.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ioincl.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\print.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\peforc.f
DEP_F90_PEFOR=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\peige.f
DEP_F90_PEIGE=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\peigsv.f
DEP_F90_PEIGS=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\evdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pelcon.f
DEP_F90_PELCO=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pelmin.f
DEP_F90_PELMI=\
	"..\..\..\ver14\include\cblktr.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\chdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\region.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pelnum.f
# End Source File
# Begin Source File

SOURCE=..\..\plot\perspe.f
DEP_F90_PERSP=\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pdata0.h"\
	"..\..\..\ver14\include\pdatps.h"\
	"..\..\..\ver14\include\ppers.h"\
	"..\..\..\ver14\include\prmptd.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\perspj.f
DEP_F90_PERSPJ=\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ppers.h"\
	"..\..\..\ver14\include\pview.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\perspz.f
DEP_F90_PERSPZ=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pdata4.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\ppers.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pesurf.f
DEP_F90_PESUR=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\comfil.h"\
	"..\..\..\ver14\include\conval.h"\
	"..\..\..\ver14\include\cornum.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ioincl.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pexpd.f
# End Source File
# Begin Source File

SOURCE=..\..\program\pextnd.f
DEP_F90_PEXTN=\
	"..\..\..\ver14\include\cdat1.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\pfacev.f
DEP_F90_PFACE=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\pfacex.f
# End Source File
# Begin Source File

SOURCE=..\..\program\pfboun.f
DEP_F90_PFBOU=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\pfeap.f
DEP_F90_PFEAP=\
	"..\..\..\ver14\include\pdata2.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pform.f
DEP_F90_PFORM=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\crotas.h"\
	"..\..\..\ver14\include\ddata.h"\
	"..\..\..\ver14\include\elcount.h"\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\elplot.h"\
	"..\..\..\ver14\include\eluser.h"\
	"..\..\..\ver14\include\eqsym.h"\
	"..\..\..\ver14\include\erotas.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\hdata.h"\
	"..\..\..\ver14\include\hdatam.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\mdata.h"\
	"..\..\..\ver14\include\modreg.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\prld1.h"\
	"..\..\..\ver14\include\prlod.h"\
	"..\..\..\ver14\include\prstrs.h"\
	"..\..\..\ver14\include\ptdat1.h"\
	"..\..\..\ver14\include\ptdat2.h"\
	"..\..\..\ver14\include\ptdat8.h"\
	"..\..\..\ver14\include\rdat0.h"\
	"..\..\..\ver14\include\rdata.h"\
	"..\..\..\ver14\include\region.h"\
	"..\..\..\ver14\include\tdata.h"\
	"..\..\..\ver14\include\tdatb.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\f90\pfuncs.f
DEP_F90_PFUNC=\
	"..\..\..\ver14\include\conval.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pgetd.f
DEP_F90_PGETD=\
	"..\..\..\ver14\include\allotd.h"\
	"..\..\..\ver14\include\allotn.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\debugs.h"\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\phelp.f
DEP_F90_PHELP=\
	"..\..\..\ver14\include\hlpdat.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\phide.f
DEP_F90_PHIDE=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pdata3.h"\
	"..\..\..\ver14\include\pdata4.h"\
	"..\..\..\ver14\include\plflag.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\ppers.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\phist.f
DEP_F90_PHIST=\
	"..\..\..\ver14\include\chdata.h"\
	"..\..\..\ver14\include\idata1.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\prflag.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\piacel.f
# End Source File
# Begin Source File

SOURCE=..\..\program\piden.f
# End Source File
# Begin Source File

SOURCE=..\..\program\pincld.f
DEP_F90_PINCL=\
	"..\..\..\ver14\include\comfil.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ioincl.h"\
	"..\..\..\ver14\include\iosave.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pinitl.f
DEP_F90_PINIT=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\print.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pinput.f
# End Source File
# Begin Source File

SOURCE=..\..\program\pinstall.f
DEP_F90_PINST=\
	"..\..\..\ver14\include\chdata.h"\
	"..\..\..\ver14\include\codat.h"\
	"..\..\..\ver14\include\comfil.h"\
	"..\..\..\ver14\include\hlpdat.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\iosave.h"\
	"..\..\..\ver14\include\pathn.h"\
	"..\..\..\ver14\include\prmptd.h"\
	"..\..\..\ver14\include\psize.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pinval.f
# End Source File
# Begin Source File

SOURCE=..\..\plot\pjstrs.f
DEP_F90_PJSTR=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pdata3.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\sdata.h"\
	"..\..\..\ver14\include\strnum.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\plabl.f
DEP_F90_PLABL=\
	"..\..\..\ver14\include\pdatap.h"\
	"..\..\..\ver14\include\pdatps.h"\
	"..\..\..\ver14\include\pdatxt.h"\
	"..\..\..\ver14\include\plflag.h"\
	"..\..\..\ver14\include\psdat3.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\elements\plate2d.f
DEP_F90_PLATE=\
	"..\..\..\ver14\include\bdata.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\eltran.h"\
	"..\..\..\ver14\include\hdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\mdata.h"\
	"..\..\..\ver14\include\prstrs.h"\
	"..\..\..\ver14\include\strnum.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\plbord.f
DEP_F90_PLBOR=\
	"..\..\..\ver14\include\pdata2.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\plbrk8.f
DEP_F90_PLBRK=\
	"..\..\..\ver14\include\pdata5.h"\
	"..\..\..\ver14\include\pdata6.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\plclos.f
DEP_F90_PLCLO=\
	"..\..\..\ver14\include\print.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\pleigt.f
DEP_F90_PLEIG=\
	"..\..\..\ver14\include\evdata.h"\
	"..\..\..\ver14\include\pdatxt.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\plface.f
DEP_F90_PLFAC=\
	"..\..\..\ver14\include\pdata4.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\plfacn.f
DEP_F90_PLFACN=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pdata5.h"\
	"..\..\..\ver14\include\pdata6.h"\
	"..\..\..\ver14\include\plclip.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\plfacx.f
DEP_F90_PLFACX=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pdata5.h"\
	"..\..\..\ver14\include\pdata6.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\pline.f
DEP_F90_PLINE=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\plink.f
DEP_F90_PLINK=\
	"..\..\..\ver14\include\comfil.h"\
	"..\..\..\ver14\include\conval.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ioincl.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\plinka.f
DEP_F90_PLINKA=\
	"..\..\..\ver14\include\comfil.h"\
	"..\..\..\ver14\include\conval.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ioincl.h"\
	"..\..\..\ver14\include\linka.h"\
	"..\..\..\ver14\include\print.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\plline.f
DEP_F90_PLLIN=\
	"..\..\..\ver14\include\pdata2.h"\
	"..\..\..\ver14\include\pdatps.h"\
	"..\..\..\ver14\include\plflag.h"\
	"..\..\..\ver14\include\psdat5.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\ploa1.f
DEP_F90_PLOA1=\
	"..\..\..\ver14\include\arclel.h"\
	"..\..\..\ver14\include\arcler.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pload.f
DEP_F90_PLOAD=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\ddata.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\prld1.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pload0.f
DEP_F90_PLOAD0=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\prld1.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\ploadc.f
DEP_F90_PLOADC=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\corfil.h"\
	"..\..\..\ver14\include\corset.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\print.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\plopen.f
DEP_F90_PLOPE=\
	"..\..\..\ver14\include\pdata2.h"\
	"..\..\..\ver14\include\pdatap.h"\
	"..\..\..\ver14\include\pdatps.h"\
	"..\..\..\ver14\include\plflag.h"\
	"..\..\..\ver14\include\print.h"\
	"..\..\..\ver14\include\wdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\plot2d.f
DEP_F90_PLOT2=\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\pbody.h"\
	"..\..\..\ver14\include\pdata2.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\plot9.f
DEP_F90_PLOT9=\
	"..\..\..\ver14\include\pdata2.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\plotl.f
DEP_F90_PLOTL=\
	"..\..\..\ver14\include\pdata1.h"\
	"..\..\..\ver14\include\plclip.h"\
	"..\..\..\ver14\include\ppers.h"\
	"..\..\..\ver14\include\pview.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\plqud4.f
DEP_F90_PLQUD=\
	"..\..\..\ver14\include\pdata5.h"\
	"..\..\..\ver14\include\pdata6.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\plstop.f
DEP_F90_PLSTO=\
	"..\..\..\ver14\include\pdatps.h"\
	"..\..\..\ver14\include\plflag.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\plstrt.f
DEP_F90_PLSTR=\
	"..\..\..\ver14\include\pdata2.h"\
	"..\..\..\ver14\include\plflag.h"\
	"..\..\..\ver14\include\wdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\pltaxs.f
# End Source File
# Begin Source File

SOURCE=..\..\plot\pltbou.f
DEP_F90_PLTBO=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pdata1.h"\
	"..\..\..\ver14\include\pdata4.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\pltcon.f
DEP_F90_PLTCO=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pbody.h"\
	"..\..\..\ver14\include\pdata1.h"\
	"..\..\..\ver14\include\pdata2.h"\
	"..\..\..\ver14\include\pdata4.h"\
	"..\..\..\ver14\include\pdatri.h"\
	"..\..\..\ver14\include\prange.h"\
	"..\..\..\ver14\include\prmptd.h"\
	"..\..\..\ver14\include\psdat1.h"\
	"..\..\..\ver14\include\rpdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\pltcor.f
# End Source File
# Begin Source File

SOURCE=..\..\plot\pltctx.f
DEP_F90_PLTCT=\
	"..\..\..\ver14\include\pdata2.h"\
	"..\..\..\ver14\include\pdatxt.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\pltcur.f
# End Source File
# Begin Source File

SOURCE=..\..\windows\pltdos.f
DEP_F90_PLTDO=\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\wdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\pltefl.f
# End Source File
# Begin Source File

SOURCE=..\..\plot\pltelc.f
DEP_F90_PLTEL=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pbody.h"\
	"..\..\..\ver14\include\pdata1.h"\
	"..\..\..\ver14\include\pdata2.h"\
	"..\..\..\ver14\include\pdata4.h"\
	"..\..\..\ver14\include\pdatri.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\prange.h"\
	"..\..\..\ver14\include\prmptd.h"\
	"..\..\..\ver14\include\psdat1.h"\
	"..\..\..\ver14\include\rpdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\pltelm.f
DEP_F90_PLTELM=\
	"..\..\..\ver14\include\pbody.h"\
	"..\..\..\ver14\include\pdata4.h"\
	"..\..\..\ver14\include\plflag.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\pltet4.f
DEP_F90_PLTET=\
	"..\..\..\ver14\include\pdata5.h"\
	"..\..\..\ver14\include\pdata6.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\pltext.f
DEP_F90_PLTEX=\
	"..\..\..\ver14\include\pdatxt.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\pltfor.f
DEP_F90_PLTFO=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pdata1.h"\
	"..\..\..\ver14\include\pdata4.h"\
	"..\..\..\ver14\include\pdatxt.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\pltftx.f
DEP_F90_PLTFT=\
	"..\..\..\ver14\include\pdata1.h"\
	"..\..\..\ver14\include\pdata2.h"\
	"..\..\..\ver14\include\pdatap.h"\
	"..\..\..\ver14\include\pdatps.h"\
	"..\..\..\ver14\include\pdatxt.h"\
	"..\..\..\ver14\include\plcapt.h"\
	"..\..\..\ver14\include\psdat1.h"\
	"..\..\..\ver14\include\rpdata.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\pltime.f
DEP_F90_PLTIM=\
	"..\..\..\ver14\include\pdatxt.h"\
	"..\..\..\ver14\include\tdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\pltlfl.f
# End Source File
# Begin Source File

SOURCE=..\..\plot\pltln2.f
DEP_F90_PLTLN=\
	"..\..\..\ver14\include\pdata5.h"\
	"..\..\..\ver14\include\pdata6.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pltmv.f
# End Source File
# Begin Source File

SOURCE=..\..\windows\pltnod.f
DEP_F90_PLTNO=\
	"..\..\..\ver14\include\pdata1.h"\
	"..\..\..\ver14\include\pdata4.h"\
	"..\..\..\ver14\include\plflag.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\pltord.f
DEP_F90_PLTOR=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\pdata3.h"\
	"..\..\..\ver14\include\pdata5.h"\
	"..\..\..\ver14\include\pdata6.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\pltpt1.f
DEP_F90_PLTPT=\
	"..\..\..\ver14\include\pdata5.h"\
	"..\..\..\ver14\include\pdata6.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\pltri3.f
DEP_F90_PLTRI=\
	"..\..\..\ver14\include\pdata5.h"\
	"..\..\..\ver14\include\pdata6.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\pltri6.f
DEP_F90_PLTRI6=\
	"..\..\..\ver14\include\pdata5.h"\
	"..\..\..\ver14\include\pdata6.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\pltris.f
DEP_F90_PLTRIS=\
	"..\..\..\ver14\include\pdata2.h"\
	"..\..\..\ver14\include\pdatri.h"\
	"..\..\..\ver14\include\plflag.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\pltstr.f
DEP_F90_PLTST=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pdata3.h"\
	"..\..\..\ver14\include\prstrs.h"\
	"..\..\..\ver14\include\strnum.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\plview.f
# End Source File
# Begin Source File

SOURCE=..\..\program\pmacio.f
DEP_F90_PMACI=\
	"..\..\..\ver14\include\chdata.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\idata1.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\prflag.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pmacr.f
DEP_F90_PMACR=\
	"..\..\..\ver14\include\arclei.h"\
	"..\..\..\ver14\include\arclel.h"\
	"..\..\..\ver14\include\arcler.h"\
	"..\..\..\ver14\include\augdat.h"\
	"..\..\..\ver14\include\cdat1.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\chdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\comfil.h"\
	"..\..\..\ver14\include\compas.h"\
	"..\..\..\ver14\include\counts.h"\
	"..\..\..\ver14\include\ddata.h"\
	"..\..\..\ver14\include\debugs.h"\
	"..\..\..\ver14\include\dyndat.h"\
	"..\..\..\ver14\include\eltran.h"\
	"..\..\..\ver14\include\endata.h"\
	"..\..\..\ver14\include\evdata.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\gltran.h"\
	"..\..\..\ver14\include\hdata.h"\
	"..\..\..\ver14\include\hdatam.h"\
	"..\..\..\ver14\include\hlpdat.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ldata.h"\
	"..\..\..\ver14\include\modcon.h"\
	"..\..\..\ver14\include\ndata.h"\
	"..\..\..\ver14\include\pdata2.h"\
	"..\..\..\ver14\include\pdata3.h"\
	"..\..\..\ver14\include\plflag.h"\
	"..\..\..\ver14\include\plist.h"\
	"..\..\..\ver14\include\pmod2d.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\prflag.h"\
	"..\..\..\ver14\include\print.h"\
	"..\..\..\ver14\include\prld1.h"\
	"..\..\..\ver14\include\prlod.h"\
	"..\..\..\ver14\include\ptdat1.h"\
	"..\..\..\ver14\include\ptdat2.h"\
	"..\..\..\ver14\include\ptdat3.h"\
	"..\..\..\ver14\include\ptdat4.h"\
	"..\..\..\ver14\include\ptdat5.h"\
	"..\..\..\ver14\include\ptdat6.h"\
	"..\..\..\ver14\include\ptdat7.h"\
	"..\..\..\ver14\include\ptdat8.h"\
	"..\..\..\ver14\include\rdat0.h"\
	"..\..\..\ver14\include\rdata.h"\
	"..\..\..\ver14\include\region.h"\
	"..\..\..\ver14\include\sdata.h"\
	"..\..\..\ver14\include\tdata.h"\
	"..\..\..\ver14\include\tdatb.h"\
	"..\..\..\ver14\include\tdato.h"\
	"..\..\..\ver14\include\umac1.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pmacr1.f
DEP_F90_PMACR1=\
	"..\..\..\ver14\include\allotd.h"\
	"..\..\..\ver14\include\arclei.h"\
	"..\..\..\ver14\include\arclel.h"\
	"..\..\..\ver14\include\arcler.h"\
	"..\..\..\ver14\include\augdat.h"\
	"..\..\..\ver14\include\cdat1.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\comfil.h"\
	"..\..\..\ver14\include\compas.h"\
	"..\..\..\ver14\include\counts.h"\
	"..\..\..\ver14\include\ddata.h"\
	"..\..\..\ver14\include\debugs.h"\
	"..\..\..\ver14\include\eltran.h"\
	"..\..\..\ver14\include\endata.h"\
	"..\..\..\ver14\include\eqslv.h"\
	"..\..\..\ver14\include\eqsym.h"\
	"..\..\..\ver14\include\errind.h"\
	"..\..\..\ver14\include\evdata.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\gltran.h"\
	"..\..\..\ver14\include\hdatam.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ldata.h"\
	"..\..\..\ver14\include\modreg.h"\
	"..\..\..\ver14\include\mxsiz.h"\
	"..\..\..\ver14\include\ndata.h"\
	"..\..\..\ver14\include\pdata3.h"\
	"..\..\..\ver14\include\plist.h"\
	"..\..\..\ver14\include\pmod2d.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\prflag.h"\
	"..\..\..\ver14\include\print.h"\
	"..\..\..\ver14\include\prlod.h"\
	"..\..\..\ver14\include\prstrs.h"\
	"..\..\..\ver14\include\psize.h"\
	"..\..\..\ver14\include\rdat0.h"\
	"..\..\..\ver14\include\rdat1.h"\
	"..\..\..\ver14\include\rdata.h"\
	"..\..\..\ver14\include\sdata.h"\
	"..\..\..\ver14\include\ssolve.h"\
	"..\..\..\ver14\include\strnum.h"\
	"..\..\..\ver14\include\tdata.h"\
	"..\..\..\ver14\include\xtout.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pmacr2.f
DEP_F90_PMACR2=\
	"..\..\..\ver14\include\arclel.h"\
	"..\..\..\ver14\include\arcler.h"\
	"..\..\..\ver14\include\augdat.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\comfil.h"\
	"..\..\..\ver14\include\counts.h"\
	"..\..\..\ver14\include\crotas.h"\
	"..\..\..\ver14\include\ddata.h"\
	"..\..\..\ver14\include\debugs.h"\
	"..\..\..\ver14\include\evdata.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\hdatam.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ldata.h"\
	"..\..\..\ver14\include\mxsiz.h"\
	"..\..\..\ver14\include\ndata.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\prflag.h"\
	"..\..\..\ver14\include\print.h"\
	"..\..\..\ver14\include\prld1.h"\
	"..\..\..\ver14\include\prlod.h"\
	"..\..\..\ver14\include\rdat0.h"\
	"..\..\..\ver14\include\rdata.h"\
	"..\..\..\ver14\include\sdata.h"\
	"..\..\..\ver14\include\tdata.h"\
	"..\..\..\ver14\include\tdato.h"\
	"..\..\..\ver14\include\umac1.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pmacr3.f
DEP_F90_PMACR3=\
	"..\..\..\ver14\include\allotd.h"\
	"..\..\..\ver14\include\arclei.h"\
	"..\..\..\ver14\include\arclel.h"\
	"..\..\..\ver14\include\arcler.h"\
	"..\..\..\ver14\include\augdat.h"\
	"..\..\..\ver14\include\cdat1.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\comfil.h"\
	"..\..\..\ver14\include\compac.h"\
	"..\..\..\ver14\include\compas.h"\
	"..\..\..\ver14\include\corfil.h"\
	"..\..\..\ver14\include\cornum.h"\
	"..\..\..\ver14\include\corset.h"\
	"..\..\..\ver14\include\counts.h"\
	"..\..\..\ver14\include\ddata.h"\
	"..\..\..\ver14\include\debugs.h"\
	"..\..\..\ver14\include\edgdat.h"\
	"..\..\..\ver14\include\endata.h"\
	"..\..\..\ver14\include\eqsym.h"\
	"..\..\..\ver14\include\evdata.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\hdatam.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ldata.h"\
	"..\..\..\ver14\include\modcon.h"\
	"..\..\..\ver14\include\modreg.h"\
	"..\..\..\ver14\include\mxsiz.h"\
	"..\..\..\ver14\include\ndata.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\prflag.h"\
	"..\..\..\ver14\include\print.h"\
	"..\..\..\ver14\include\prlod.h"\
	"..\..\..\ver14\include\psize.h"\
	"..\..\..\ver14\include\ptdat1.h"\
	"..\..\..\ver14\include\ptdat2.h"\
	"..\..\..\ver14\include\ptdat3.h"\
	"..\..\..\ver14\include\ptdat5.h"\
	"..\..\..\ver14\include\rdat0.h"\
	"..\..\..\ver14\include\rdat1.h"\
	"..\..\..\ver14\include\rdata.h"\
	"..\..\..\ver14\include\region.h"\
	"..\..\..\ver14\include\sdata.h"\
	"..\..\..\ver14\include\setups.h"\
	"..\..\..\ver14\include\tdata.h"\
	"..\..\..\ver14\include\xtout.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pmacr4.f
DEP_F90_PMACR4=\
	"..\..\..\ver14\include\print.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pman.f
DEP_F90_PMAN_=\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\pathn.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pmatin.f
DEP_F90_PMATI=\
	"..\..\..\ver14\include\cdat1.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\chdata.h"\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\erotas.h"\
	"..\..\..\ver14\include\hdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pdata3.h"\
	"..\..\..\ver14\include\sdata.h"\
	"..\..\..\ver14\include\strnum.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pmesh.f
DEP_F90_PMESH=\
	"..\..\..\ver14\include\cblend.h"\
	"..\..\..\ver14\include\cblktr.h"\
	"..\..\..\ver14\include\cdat1.h"\
	"..\..\..\ver14\include\cdat2.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\chdata.h"\
	"..\..\..\ver14\include\codat.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\cornum.h"\
	"..\..\..\ver14\include\corset.h"\
	"..\..\..\ver14\include\debugs.h"\
	"..\..\..\ver14\include\edgdat.h"\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\eqslv.h"\
	"..\..\..\ver14\include\hlpdat.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\iosave.h"\
	"..\..\..\ver14\include\pdata3.h"\
	"..\..\..\ver14\include\pglob1.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\prflag.h"\
	"..\..\..\ver14\include\prld1.h"\
	"..\..\..\ver14\include\region.h"\
	"..\..\..\ver14\include\sdata.h"\
	"..\..\..\ver14\include\trdata.h"\
	"..\..\..\ver14\include\umac1.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pmove.f
# End Source File
# Begin Source File

SOURCE=..\..\program\pmovec.f
# End Source File
# Begin Source File

SOURCE=..\..\program\pnodes.f
DEP_F90_PNODE=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pnorml.f
DEP_F90_PNORM=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pdata5.h"\
	"..\..\..\ver14\include\pdata6.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pnumbl.f
# End Source File
# Begin Source File

SOURCE=..\..\plot\pnumna.f
DEP_F90_PNUMN=\
	"..\..\..\ver14\include\pbody.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pnums.f
DEP_F90_PNUMS=\
	"..\..\..\ver14\include\cblend.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\chdata.h"\
	"..\..\..\ver14\include\codat.h"\
	"..\..\..\ver14\include\comfil.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\iosave.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\polar.f
DEP_F90_POLAR=\
	"..\..\..\ver14\include\cdat2.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\crotas.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\poutie.f
DEP_F90_POUTI=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\ppbox.f
DEP_F90_PPBOX=\
	"..\..\..\ver14\include\plclip.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\ppeye.f
# End Source File
# Begin Source File

SOURCE=..\..\plot\pplotf.f
DEP_F90_PPLOT=\
	"..\..\..\ver14\include\arcler.h"\
	"..\..\..\ver14\include\cdat1.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\evdata.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pbody.h"\
	"..\..\..\ver14\include\pdata1.h"\
	"..\..\..\ver14\include\pdata2.h"\
	"..\..\..\ver14\include\pdata3.h"\
	"..\..\..\ver14\include\pdata4.h"\
	"..\..\..\ver14\include\pdatap.h"\
	"..\..\..\ver14\include\pdatps.h"\
	"..\..\..\ver14\include\pdatxt.h"\
	"..\..\..\ver14\include\plclip.h"\
	"..\..\..\ver14\include\plflag.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\ppers.h"\
	"..\..\..\ver14\include\prange.h"\
	"..\..\..\ver14\include\prflag.h"\
	"..\..\..\ver14\include\print.h"\
	"..\..\..\ver14\include\prmptd.h"\
	"..\..\..\ver14\include\prstrs.h"\
	"..\..\..\ver14\include\pview.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\pppcol.f
DEP_F90_PPPCO=\
	"..\..\..\ver14\include\pdata2.h"\
	"..\..\..\ver14\include\pdatps.h"\
	"..\..\..\ver14\include\plflag.h"\
	"..\..\..\ver14\include\prmptd.h"\
	"..\..\..\ver14\include\psdat2.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pprtd.f
DEP_F90_PPRTD=\
	"..\..\..\ver14\include\allotd.h"\
	"..\..\..\ver14\include\allotn.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pdata2.h"\
	"..\..\..\ver14\include\psize.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\presol.f
DEP_F90_PRESO=\
	"..\..\..\ver14\include\allotd.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\compas.h"\
	"..\..\..\ver14\include\eqsym.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ldata.h"\
	"..\..\..\ver14\include\ndata.h"\
	"..\..\..\ver14\include\pathn.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\prflag.h"\
	"..\..\..\ver14\include\psize.h"\
	"..\..\..\ver14\include\setups.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\prj2dl.f
DEP_F90_PRJ2D=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\prj3dl.f
DEP_F90_PRJ3D=\
	"..\..\..\ver14\include\cdat1.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pdata5.h"\
	"..\..\..\ver14\include\pdata6.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\proced.f
DEP_F90_PROCE=\
	"..\..\..\ver14\include\chdata.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\profil.f
DEP_F90_PROFI=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\machnc.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\prop2.f
DEP_F90_PROP2=\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\print.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\propld.f
DEP_F90_PROPL=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\prld1.h"\
	"..\..\..\ver14\include\prlod.h"\
	"..\..\..\ver14\include\umac1.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\protv.f
# End Source File
# Begin Source File

SOURCE=..\..\program\prtdis.f
DEP_F90_PRTDI=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\xtout.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\prtitl.f
DEP_F90_PRTIT=\
	"..\..\..\ver14\include\bdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\prtrea.f
DEP_F90_PRTRE=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\xtout.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\prtstr.f
DEP_F90_PRTST=\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\strnum.h"\
	"..\..\..\ver14\include\xtout.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pseqn.f
# End Source File
# Begin Source File

SOURCE=..\..\plot\psetip.f
# End Source File
# Begin Source File

SOURCE=..\..\program\pside1.f
DEP_F90_PSIDE=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\psides.f
DEP_F90_PSIDES=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\psolve.f
DEP_F90_PSOLV=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\compas.h"\
	"..\..\..\ver14\include\endata.h"\
	"..\..\..\ver14\include\eqsym.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ndata.h"\
	"..\..\..\ver14\include\pathn.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\rdat0.h"\
	"..\..\..\ver14\include\rdat1.h"\
	"..\..\..\ver14\include\rdata.h"\
	"..\..\..\ver14\include\setups.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\windows\pstart.f
DEP_F90_PSTAR=\
	"..\..\..\ver14\include\pdata2.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pstr2d.f
# End Source File
# Begin Source File

SOURCE=..\..\program\pstr3d.f
# End Source File
# Begin Source File

SOURCE=..\..\program\pstrip.f
DEP_F90_PSTRI=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\psub.f
# End Source File
# Begin Source File

SOURCE=..\..\program\ptiend.f
DEP_F90_PTIEN=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\ptimpl.f
DEP_F90_PTIMP=\
	"..\..\..\ver14\include\aceang.h"\
	"..\..\..\ver14\include\arcler.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\eltran.h"\
	"..\..\..\ver14\include\endata.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\gltran.h"\
	"..\..\..\ver14\include\hdatam.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\print.h"\
	"..\..\..\ver14\include\prlod.h"\
	"..\..\..\ver14\include\ptdat1.h"\
	"..\..\..\ver14\include\ptdat2.h"\
	"..\..\..\ver14\include\ptdat3.h"\
	"..\..\..\ver14\include\ptdat4.h"\
	"..\..\..\ver14\include\ptdat5.h"\
	"..\..\..\ver14\include\ptdat6.h"\
	"..\..\..\ver14\include\ptdat7.h"\
	"..\..\..\ver14\include\ptdat8.h"\
	"..\..\..\ver14\include\ptdat9.h"\
	"..\..\..\ver14\include\sdata.h"\
	"..\..\..\ver14\include\tdata.h"\
	"..\..\..\ver14\include\tdato.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\f90\ptmplt.f
DEP_F90_PTMPL=\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\pdata2.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\ptrans.f
# End Source File
# Begin Source File

SOURCE=..\..\plot\pwind.f
# End Source File
# Begin Source File

SOURCE=..\..\windows\pwopn.f
DEP_F90_PWOPN=\
	"..\..\..\ver14\include\pdata2.h"\
	"..\..\..\ver14\include\pdatps.h"\
	"..\..\..\ver14\include\plclip.h"\
	"..\..\..\ver14\include\plflag.h"\
	"..\..\..\ver14\include\print.h"\
	"..\..\..\ver14\include\wdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\pzero.f
# End Source File
# Begin Source File

SOURCE=..\..\program\pzeroi.f
# End Source File
# Begin Source File

SOURCE=..\..\plot\pzerol.f
# End Source File
# Begin Source File

SOURCE=..\..\program\reader.f
DEP_F90_READE=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pdata3.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\prstrs.h"\
	"..\..\..\ver14\include\strnum.h"\
	"..\..\..\ver14\include\tdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\readfl.f
DEP_F90_READF=\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\iosave.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\reshis.f
DEP_F90_RESHI=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\restrt.f
DEP_F90_RESTR=\
	"..\..\..\ver14\include\arclel.h"\
	"..\..\..\ver14\include\arcler.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\counts.h"\
	"..\..\..\ver14\include\ddata.h"\
	"..\..\..\ver14\include\dyndat.h"\
	"..\..\..\ver14\include\evdata.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\gltran.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ndata.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\prlod.h"\
	"..\..\..\ver14\include\rdata.h"\
	"..\..\..\ver14\include\tdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\rprint.f
DEP_F90_RPRIN=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pdata2.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\prmptd.h"\
	"..\..\..\ver14\include\rpdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\rstprf.f
DEP_F90_RSTPR=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\savefl.f
DEP_F90_SAVEF=\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\iosave.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\sblke.f
DEP_F90_SBLKE=\
	"..\..\..\ver14\include\cdat2.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\trdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\sblkn.f
DEP_F90_SBLKN=\
	"..\..\..\ver14\include\cdat2.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\trdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\scalev.f
# End Source File
# Begin Source File

SOURCE=..\..\program\segint1.f
# End Source File
# Begin Source File

SOURCE=..\..\program\serchl.f
DEP_F90_SERCH=\
	"..\..\..\ver14\include\endata.h"\
	"..\..\..\ver14\include\hdatam.h"\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\setclp.f
DEP_F90_SETCL=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\plclip.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\seteq.f
DEP_F90_SETEQ=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\mxsiz.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\setfor.f
DEP_F90_SETFO=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\prld1.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\sethis.f
DEP_F90_SETHI=\
	"..\..\..\ver14\include\hdatam.h"\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\setmac.f
# End Source File
# Begin Source File

SOURCE=..\..\program\setmem.f
DEP_F90_SETME=\
	"..\..\..\ver14\include\allotd.h"\
	"..\..\..\ver14\include\allotn.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\debugs.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\psize.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\setpcd.f
# End Source File
# Begin Source File

SOURCE=..\..\program\setval.f
DEP_F90_SETVA=\
	"..\..\..\ver14\include\codat.h"\
	"..\..\..\ver14\include\conval.h"\
	"..\..\..\ver14\include\errchk.h"\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\shap1d.f
# End Source File
# Begin Source File

SOURCE=..\..\program\shap2.f
# End Source File
# Begin Source File

SOURCE=..\..\program\shapef.f
# End Source File
# Begin Source File

SOURCE=..\..\elements\shell2d.f
DEP_F90_SHELL=\
	"..\..\..\ver14\include\bdata.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\eltran.h"\
	"..\..\..\ver14\include\evdata.h"\
	"..\..\..\ver14\include\hdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\mdata.h"\
	"..\..\..\ver14\include\pmod2d.h"\
	"..\..\..\ver14\include\strnum.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\elements\shell3d.f
DEP_F90_SHELL3=\
	"..\..\..\ver14\include\bdata.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\elplot.h"\
	"..\..\..\ver14\include\eltran.h"\
	"..\..\..\ver14\include\evdata.h"\
	"..\..\..\ver14\include\hdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\mdata.h"\
	"..\..\..\ver14\include\prld1.h"\
	"..\..\..\ver14\include\prstrs.h"\
	"..\..\..\ver14\include\shlc16.h"\
	"..\..\..\ver14\include\shld16.h"\
	"..\..\..\ver14\include\shle16.h"\
	"..\..\..\ver14\include\shpf16.h"\
	"..\..\..\ver14\include\sstr16.h"\
	"..\..\..\ver14\include\strnum.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\shp1d.f
DEP_F90_SHP1D=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\shp1dh.f
# End Source File
# Begin Source File

SOURCE=..\..\program\SHP1DN.F
# End Source File
# Begin Source File

SOURCE=..\..\program\shp2d.f
# End Source File
# Begin Source File

SOURCE=..\..\program\shp3d.f
# End Source File
# Begin Source File

SOURCE=..\..\elements\solid2d.f
DEP_F90_SOLID=\
	"..\..\..\ver14\include\augdat.h"\
	"..\..\..\ver14\include\bdata.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\elengy.h"\
	"..\..\..\ver14\include\elm2d.h"\
	"..\..\..\ver14\include\elplot.h"\
	"..\..\..\ver14\include\eltran.h"\
	"..\..\..\ver14\include\evdata.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\hdata.h"\
	"..\..\..\ver14\include\incshp.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pmod2d.h"\
	"..\..\..\ver14\include\prld1.h"\
	"..\..\..\ver14\include\prstrs.h"\
	"..\..\..\ver14\include\ptdat6.h"\
	"..\..\..\ver14\include\rdata.h"\
	"..\..\..\ver14\include\strnum.h"\
	"..\..\..\ver14\include\tdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\elements\solid3d.f
DEP_F90_SOLID3=\
	"..\..\..\ver14\include\bdata.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\elplot.h"\
	"..\..\..\ver14\include\eltran.h"\
	"..\..\..\ver14\include\evdata.h"\
	"..\..\..\ver14\include\hdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pmod2d.h"\
	"..\..\..\ver14\include\prld1.h"\
	"..\..\..\ver14\include\prstrs.h"\
	"..\..\..\ver14\include\rdata.h"\
	"..\..\..\ver14\include\strnum.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\sproja.f
DEP_F90_SPROJ=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\sprojb.f
DEP_F90_SPROJB=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\stime.f
DEP_F90_STIME=\
	"..\..\..\ver14\include\etime1.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\store.f
DEP_F90_STORE=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\subsp.f
DEP_F90_SUBSP=\
	"..\..\..\ver14\include\compas.h"\
	"..\..\..\ver14\include\evdata.h"\
	"..\..\..\ver14\include\gltran.h"\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\tblk.f
DEP_F90_TBLK_=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\tetshp.f
DEP_F90_TETSH=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\elements\therm2d.f
DEP_F90_THERM=\
	"..\..\..\ver14\include\bdata.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\eltran.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\mdata.h"\
	"..\..\..\ver14\include\pmod2d.h"\
	"..\..\..\ver14\include\prstrs.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\elements\therm3d.f
DEP_F90_THERM3=\
	"..\..\..\ver14\include\bdata.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\eltran.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\mdata.h"\
	"..\..\..\ver14\include\pmod2d.h"\
	"..\..\..\ver14\include\prstrs.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\tiefor.f
DEP_F90_TIEFO=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\tienod.f
DEP_F90_TIENO=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\tinput.f
DEP_F90_TINPU=\
	"..\..\..\ver14\include\chdata.h"\
	"..\..\..\ver14\include\comfil.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\ioincl.h"\
	"..\..\..\ver14\include\iosave.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\tint2d.f
DEP_F90_TINT2=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\tint3d.f
# End Source File
# Begin Source File

SOURCE=..\..\program\tjac3d.f
# End Source File
# Begin Source File

SOURCE=..\..\windows\tplot.f
DEP_F90_TPLOT=\
	"..\..\..\ver14\include\pdatap.h"\
	"..\..\..\ver14\include\pdatps.h"\
	"..\..\..\ver14\include\pdatxt.h"\
	"..\..\..\ver14\include\plflag.h"\
	"..\..\..\ver14\include\psdat3.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\trishp.f
# End Source File
# Begin Source File

SOURCE=..\..\elements\trussnd.f
DEP_F90_TRUSS=\
	"..\..\..\ver14\include\augdat.h"\
	"..\..\..\ver14\include\bdata.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\eldata.h"\
	"..\..\..\ver14\include\elplot.h"\
	"..\..\..\ver14\include\eltran.h"\
	"..\..\..\ver14\include\hdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pmod2d.h"\
	"..\..\..\ver14\include\prld1.h"\
	"..\..\..\ver14\include\prstrs.h"\
	"..\..\..\ver14\include\ptdat6.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\user\ualloc.f
DEP_F90_UALLO=\
	"..\..\..\ver14\include\allotd.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\user\uasble.f
# End Source File
# Begin Source File

SOURCE=..\..\user\ublk.f
DEP_F90_UBLK_=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\user\uconst.f
# End Source File
# Begin Source File

SOURCE=..\..\user\udynam.f
# End Source File
# Begin Source File

SOURCE=..\..\user\uglobl.f
# End Source File
# Begin Source File

SOURCE=..\..\user\uiters.f
DEP_F90_UITER=\
	"..\..\..\ver14\include\allotd.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\compac.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\psize.h"\
	"..\..\..\ver14\include\sdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\umaclib.f
# End Source File
# Begin Source File

SOURCE=..\..\user\umacr1.f
DEP_F90_UMACR=\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\umac1.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\user\umacr2.f
DEP_F90_UMACR2=\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\umac1.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\user\umacr3.f
DEP_F90_UMACR3=\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\umac1.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\user\umacr4.f
DEP_F90_UMACR4=\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\umac1.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\user\umacr5.f
DEP_F90_UMACR5=\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\umac1.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\user\umesh.f
DEP_F90_UMESH=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\user\umesh1.f
# End Source File
# Begin Source File

SOURCE=..\..\user\umesh2.f
# End Source File
# Begin Source File

SOURCE=..\..\user\umesh3.f
# End Source File
# Begin Source File

SOURCE=..\..\user\umesh4.f
# End Source File
# Begin Source File

SOURCE=..\..\user\umesh5.f
# End Source File
# Begin Source File

SOURCE=..\..\user\umod1d.f
# End Source File
# Begin Source File

SOURCE=..\..\user\umodel.f
# End Source File
# Begin Source File

SOURCE=..\..\program\umshlib.f
# End Source File
# Begin Source File

SOURCE=..\..\user\uparam.f
# End Source File
# Begin Source File

SOURCE=..\..\program\update.f
DEP_F90_UPDAT=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\ddata.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\print.h"\
	"..\..\..\ver14\include\sdata.h"\
	"..\..\..\ver14\include\tdatb.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\user\uplot.f
# End Source File
# Begin Source File

SOURCE=..\..\user\usetci.f
# End Source File
# Begin Source File

SOURCE=..\..\program\usetlib.f
# End Source File
# Begin Source File

SOURCE=..\..\user\usetm1.f
# End Source File
# Begin Source File

SOURCE=..\..\user\usetm2.f
# End Source File
# Begin Source File

SOURCE=..\..\user\usetm3.f
# End Source File
# Begin Source File

SOURCE=..\..\user\usetm4.f
# End Source File
# Begin Source File

SOURCE=..\..\user\usetm5.f
# End Source File
# Begin Source File

SOURCE=..\..\program\usetmem.f
DEP_F90_USETM=\
	"..\..\..\ver14\include\allotd.h"\
	"..\..\..\ver14\include\allotn.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\user\usolve.f
# End Source File
# Begin Source File

SOURCE=..\..\program\vblke.f
DEP_F90_VBLKE=\
	"..\..\..\ver14\include\cdat2.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\trdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\vblkn.f
DEP_F90_VBLKN=\
	"..\..\..\ver14\include\cdat2.h"\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\trdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\vecp.f
# End Source File
# Begin Source File

SOURCE=..\..\program\vinput.f
# End Source File
# Begin Source File

SOURCE=..\..\plot\visbl.f
DEP_F90_VISBL=\
	"..\..\..\ver14\include\ppers.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\wprojm.f
DEP_F90_WPROJ=\
	"..\..\..\ver14\include\iofile.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\program\writer.f
DEP_F90_WRITE=\
	"..\..\..\ver14\include\cdata.h"\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\fdata.h"\
	"..\..\..\ver14\include\iodata.h"\
	"..\..\..\ver14\include\iofile.h"\
	"..\..\..\ver14\include\pdata3.h"\
	"..\..\..\ver14\include\prstrs.h"\
	"..\..\..\ver14\include\strnum.h"\
	"..\..\..\ver14\include\tdata.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\xcompp.f
# End Source File
# Begin Source File

SOURCE=..\..\plot\xpline.f
DEP_F90_XPLIN=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pbody.h"\
	"..\..\..\ver14\include\pdata4.h"\
	"..\..\..\ver14\include\pdatas.h"\
	"..\..\..\ver14\include\pdatxt.h"\
	"..\..\..\ver14\include\pointer.h"\
	
# End Source File
# Begin Source File

SOURCE=..\..\plot\zoom.f
DEP_F90_ZOOM_=\
	"..\..\..\ver14\include\comblk.h"\
	"..\..\..\ver14\include\pdata1.h"\
	"..\..\..\ver14\include\pdata4.h"\
	"..\..\..\ver14\include\pointer.h"\
	"..\..\..\ver14\include\ppers.h"\
	
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# End Group
# End Target
# End Project
