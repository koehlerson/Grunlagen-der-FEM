\begin{verbatim}
function y = Assemble1(K,k,I,J,IJ)
%------------------------------------------------------------------------------
% ||| Assemble 1 |||
i = (find([ I' J' ]) ~= 0);
if i <= 2
    a = I(i);
elseif i >= 2
    a = J(i);
end
K(a,a) = K(a,a) + k(IJ,IJ);
y = K;
\end{verbatim}
