\begin{verbatim}
function y = Assemble1(K,k,I,J,IJ)
%--------------------------------------------------------------------
% Assembly routine for element with one active dof
i = find([ I' J' ] ~= 0);
switch i
    case 1,  a = I(1);
    case 2,  a = I(2);
    case 3,  a = J(1);
    case 4,  a = J(2);
end
K(a,a) = K(a,a) + k(IJ,IJ);
y = K;
\end{verbatim}