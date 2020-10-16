%\begin{verbatim}
function y = Assemble4(K,k,I,J,IJ)
%--------------------------------------------------------------------
% Assembly routine for element with four active dofs
a = I(1);
b = I(2);
c = J(1);
d = J(2);
K(a,a) = K(a,a) + k(1,1);
K(a,b) = K(a,b) + k(1,2);
K(a,c) = K(a,c) + k(1,3);
K(a,d) = K(a,d) + k(1,4);
K(b,a) = K(b,a) + k(2,1);
K(b,b) = K(b,b) + k(2,2);
K(b,c) = K(b,c) + k(2,3);
K(b,d) = K(b,d) + k(2,4);
K(c,a) = K(c,a) + k(3,1);
K(c,b) = K(c,b) + k(3,2);
K(c,c) = K(c,c) + k(3,3);
K(c,d) = K(c,d) + k(3,4);
K(d,a) = K(d,a) + k(4,1);
K(d,b) = K(d,b) + k(4,2);
K(d,c) = K(d,c) + k(4,3);
K(d,d) = K(d,d) + k(4,4);
y = K;
%\end{verbatim}