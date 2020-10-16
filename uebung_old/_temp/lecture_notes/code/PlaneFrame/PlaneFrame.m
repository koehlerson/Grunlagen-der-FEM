%\begin{verbatim}
% MAIN PROGRAM
%--------------------------------------------------------------------
% FEM for simple plane frame structures
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
    elementdata(i,:)  = input('  element data         [ E A I ] = ');
    disp(' ');
end
for i = 1:num_nodes
    fprintf('node no.%g\n',i);
    X(:,i) = input('  node coordinates [ x y ] = ')';
    disp(' ');
end
%-compute number of equations----------------------------------------
num_bc = input('no. of displacement boundary conditions. num_bc = ');
num_eq = num_nodes*3 - num_bc;
%-assemble matrix----------------------------------------------------
for i = 1:num_nodes
    assembleid(1,i) = 3*i - 2;
    assembleid(2,i) = 3*i - 1;
    assembleid(3,i) = 3*i;
end
for i = 1:num_bc
    dbc = input('  no. of constrained degrees of freedom = ');
    r = find(assembleid == dbc);
    assembleid(r) = 0;
end
F = find(assembleid ~= 0);
for i = 1:size(F,1)
    assembleid(F(i)) = i;
end
%-compute global stiffnes matrix-------------------------------------
K = zeros(num_eq,num_eq);
for i = 1:num_ele
    k = PlaneFrameElementStiffness(elementdata(i,1), ...
        elementdata(i,2),elementdata(i,3), ...
        X(:,connectivity(1,i)),X(:,connectivity(2,i)));
    I = assembleid(:,connectivity(1,i));
    J = assembleid(:,connectivity(2,i));    
    IJ = find(( [ I J ] ) ~= 0);
    K = PlaneFrameAssemble(K,k,I,J,IJ);
end
disp(' ');
%-global force vector------------------------------------------------
R = PlaneFrameForce(connectivity,assembleid,num_eq,X);
%-displacement computed by Gaussian elimination----------------------
u = K\R;
%-print the data-----------------------------------------------------
disp(' ');
disp('element connectivity table');
disp(' ');
disp('  =============================')
disp('  |  E  |  Node i  |  Node j  |')
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
%\end{verbatim}