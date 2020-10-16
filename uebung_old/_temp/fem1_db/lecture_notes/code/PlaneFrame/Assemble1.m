%\begin{verbatim}
function y = Assemble1(K,k,I,J,IJ)
%--------------------------------------------------------------------
% Assembly routine for element with one active dof
if IJ <= 3
    a = I(IJ);
elseif IJ >= 4
    a = J(IJ);
end
K(a,a) = K(a,a) + k(IJ,IJ);
y = K;
%\end{verbatim}