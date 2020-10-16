\begin{verbatim}
function y = Assemble2(K,k,I,J,IJ)
%--------------------------------------------------------------------
% Assembly routine for element with two active dofs
if size(find(I ~= 0),1) == 2
    a = I(1);
    b = I(2);    
elseif size(find(J ~= 0),1) == 2
    a = J(1);
    b = J(2);    
elseif (size(find(I ~= 0),1) == 1) & (size(find(J ~= 0),1) == 1)
    a = I(find(I ~= 0));
    b = J(find(J ~= 0));
end
i = IJ(1);
j = IJ(2);
K(a,a) = K(a,a) + k(i,i);
K(a,b) = K(a,b) + k(i,j);
K(b,a) = K(b,a) + k(j,i);
K(b,b) = K(b,b) + k(j,j);
y = K;
\end{verbatim}