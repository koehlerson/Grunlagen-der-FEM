%\begin{verbatim}
function y = Assemble5(K,k,I,J,IJ)
%--------------------------------------------------------------------
% Assembly routine for element with five active dofs
l = find(I ~= 0);
m = find(J ~= 0);
if size(l,1) == 2
a = I(l(1));
b = I(l(2));
c = J(1);
d = J(2);
e = J(3);
elseif size(m,1) == 2
a = I(1);
b = I(2);
c = I(3);
d = J(m(1));
e = J(m(2));
end
K(a,a) = K(a,a) + k(IJ(1),IJ(1));
K(a,b) = K(a,b) + k(IJ(1),IJ(2));
K(a,c) = K(a,c) + k(IJ(1),IJ(3));
K(a,d) = K(a,d) + k(IJ(1),IJ(4));
K(a,e) = K(a,e) + k(IJ(1),IJ(5));
K(b,a) = K(b,a) + k(IJ(2),IJ(1));
K(b,b) = K(b,b) + k(IJ(2),IJ(2));
K(b,c) = K(b,c) + k(IJ(2),IJ(3));
K(b,d) = K(b,d) + k(IJ(2),IJ(4));
K(b,e) = K(b,e) + k(IJ(2),IJ(5));
K(c,a) = K(c,a) + k(IJ(3),IJ(1));
K(c,b) = K(c,b) + k(IJ(3),IJ(2));
K(c,c) = K(c,c) + k(IJ(3),IJ(3));
K(c,d) = K(c,d) + k(IJ(3),IJ(4));
K(c,e) = K(c,e) + k(IJ(3),IJ(5));
K(d,a) = K(d,a) + k(IJ(4),IJ(1));
K(d,b) = K(d,b) + k(IJ(4),IJ(2));
K(d,c) = K(d,c) + k(IJ(4),IJ(3));
K(d,d) = K(d,d) + k(IJ(4),IJ(4));
K(d,e) = K(d,e) + k(IJ(4),IJ(5));
K(e,a) = K(e,a) + k(IJ(5),IJ(1));
K(e,b) = K(e,b) + k(IJ(5),IJ(2));
K(e,c) = K(e,c) + k(IJ(5),IJ(3));
K(e,d) = K(e,d) + k(IJ(5),IJ(4));
K(e,e) = K(e,e) + k(IJ(5),IJ(5));
y = K;
%\end{verbatim}