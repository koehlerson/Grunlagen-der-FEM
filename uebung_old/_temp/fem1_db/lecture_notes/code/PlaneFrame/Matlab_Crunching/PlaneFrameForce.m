%\begin{verbatim}
function y = PlaneFrameForce(connectivity,assembleid,num_eq,X)
%-distributed loads--------------------------------------------------
R = zeros(num_eq,1);
num_d_loads = ...
    input('no. of elements with distributed load. num_d_loads = ');
for i = 1:num_d_loads
    dlbc = input('  no. of element with distributed load = ');
    q = input('    value of load. q = ');
    i = connectivity(1,dlbc);
    j = connectivity(2,dlbc);
    L = sqrt((X(1,j) - X(1,i))^2 + (X(2,j) - X(2,i))^2);
    theta = atan((X(2,j) - X(2,i))/(X(1,j) - X(1,i)));
    if X(1,i) == X(1,j) | X(2,i) == X(2,j)
        if assembleid(3*i-1) ~= 0
            R(assembleid(3*i-1)) = R(assembleid(3*i-1)) + q*L/2;
        end
        if assembleid(3*i) ~= 0
            R(assembleid(3*i))   = R(assembleid(3*i)) + q*L^2/12;
        end
        if assembleid(3*j-1) ~= 0       
            R(assembleid(3*j-1)) = R(assembleid(3*j-1)) + q*L/2;
        end
        if assembleid(3*j) ~= 0            
            R(assembleid(3*j))   = R(assembleid(3*j)) + (-q*L^2/12);
        end
    else
        alfa = abs(theta);
        if theta > 0
            if assembleid(3*i-2) ~= 0                
                R(assembleid(3*i-2)) = R(assembleid(3*i-2)) + ...
                                      -q*L/2*sin(alfa);
            end
            if assembleid(3*j-2) ~= 0
                R(assembleid(3*j-2)) = R(assembleid(3*j-2)) + ...
                                      -q*L/2*sin(alfa);
            end
        elseif theta < 0
            if assembleid(3*i-2) ~= 0
                R(assembleid(3*i-2)) = R(assembleid(3*i-2)) + ...
                                       q*L/2*sin(alfa);
            end
            if assembleid(3*j-2) ~= 0
                R(assembleid(3*j-2)) = R(assembleid(3*j-2)) + ...
                                       q*L/2*sin(alfa);
            end
        end
        if assembleid(3*i-1) ~= 0
            R(assembleid(3*i-1)) = R(assembleid(3*i-1)) + ...
                                   q*L/2*cos(alfa);
        end        
        if assembleid(3*i) ~= 0
            R(assembleid(3*i))   = R(assembleid(3*i)) + ...
                                   q*L^2/12;
        end        
        if assembleid(3*j-1) ~= 0
            R(assembleid(3*j-1)) = R(assembleid(3*j-1)) + ...
                                   q*L/2*cos(alfa);
        end        
        if assembleid(3*j) ~= 0
            R(assembleid(3*j))   = R(assembleid(3*j)) + ...
                                  -q*L^2/12;
        end    
    end
end
disp(' ');
%-nodal loads--------------------------------------------------------
num_loads = ...
    input('no. of nodes with non-zero load vectors. num_loads = ');
for i = 1:num_loads
    lbc = input('  no. of node with non-zero load vector. ');
    if assembleid(3*lbc-2) ~= 0
        R(assembleid(3*lbc-2)) = ...
            R(assembleid(3*lbc-2)) + ...
            input('    force in global x-direction = ');
    end
    if assembleid(3*lbc-1) ~= 0
        R(assembleid(3*lbc-1)) = ...
            R(assembleid(3*lbc-1)) + ...
            input('    force in global y-direction = ');     
    end
    if assembleid(3*lbc) ~= 0
        R(assembleid(3*lbc)) = ...
            R(assembleid(3*lbc)) + ...
            input('    nodal moment                = ');
    end
    if assembleid(3*lbc-2) == 0 & assembleid(3*lbc-1) == 0 & ...
       assembleid(3*lbc) == 0
        disp('all degrees of freedom in this node are constrained!');
        pause(1);
    end
end
y = R;
%\end{verbatim}