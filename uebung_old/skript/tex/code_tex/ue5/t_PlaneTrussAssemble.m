\begin{verbatim}
function y = PlaneTrussAssemble(K,k,I,J,IJ)
%--------------------------------------------------------------------
%Input:  element stiffnes matrix
%Output: updated global stiffnes matrix
%--------------------------------------------------------------------
if size(find([ I' J' ] ~= 0),2)     == 1
    K = Assemble1(K,k,I,J,IJ);
elseif size(find([ I' J' ] ~= 0),2) == 2
    K = Assemble2(K,k,I,J,IJ);
elseif size(find([ I' J' ] ~= 0),2) == 3
    K = Assemble3(K,k,I,J,IJ);
elseif size(find([ I' J' ] ~= 0),2) == 4
    K = Assemble4(K,k,I,J,IJ);
end
y = K;
\end{verbatim}
