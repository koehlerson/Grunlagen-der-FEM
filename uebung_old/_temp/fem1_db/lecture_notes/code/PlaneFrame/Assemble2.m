%\begin{verbatim}
function y = Assemble2(K,k,I,J,IJ)
%--------------------------------------------------------------------
% Assembly routine for element with two active dofs
l = find(I ~= 0);
m = find(J ~= 0);
if size(l,1) == 2
    a = I(l(1));
    b = I(l(2));    
elseif size(m,1) == 2
    a = J(m(1));
    b = J(m(2));    
elseif size(l,1) == 1 & size(m,1) == 1
    a = I(l(1));
    b = J(m(1));
end
K(a,a) = K(a,a) + k(IJ(1),IJ(1));
K(a,b) = K(a,b) + k(IJ(1),IJ(2));
K(b,a) = K(b,a) + k(IJ(2),IJ(1));
K(b,b) = K(b,b) + k(IJ(2),IJ(2));
y = K;
%\end{verbatim}