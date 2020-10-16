% MAIN PROGRAM
%--------------------------------------------------------------------
% FEM for simple plane struss structures
%--------------------------------------------------------------------
%
%--------------------------------------------------------------------
% Please use following variables [rows x colums]:
%  num_ele .............[1 x 1] number of elements
%  num_nodes ...........[1 x 1] number of nodes (global)
%  connectivity ..[2 x num_ele] connectivity array
%  elementdata ...[num_ele x 2] stiffnes and area of cross-section
%  X ...........[2 x num_nodes] nodal coordinate array
%  num_bc ..............[1 x 1] number of zero boundary displacements
%  num_eq ..............[1 x 1] number of equations (reduced system)
%  assembleid ..[2 x num_nodes] matrix of assemble id
%  K .........[num_eq x num_eq] global stiffness matrix
%  k ...................[4 x 4] element stiffness matrix
%  R ..............[num_eq x 1] global force vector
%  num_loads ...........[1 x 1] number of nodes with non-zero load
%  u ..............[num_eq x 1] displacement vector (solution vector)
%
%--------------------------------------------------------------------

%-read general properties--------------------------------------------


%-define nodes, coordinates and stiffnes (E and A) for elements------


%-compute number of equations----------------------------------------


%-assemble matrix----------------------------------------------------


%-compute global stiffnes matrix-------------------------------------


%-global force vector------------------------------------------------


%-displacement computed by Gaussian elimination----------------------


%-print the data-----------------------------------------------------

