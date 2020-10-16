\begin{verbatim}
% MAIN PROGRAM
%------------------------------------------------------------------------------
% FEM for simple plane struss structures
%------------------------------------------------------------------------------
clear all
close all
%-read general properties------------------------------------------------------
num_ele = input('Give the total number of elements. num_ele = ');
num_nodes = input('Give the total number of nodes. num_nodes = ');
disp(' ');
%-define nodes, coordinates and stiffnes (E and A) for elements----------------
for i = 1:num_ele
    fprintf('Element no.%g\n',i);
    connectivity(1,i) = input('  global node for 1st local node = ');
    connectivity(2,i) = input('  global node for 2nd local node = ');
    elementdata(i,:)  = input('  element data           [ E A ] = ');
    disp(' ');
end
for i = 1:num_nodes
    fprintf('Node no.%g\n',i);
    X(:,i) = input('  node coordinates [ x y ] = ')';
    disp(' ');
end
%-compute number of equations--------------------------------------------------
num_bc = input('No. of displacement boundary conditions. num_bc = ');
num_eq = num_nodes*2 - num_bc;
%-assemble matrix--------------------------------------------------------------
for i = 1:num_nodes
    assembleid(1,i) = 2*i - 1;
    assembleid(2,i) = 2*i;
end
for i = 1:num_bc
    dbc = input('  no. of constrained degrees of freedom = ');
    r = find(assembleid == dbc);
    assembleid(r) = 0;
end
F = find(assembleid ~= 0);
FA = sort(F);
for i = 1:size(F,1)
    assembleid(FA(i)) = i;
end
%-compute global stiffnes matrix-----------------------------------------------
K = zeros(num_eq,num_eq);
for i = 1:num_ele
    k = PlaneTrussElementStiffness(elementdata(i,1),elementdata(i,2) ... 
                               ,X(:,connectivity(1,i)),X(:,connectivity(2,i)));
    I = assembleid(:,connectivity(1,i));
    J = assembleid(:,connectivity(2,i));
    IJ = find(( [ I J ] ) ~= 0);
    K = PlaneTrussAssemble(K,k,I,J,IJ);
end
disp(' ');
%-global force vector----------------------------------------------------------
R = zeros(num_eq,1);
num_loads = input('No. of nodes with non-zero load vectors. num_loads = ');
for i = 1:num_loads
    lbc = input('  no. of node with non-zero load vector = ');
    if assembleid(2*lbc-1) ~= 0 & assembleid(2*lbc) ~= 0
        R(assembleid(2*lbc-1)) = input('    force in global x-direction = ');
        R(assembleid(2*lbc))   = input('    force in global y-direction = ');
    elseif assembleid(2*lbc-1) ~= 0
        R(assembleid(2*lbc-1)) = input('    force in global x-direction = ');
    elseif assembleid(2*lbc) ~= 0
        R(assembleid(2*lbc))   = input('    force in global y-direction = ');
    elseif assembleid(2*lbc-1) == 0 & assembleid(2*lbc) == 0
        disp('    All the degrees of freedom in this node are constrained!');
        pause(1);
    end
end
%-displacement computed by Gaussian elimination--------------------------------
u = K\R;
%-print the data---------------------------------------------------------------
disp(' ');
disp('Element connectivity table');
disp(' ');
disp('  =============================')
disp('  |  E  |  Node i  |  Node j  |')
disp('  =============================')
for i = 1:num_ele
    fprintf('  |  %g  |     %g    |     %g    |' ...
                                        ,i,connectivity(1,i),connectivity(2,i))
    disp(' ');
end
disp('  =============================')
disp(' ');disp('global stiffness matrix'); K
disp(' ');disp('global force vector    '); R
disp(' ');disp('displacement vector    '); u
\end{verbatim}
