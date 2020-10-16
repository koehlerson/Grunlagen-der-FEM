\begin{verbatim}
% MAIN PROGRAM
%--------------------------------------------------------------------
% FEM for simple plane struss structures
%--------------------------------------------------------------------
clear all
close all
%-read general properties--------------------------------------------
num_ele   = input('give the total number of elements. num_ele = ');
num_nodes = input('give the total number of nodes.  num_nodes = ');
disp(' ');
%-define nodes, coordinates and stiffnes (E and A) for elements------
for i = 1:num_ele
    fprintf('element no.%g\n',i);
    connectivity(1,i) = input('  global node for 1st local node = ');
    connectivity(2,i) = input('  global node for 2nd local node = ');
    elementdata(i,:)  = input('  element data           [ E A ] = ');
    disp(' ');
end
for i = 1:num_nodes
    fprintf('node no.%g\n',i);
    X(:,i) = input('  global node coordinates [ x y ] = ')';
    disp(' ');
end
%-compute number of equations----------------------------------------
disp('give the total number of displacement boundary conditions')
num_bc = input('                                        num_bc = ');
num_eq = num_nodes*2 - num_bc;
%-assemble matrix----------------------------------------------------
assembleid = -ones(2,num_nodes);
disp('    input of global dofs with zero boundary displacements')
disp('                                   for i from 1 to num_bc')
for i = 1:num_bc
    node = ...
    input('        global node of constrained degree of freedom = ');
    dof = ...
    input('          degree of freedom to constrained (1=x,2=y) = ');
    assembleid(dof,node) = 0;
end
idof = 0;
for i = 1:num_nodes
    for j = 1:2
        if assembleid(j,i) ~= 0
            idof = idof + 1;
            assembleid(j,i) = idof;
        end
    end    
end
%-compute global stiffnes matrix-------------------------------------
K = zeros(num_eq,num_eq);
for i = 1:num_ele
    k = PlaneTrussElementStiffness(elementdata(i,1), ...
    elementdata(i,2),X(:,connectivity(1,i)),X(:,connectivity(2,i)));
    I = assembleid(:,connectivity(1,i));
    J = assembleid(:,connectivity(2,i));
    IJ = find(( [ I J ] ) ~= 0);
    K = PlaneTrussAssemble(K,k,I,J,IJ);
end
disp(' ');
%-global force vector------------------------------------------------
R = zeros(num_eq,1);
disp('give the total number of nodes with non-zero load vectors')
num_loads = ...
          input('                                     num_loads = ');
disp('             input of load vectors for i from 1 to num_loads')
for i = 1:num_loads
    lbc = input('  no. of global node with non-zero load vector = ');
    if assembleid(2*lbc-1) ~= 0 & assembleid(2*lbc) ~= 0
        R(assembleid(2*lbc-1)) = ...
        input('                   force in global x-direction = ');
        R(assembleid(2*lbc))   = ...
        input('                   force in global y-direction = ');
    elseif assembleid(2*lbc-1) ~= 0
        R(assembleid(2*lbc-1)) = ...
        input('                   force in global x-direction = ');
    elseif assembleid(2*lbc) ~= 0
        R(assembleid(2*lbc))   = ...
        input('                   force in global y-direction = ');
    elseif assembleid(2*lbc-1) == 0 & assembleid(2*lbc) == 0
        disp('all degrees of freedom in this node are constrained!');
        pause(1);
    end
end
%-displacement computed by Gaussian elimination----------------------
u = K\R;
%-print the data-----------------------------------------------------
disp(' ');
disp('element connectivity table');
disp(' ');
disp('  =============================')
disp('  |  e  |  Node i  |  Node j  |')
disp('  =============================')
for i = 1:num_ele
    fprintf('  |  %g  |     %g    |     %g    |', ...
    i,connectivity(1,i),connectivity(2,i))
    disp(' ');
end
disp('  =============================')
disp(' ');disp('global stiffness matrix'); K
disp(' ');disp('global force vector    '); R
disp(' ');disp('displacement vector    '); u
\end{verbatim}
