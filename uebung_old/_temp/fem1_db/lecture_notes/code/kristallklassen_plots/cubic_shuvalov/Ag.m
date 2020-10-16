clear all
close all

A = [...
124 93.4 93.4 0.0 0.0 0.0
93.4 124 93.4 0.0 0.0 0.0
93.4 93.4 124 0.0 0.0 0.0
0.0 0.0 0.0 46.1 0.0 0.0
0.0 0.0 0.0 0.0 46.1 0.0
0.0 0.0 0.0 0.0 0.0 46.1];
inverseC = inv(A);
ii = 0;
jj = 0;
for theta = -pi:(pi/100):pi
  ii = ii + 1;
  jj = 0;
for phi = -(pi/2):(pi/100):(pi/2)
  d(1) = cos(phi)*cos(theta);
  d(2) = cos(phi)*sin(theta);
  d(3) = sin(phi);
  for i=1:3
      for j=1:3
          mm(i,j) = d(i) * d(j);
      end
  end
  dbasis(1)=mm(1,1);
  dbasis(2)=mm(2,2);
  dbasis(3)=mm(3,3);
  dbasis(4)=mm(2,3);
  dbasis(5)=mm(1,3);
  dbasis(6)=mm(1,2);
  for i=1:6 
    smm(i) = 0.0;
    for j=1:6
      smm(i) = smm(i) + inverseC(i,j)*dbasis(j);
    end
  end
  emodinv = 0.0;
  for j=1:6
   emodinv = emodinv + dbasis(j)*smm(j);
  end
  jj = jj + 1;
  r(ii,jj) = 1.0/emodinv;
  x(ii,jj) = r(ii,jj)*cos(phi)*cos(theta); 
  y(ii,jj) = r(ii,jj)*cos(phi)*sin(theta);
  z(ii,jj) = r(ii,jj)*sin(phi);
end
end

% uebergeordnete Verzeichnisebene als include-verzeichnis hinzufuegen
  addpath('..');

% Verzeichnisnamen auslesen (entspricht Kristallklasse)
  pfad = pwd;
  trenn = strfind(pfad,'\');
  verzeichnis = pfad(trenn(1,size(trenn,2))+1:size(pfad,2));

zeichne_surf(x,y,z,r,[verzeichnis,'_Ag']);

% figure(1)
%   % Oberflaeche plotten
% 	surf(x,y,z,r,...
% 	'FaceColor','interp',...
% 	'EdgeColor','none',...
% 	'FaceLighting','gouraud');
% 	
% 	hold on
% 	
% 	material shiny;
% 	
% 	axis equal;
%   % Kein Raster
% 	grid off;
%   % Keine Standard-Matlab-Achsen
% 	axis off
% 	colormap('autumn')
%   % Blickwinkel einstellen
% 	az =  142.5000;
% 	el = 30;
% 	view(az, el);
%   % Beleuchtung ausrichten
% 	camlight('left')
%   % Hauptachsen erzeugen
%     liniendicke = 1.5;
%     linienlaenge = 100;
% 	line([0 linienlaenge],[0 0],[0 0],'color','k','linewidth',liniendicke)
% 	line([0 0],[0 linienlaenge],[0 0],'color','k','linewidth',liniendicke)
% 	line([0 0],[0 0],[0 linienlaenge],'color','k','linewidth',liniendicke)
%   % Verzeichnisnamen auslesen (entspricht Kristallklasse)
%     pfad = pwd;
%     trenn = strfind(pfad,'\');
%     verzeichnis = pfad(trenn(1,size(trenn,2))+1:size(pfad,2));
%   % Pfeilspitzen an Hauptachsen erzeugen
%   % ACHTUNG!: Funktion 'kegel' muss eine Verzeichnisebene hoeher liegen
%     stepr = 15;
%     stepphi = 50;
%     rp = 3;
%     % Verzeichnisebene nach oben
%     cd ..
%     % 3. Hauptachse
%     [xp,yp,zp] = kegel(stepr,stepphi,rp,3);
% 	plot3(xp,yp,zp+100,'k')
%     % 1. Hauptachse
% 	[xp,yp,zp] = kegel(stepr,stepphi,rp,1);
% 	plot3(xp+100,yp,zp,'k')
%     % 2. Hauptachse
% 	[xp,yp,zp] = kegel(stepr,stepphi,rp,2);
% 	plot3(xp,yp+100,zp,'k')
%     % zurueck in Kristallklassenverzeichnis
%     cd(verzeichnis);
%   % Bild speichern
%     saveas(gcf,[verzeichnis,'_Ag'],'psc')

    
    
% figure(2)
% surf(x,y,z,r,...
% 'FaceColor','interp',...
% 'EdgeColor','none',...
% 'FaceLighting','gouraud');
% camlight left;
% material shiny;
% axis equal;
% grid off;
% axis off
% colormap('gray')
% saveas(gcf,'Ag_gray','ps')    
    
    
% figure(3)
% surf(x,y,z,r,...
% 'FaceColor','interp',...
% 'EdgeColor','none',...
% 'FaceLighting','gouraud');
% camlight left;
% material shiny;
% axis equal;
% grid off;
% axis off
% colormap('white')
% saveas(gcf,'Ag_white','ps')