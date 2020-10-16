
clear all
close all

% Point-Collocation Method
% -------------------------------------------------------------------
% equidistant collocation points
% -------------------------------------------------------------------
% parameters: system and loading
l = 2.0; A = 1.0; E = 1.0; k = 10.0; p0 = 0.1; deltap = 0.1;
% number of basis functions N_i and collocation points x_j
n = 6;
% collocation points, Ansatz functions, first and second derivatives
for j = 1:n
  for i = 1:n
    xcol(i) = i*l/(n + 1);
    N(j,i)    = xcol(i)^j*(l - xcol(i));
    Nd(j,i)   = j*xcol(i)^(j - 1)*(l - xcol(i)) - xcol(i)^j;
    Ndd(j,i)  = j*(j - 1)*xcol(i)^(j - 2)*(l - xcol(i)) ...
              - 2*j*xcol(i)^(j - 1);
  end
end
% Ndd(1,1) = -2;
% loading function
for i = 1:n
  p(i) = p0 + deltap * xcol(i)/l;
end
% system of equations
for i = 1:n
  for j = 1:n
    Amat(i,j) = E*A*Ndd(j,i) - k*N(j,i);
  end
  Rvec(i) = -p(i);
end
% compute unknowns c_i
Cvec = Amat\Rvec';
% continuous Ansatz functions, second derivative and loading function
x = 0:0.1:l;
for j = 1:n
  for i = 1:size(x,2)
    N(j,i)    = x(i)^j*(l - x(i));
    Ndd(j,i)  = j*(j - 1)*x(i)^(j - 2)*(l - x(i)) - 2*j*x(i)^(j - 1);
  end
end
for i = 1:size(x,2)
  p(i) = p0 + deltap * x(i)/l;
end
Ndd(1,1) = -2;
% Approximate solution and residuals
uapprox  = Cvec'*N;
residual = E*A*Cvec'*Ndd - k*Cvec'*N + p;

% -------------------------------------------------------------------
% equidistant collocation points with endpoints
% -------------------------------------------------------------------
% collocation points, Ansatz functions, first and second derivatives
for j = 1:n
  for i = 1:n
    xcol(i) = (i - 1)*l/(n - 1);
    N(j,i)    = xcol(i)^j*(l - xcol(i));
    Nd(j,i)   = j*xcol(i)^(j - 1)*(l - xcol(i)) - xcol(i)^j;
    Ndd(j,i)  = j*(j - 1)*xcol(i)^(j - 2)*(l - xcol(i)) ...
              - 2*j*xcol(i)^(j - 1);
  end
end
Ndd(1,1) = -2;
% loading function
for i = 1:n
  p(i) = p0 + deltap * xcol(i)/l;
end
% system of equations
for i = 1:n
  for j = 1:n
    Amat(i,j) = E*A*Ndd(j,i) - k*N(j,i);
  end
  Rvec(i) = -p(i);
end
% compute unknowns c_i
Cvec = Amat\Rvec';
% continuous Ansatz functions, second derivative and loading function
x = 0:0.1:l;
for j = 1:n
  for i = 1:size(x,2)
    N(j,i)    = x(i)^j*(l - x(i));
    Ndd(j,i)  = j*(j - 1)*x(i)^(j - 2)*(l - x(i)) ...
              - 2*j*x(i)^(j - 1);
  end
end
for i = 1:size(x,2)
  p(i) = p0 + deltap * x(i)/l;
end
Ndd(1,1) = -2;
% Approximate solution and residuals
uapprox2  = Cvec'*N;
residual2 = E*A*Cvec'*Ndd - k*Cvec'*N + p;

