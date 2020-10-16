function y = Assemble1(K,k,I,J,IJ)
%--------------------------------------------------------------------
% Assembly routine for element with one active dof

%--------------------------------------------------------------------
% Please use following variables [rows x colums]:
%  K .....[num_eq x num_eq] global stiffness matrix
%  k ...............[4 x 4] element stiffness matrix
%  I ...............[2 x 1] assemble ids of first local node
%  J ...............[2 x 1] assemble ids of second local node
%  IJ ..............[n x 1] index of local degrees of freedom, which
%                           are not bounded
%  y .....[num_eq x num_eq] ouput: updated global stiffness matrix