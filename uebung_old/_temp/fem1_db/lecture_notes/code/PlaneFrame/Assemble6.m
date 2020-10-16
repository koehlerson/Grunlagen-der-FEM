%\begin{verbatim}
function y = Assemble6(K,k,I,J,IJ)
%--------------------------------------------------------------------
% Assembly routine for element with six active dofs
a = I(1);
b = I(2);
c = I(3);
d = J(1);
e = J(2);
f = J(3);
K(a,a) = K(a,a) + k(1,1);
K(a,b) = K(a,b) + k(1,2);
K(a,c) = K(a,c) + k(1,3);
K(a,d) = K(a,d) + k(1,4);
K(a,e) = K(a,e) + k(1,5);
K(a,f) = K(a,f) + k(1,6);
K(b,a) = K(b,a) + k(2,1);
K(b,b) = K(b,b) + k(2,2);
K(b,c) = K(b,c) + k(2,3);
K(b,d) = K(b,d) + k(2,4);
K(b,e) = K(b,e) + k(2,5);
K(b,f) = K(b,f) + k(2,6);
K(c,a) = K(c,a) + k(3,1);
K(c,b) = K(c,b) + k(3,2);
K(c,c) = K(c,c) + k(3,3);
K(c,d) = K(c,d) + k(3,4);
K(c,e) = K(c,e) + k(3,5);
K(c,f) = K(c,f) + k(3,6);
K(d,a) = K(d,a) + k(4,1);
K(d,b) = K(d,b) + k(4,2);
K(d,c) = K(d,c) + k(4,3);
K(d,d) = K(d,d) + k(4,4);
K(d,e) = K(d,e) + k(4,5);
K(d,f) = K(d,f) + k(4,6);
K(e,a) = K(e,a) + k(5,1);
K(e,b) = K(e,b) + k(5,2);
K(e,c) = K(e,c) + k(5,3);
K(e,d) = K(e,d) + k(5,4);
K(e,e) = K(e,e) + k(5,5);
K(e,f) = K(e,f) + k(5,6);
K(f,a) = K(f,a) + k(6,1);
K(f,b) = K(f,b) + k(6,2);
K(f,c) = K(f,c) + k(6,3);
K(f,d) = K(f,d) + k(6,4);
K(f,e) = K(f,e) + k(6,5);
K(f,f) = K(f,f) + k(6,6);
y = K;
%\end{verbatim}