% -------------------------------------------------------------------
% roots of Tschebyscheff-Polynomials
% -------------------------------------------------------------------
% collocation points, Ansatz functions, first and second derivatives
for j = 1:n
  for i = 1:n
    xcol(i) = (cos((2*i - 1)*pi/(2*n)) + 1)*l/2;
    N(j,i)    = xcol(i)^j*(l - xcol(i));
    Nd(j,i)   = j*xcol(i)^(j - 1)*(l - xcol(i)) - xcol(i)^j;
    Ndd(j,i)  = j*(j - 1)*xcol(i)^(j - 2)*(l - xcol(i)) ...
              - 2*j*xcol(i)^(j - 1);
  end
end
Ndd(1,1) = -2;
% loading function
for i = 1:n
  p(i) = p0 + deltap * xcol(i)/l;
end
% system of equations
for i = 1:n
  for j = 1:n
    Amat(i,j) = E*A*Ndd(j,i) - k*N(j,i);
  end
  Rvec(i) = -p(i);
end
% compute unknowns c_i
Cvec = Amat\Rvec';
% continuous Ansatz functions, second derivative and loading function
x = 0:0.1:l;
for j = 1:n
  for i = 1:size(x,2)
    N(j,i)    = x(i)^j*(l - x(i));
    Ndd(j,i)  = j*(j - 1)*x(i)^(j - 2)*(l - x(i)) - 2*j*x(i)^(j - 1);
  end
end
for i = 1:size(x,2)
  p(i) = p0 + deltap * x(i)/l;
end
Ndd(1,1) = -2;
% Approximate solution and residuals
uapprox3  = Cvec'*N;
residual3 = E*A*Cvec'*Ndd - k*Cvec'*N + p;

% Error e=sqrt(int_0^l r(x)^2 dx) (with maple)
nn(1)=2; error1(1)=.7402071690e-1;
         error2(1)=.7752794341;
         error3(1)=.1040312972;
nn(2)=3; error1(2)=.2622001413e-1;
         error2(2)=.4244377967e-1;
         error3(2)=.1967305460e-1;
nn(3)=4; error1(3)=.1917754538e-1;
         error2(3)=.2149441165e-1;
         error3(3)=.1368761610e-1;
nn(4)=5; error1(4)=.4412985264e-2;
         error2(4)=.2439528362e-2;
         error3(4)=.1555970834e-2;
nn(5)=6; error1(5)=.2836328819e-2;
         error2(5)=.1257937413e-2;
         error3(5)=.8832992283e-3;
% nn(6)=7; error1(6)=.4349832915e-3;
%          error2(6)=.1317064858e-3;
%          error3(6)=.7283245566e-4;
% nn(7)=8; error1(7)=.2472905290e-3;
%          error2(7)=.6351353946e-4;
%          error3(7)=.3476386470e-4;

% -------------------------------------------------------------------
% Plot
% -------------------------------------------------------------------
figure(1)
plot(x,uapprox,'-o',x,uapprox2,'-s',x,uapprox3,'-d')
grid on
% axis([ 0 l 0 .25 ])
xlabel('x')
ylabel('u(x)','rotation',0)
title('n = 2')
legend('equidistant points','equidistant with endpoints',...
       'Tschebyscheff polynomial')

figure(2)
plot(x,residual,'-o',x,residual2,'-s',x,residual3,'-d')
grid on
% axis([ 0 l 0 .25 ])
xlabel('x')
ylabel('r(x)','rotation',0)
title('n = 2')
legend('equidistant points','equidistant with endpoints',...
       'Tschebyscheff polynomial')

figure(3)
plot(nn,error1,'-o',nn,error2,'-s',nn,error3,'-d')
grid on
% axis([ 0 l 0 .25 ])
xlabel('x')
ylabel('e(n)','rotation',0)
title('n = 2')
legend('equidistant points','equidistant with endpoints',...
       'Tschebyscheff polynomial')

% figure(1)
% plot(x,uapprox)
% grid on
% xlabel('x')
% ylabel('u(x)     ','rotation',0)
% title('n = 2')

% figure(2)
% plot(x,residual)
% grid on
% xlabel('x')
% ylabel('r(x)     ','rotation',0)
% title('n = 2')

