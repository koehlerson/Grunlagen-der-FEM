function y = PlaneTrussAssemble(K,k,I,J,IJ)
%--------------------------------------------------------------------
% switch to correct assemble routine:
%  1 active local dof --> assemble1
%  2 active local dof --> assemble2
%  3 active local dof --> assemble3
%  4 active local dof --> assemble4
%
% Input:  element stiffnes matrix
% Output: updated global stiffnes matrix
%--------------------------------------------------------------------

%--------------------------------------------------------------------
% Please use following variables [rows x colums]:
%  K .....[num_eq x num_eq] global stiffness matrix
%  k ...............[4 x 4] element stiffness matrix
%  I ...............[2 x 1] assemble ids of first local node
%  J ...............[2 x 1] assemble ids of second local node
%  IJ ..............[n x 1] index of local degrees of freedom, which
%                           are not bounded
%  y .....[num_eq x num_eq] ouput: updated global stiffness matrix