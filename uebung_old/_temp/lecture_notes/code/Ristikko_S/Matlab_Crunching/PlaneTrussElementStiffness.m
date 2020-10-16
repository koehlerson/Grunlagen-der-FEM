%\begin{verbatim}
function y = PlaneTrussElementStiffness(E,A,node_i,node_j)
%-compute element stiffnes matrix------------------------------------
L = sqrt((node_j(1) - node_i(1))^2 + (node_j(2) - node_i(2))^2);
if node_j(1) == node_i(1)
    if node_i(2) > node_j(2)
        theta = -pi/2;
    elseif node_i(2) < node_j(2)
        theta = pi/2;
    end
else
    theta = atan((node_j(2) - node_i(2))/(node_j(1) - node_i(1)));
end
C = cos(theta);
S = sin(theta);
y = E*A/L*[ C*C  C*S -C*C -C*S ;
            C*S  S*S -C*S -S*S ;
           -C*C -C*S  C*C  C*S ;
           -C*S -S*S  C*S  S*S ];
%\end{verbatim}