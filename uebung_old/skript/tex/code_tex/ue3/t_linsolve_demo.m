\begin{verbatim}
% n x m matrix
K=[1 2 3;4 5 6]
% n x n submatrix
k=K(1:2,2:3)
%  right hand side (make sure its a column vector)
f=[10;11]
% solve k*u=f for u
u=fsolvelineqs(k,f)
% check solution
u_check=linsolve(k,f)
% second check
f_check=k*u
\end{verbatim}
