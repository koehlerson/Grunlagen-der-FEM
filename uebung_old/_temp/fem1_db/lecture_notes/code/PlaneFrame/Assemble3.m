%\begin{verbatim}
function y = Assemble3(K,k,I,J,IJ)
%--------------------------------------------------------------------
% Assembly routine for element with three active dofs
l = find(I ~= 0);
m = find(J ~= 0);
if size(l,1) == 1
    a = I(l(1));
    b = J(m(1));
    c = J(m(2));
elseif size(m,1) == 1
    a = I(l(1));
    b = I(l(2));
    c = J(m(1));
elseif size(l,1) == 3
    a = I(1);
    b = I(2);
    c = I(3);
elseif size(m,1) == 3
    a = J(1);
    b = J(2);
    c = J(3);
end
K(a,a) = K(a,a) + k(IJ(1),IJ(1));
K(a,b) = K(a,b) + k(IJ(1),IJ(2));
K(a,c) = K(a,c) + k(IJ(1),IJ(3));
K(b,a) = K(b,a) + k(IJ(2),IJ(1));
K(b,b) = K(b,b) + k(IJ(2),IJ(2));
K(b,c) = K(b,c) + k(IJ(2),IJ(3));
K(c,a) = K(c,a) + k(IJ(3),IJ(1));
K(c,b) = K(c,b) + k(IJ(3),IJ(2));
K(c,c) = K(c,c) + k(IJ(3),IJ(3));
y = K;
%\end{verbatim}