function [xp,yp,zp] = zylinder(stepr,stepphi,rp,height,direction)

rp = linspace(rp,0,stepr);
phip = linspace(0,2*pi,stepphi);
height = linspace(0,height,stepr);

switch direction
    case 1
        for ii = 1:stepr
            yp(ii,:) = rp(ii) * cos(phip);
            zp(ii,:) = rp(ii) * sin(phip);
            xp(ii,:) = height(ii) * ones(1,stepphi);
        end
    case 2
        for ii = 1:stepr
            zp(ii,:) = rp(ii) * cos(phip);
            xp(ii,:) = rp(ii) * sin(phip);
            yp(ii,:) = height(ii) * ones(1,stepphi);
        end        
    case 3
        for ii = 1:stepr
            xp(ii,:) = rp(ii) * cos(phip);
            yp(ii,:) = rp(ii) * sin(phip);
            zp(ii,:) = height(ii) * ones(1,stepphi);
        end
end