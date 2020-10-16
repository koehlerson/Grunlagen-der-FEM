% Der Kollokationsverfahren

clear all
close all

% Parameter
l = 1;
A = 1;
E = 1;
c = 10;
n = 2;

for k = 1:n
    for i = 1:n
        xkol(i) = i*l/(n + 1);
        phi(k,i) = xkol(i)^k*(l - xkol(i));
        phip(k,i) = k*xkol(i)^(k - 1)*(l - xkol(i)) - xkol(i)^k;
        phipp(k,i) = k*(k - 1)*xkol(i)^(k - 2)*(l - xkol(i)) - 2*k*xkol(i)^(k - 1);
    end
end

phipp(1,1) = -2;
p = exp(xkol/l);
rechte = -p;

for i = 1:n
    for j = 1:n
        linke(i,j) = E*A*phipp(j,i) - c*phi(j,i);
    end
end

koeff = linke\rechte';
x = 0:.01:l;
p = exp(x/l);

for k = 1:n
    for i = 1:size(x,2)
        phi(k,i) = x(i)^k*(l - x(i));
        phipp(k,i) = k*(k - 1)*x(i)^(k - 2)*(l - x(i)) - 2*k*x(i)^(k - 1);
    end
end

phipp(1,1) = -2;
utilde = koeff'*phi;
residuum = E*A*koeff'*phipp - c*koeff'*phi + p;

for i = 1:size(x,2)
    ua(i) = -1/E/A/(c/E/A)^(1/2)*(1/2/((c/E/A)^(1/2)*l+1)*l*cosh(x(i)*((c/E/A)^(1/2)*l+1)/l)-1/2/((c/E/A)^(1/2)*l-1)*l*cosh(x(i)*((c/E/A)^(1/2)*l-1)/l)+ ... 
        1/2*sinh(x(i)*((c/E/A)^(1/2)*l+1)/l)/((c/E/A)^(1/2)*l+1)*l+1/2*sinh(x(i)*((c/E/A)^(1/2)*l-1)/l)/((c/E/A)^(1/2)*l-1)*l)*sinh((c/E/A)^(1/2)*x(i))+ ... 
        1/E/A/(c/E/A)^(1/2)*(1/2*sinh(x(i)*((c/E/A)^(1/2)*l+1)/l)/((c/E/A)^(1/2)*l+1)*l-1/2*sinh(x(i)*((c/E/A)^(1/2)*l-1)/l)/((c/E/A)^(1/2)*l-1)*l+ ... 
        1/2/((c/E/A)^(1/2)*l+1)*l*cosh(x(i)*((c/E/A)^(1/2)*l+1)/l)+1/2/((c/E/A)^(1/2)*l-1)*l*cosh(x(i)*((c/E/A)^(1/2)*l-1)/l))*cosh((c/E/A)^(1/2)*x(i))+ ... 
        l^2*(-exp((c/E/A)^(1/2)*l)^2-1+2*exp((c/E/A)^(1/2)*l+1))/(exp((c/E/A)^(1/2)*l)-1)/(exp((c/E/A)^(1/2)*l)+1)/(-c*l^2+E*A)*sinh((c/E/A)^(1/2)*x(i))+ ... 
        l^2/(-c*l^2+E*A)*cosh((c/E/A)^(1/2)*x(i));
end

figure(1)
plot(x,residuum)
grid on
xlabel('x')
ylabel('R(x)     ','rotation',0)
title('n = 2')

figure(2)
plot(x,utilde)
grid on
xlabel('x')
ylabel('u(x)     ','rotation',0)
title('n = 2')

figure(3)
plot(x,ua - utilde)
grid on
xlabel('x')
ylabel('u_a - u_t     ','rotation',0)
title('n = 2')

% -----

% Äquidistante Kollokationspunkte mit Endpunkten

for k = 1:n
    for i = 1:n
        xkol2(i) = (i - 1)*l/(n - 1);
        phi2(k,i) = xkol2(i)^k*(l - xkol2(i));
        phip2(k,i) = k*xkol2(i)^(k - 1)*(l - xkol2(i)) - xkol2(i)^k;
        phipp2(k,i) = k*(k - 1)*xkol2(i)^(k - 2)*(l - xkol2(i)) - 2*k*xkol2(i)^(k - 1);
    end
end

phipp2(1,1) = -2;
p2 = exp(xkol2/l);
rechte2 = -p2;

for i = 1:n
    for j = 1:n
        linke2(i,j) = E*A*phipp2(j,i) - c*phi2(j,i);
    end
end

koeff2 = linke2\rechte2';

x = 0:.01:l;
p2 = exp(x/l);

for k = 1:n
    for i = 1:size(x,2)
        phi2(k,i) = x(i)^k*(l - x(i));
        phipp2(k,i) = k*(k - 1)*x(i)^(k - 2)*(l - x(i)) - 2*k*x(i)^(k - 1);
    end
end

phipp2(1,1) = -2;
utilde2 = koeff2'*phi2;
residuum2 = E*A*koeff2'*phipp2 - c*koeff2'*phi2 + p2;

% Nullstellen des Tschebyscheff-Polynoms

for k = 1:n
    for i = 1:n
        xkol3(i) = (cos((2*i - 1)*pi/(2*n)) + 1)*l/2;
        phi3(k,i) = xkol3(i)^k*(l - xkol3(i));
        phip3(k,i) = k*xkol3(i)^(k - 1)*(l - xkol3(i)) - xkol3(i)^k;
        phipp3(k,i) = k*(k - 1)*xkol3(i)^(k - 2)*(l - xkol3(i)) - 2*k*xkol3(i)^(k - 1);
    end
end

phipp3(1,1) = -2;
p3 = exp(xkol3/l);
rechte3 = -p3;

for i = 1:n
    for j = 1:n
        linke3(i,j) = E*A*phipp3(j,i) - c*phi3(j,i);
    end
end

koeff3 = linke3\rechte3';

x = 0:.01:l;
p3 = exp(x/l);

for k = 1:n
    for i = 1:size(x,2)
        phi3(k,i) = x(i)^k*(l - x(i));
        phipp3(k,i) = k*(k - 1)*x(i)^(k - 2)*(l - x(i)) - 2*k*x(i)^(k - 1);
    end
end

phipp3(1,1) = -2;
utilde3 = koeff3'*phi3;
residuum3 = E*A*koeff3'*phipp3 - c*koeff3'*phi3 + p3;

figure(4)
plot(x,residuum,'-o',x,residuum2,'-s',x,residuum3,'-d','markersize',3)
grid on
xlabel('x')
ylabel('R(x)     ','rotation',0)
title('n = 2')

figure(5)
plot(x,utilde,'-o',x,utilde2,'-s',x,utilde3,'-d',x,ua,'markersize',3)
grid on
axis([ 0 l 0 .25 ])
xlabel('x')
ylabel('u(x)','rotation',0)
title('n = 2')

figure(6)
plot(x,ua - utilde,'-o',x,ua - utilde2,'-s',x,ua - utilde3,'-d','markersize',3)
grid on
xlabel('x')
ylabel('u_a - u_t       ','rotation',0)
title('n = 2')