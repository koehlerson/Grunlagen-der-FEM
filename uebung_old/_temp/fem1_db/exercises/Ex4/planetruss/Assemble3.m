%\begin{verbatim}
function y = Assemble3(K,k,I,J,IJ)
%--------------------------------------------------------------------
% Assembly routine for element with three active dofs
if size(find(I ~= 0),1) == 1
    a = I(find(I ~= 0));
    b = J(1);
    c = J(2);
elseif size(find(J ~= 0),1) == 1
    a = I(1);
    b = I(2);
    c = J(find(J ~= 0));
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