function [xp,yp,zp] = zylinder(stepr,stepphi,rp,hoehe,dircetion)
%
% Gibt die Koordinaten einer Kegeloberflaeche zurueck
% stepr ....... Anzahl der Radien zwischen 0 und rp
% stepphi ..... Anzahl der Winkel zwischen 0 und 2*pi
% rp .......... Radius am offenen Ende des Kegels
% hoehe ....... Hoehe des Kegels
% direction ... Richtung der Kegelspitze
%

%stepr = 10;
%stepphi = 50;

rp = linspace(rp,0,stepr);
phip = linspace(0,2*pi,stepphi);
hoehe = linspace(0,hoehe,stepr);

switch dircetion
    case 1
        for ii = 1:stepr
            yp(ii,:) = rp(ii) * cos(phip);
            zp(ii,:) = rp(ii) * sin(phip);
            xp(ii,:) = hoehe(ii)*ones(1,stepphi);
        end
    case 2
        for ii = 1:stepr
            zp(ii,:) = rp(ii) * cos(phip);
            xp(ii,:) = rp(ii) * sin(phip);
            yp(ii,:) = hoehe(ii)*ones(1,stepphi);
        end        
    case 3
        for ii = 1:stepr
            xp(ii,:) = rp(ii) * cos(phip);
            yp(ii,:) = rp(ii) * sin(phip);
            zp(ii,:) = hoehe(ii)*ones(1,stepphi);
        end
end