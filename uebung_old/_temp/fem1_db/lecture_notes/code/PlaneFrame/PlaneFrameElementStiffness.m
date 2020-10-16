%\begin{verbatim}
function y = PlaneFrameElementStiffness(E,A,I,node_i,node_j)
%-compute element stiffnes matrix------------------------------------
L = sqrt((node_j(1) - node_i(1))^2 + (node_j(2) - node_i(2))^2);
if node_j(1) == node_i(1)
    if node_i(2) > node_j(2)
        theta = -pi/2;
    elseif node_i(2) < node_j(2)
        theta = pi/2;
    end
elseif node_j(2) == node_i(2)
    if node_i(1) < node_j(1)
        theta = 0;
    elseif node_i(1) > node_j(1)
        theta = -pi;
    end                
elseif node_j(1) < node_i(1)    
    theta = atan((node_j(2) - node_i(2))/(node_j(1) - node_i(1))) ...
            + pi;
else 
    theta = atan((node_j(2) - node_i(2))/(node_j(1) - node_i(1)));
end
C = cos(theta);
S = sin(theta);
T = [  C  S  0  0  0  0  ; 
      -S  C  0  0  0  0  ; 
       0  0  1  0  0  0  ; 
       0  0  0  C  S  0  ; 
       0  0  0 -S  C  0  ; 
       0  0  0  0  0  1  ];
y = E/L*[  A  0         0     -A   0         0      ; 
           0  12*I/L^2  6*I/L  0  -12*I/L^2  6*I/L  ; 
           0  6*I/L     4*I    0  -6*I/L     2*I    ; 
          -A  0         0      A   0         0      ; 
           0 -12*I/L^2 -6*I/L  0   12*I/L^2 -6*I/L  ;
           0  6*I/L     2*I    0  -6*I/L     4*I    ];
y = T'*y*T;
%\end{verbatim}