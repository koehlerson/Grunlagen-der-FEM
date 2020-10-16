function zeichne_surf(x,y,z,r,name)

figure(1)
  % Oberflaeche plotten
	surf(x,y,z,r,...
	'FaceColor','interp',...
	'EdgeColor','none',...
	'FaceLighting','gouraud');
	
	hold on
	
	material shiny;
	
	axis equal;
  % Kein Raster
	grid off;
  % Keine Standard-Matlab-Achsen
	axis off
	colormap('autumn')
  % Blickwinkel einstellen
	az =  142.5000;
	el = 30;
	view(az, el);
  % Beleuchtung ausrichten
	camlight('left')
  % Hauptachsen erzeugen
    liniendicke = 1.5;
    linienlaenge = 1.2*max([max(max(x)),max(max(y)),max(max(z))]);   
	line([0 linienlaenge],[0 0],[0 0],'color','k','linewidth',liniendicke)
	line([0 0],[0 linienlaenge],[0 0],'color','k','linewidth',liniendicke)
	line([0 0],[0 0],[0 linienlaenge],'color','k','linewidth',liniendicke)
    axis([-inf linienlaenge -inf linienlaenge -inf linienlaenge])
  % Pfeilspitzen an Hauptachsen erzeugen
    stepr = 20;%round(max([max(max(x)),max(max(y)),max(max(z))])/3);
    stepphi = 50;
    rp = 0.04 * max([max(max(x)),max(max(y)),max(max(z))]);
    hoehe = 0.25 * max([max(max(x)),max(max(y)),max(max(z))]);
    % 3. Hauptachse
    [xp,yp,zp] = kegel(stepr,stepphi,rp,hoehe,3);
	plot3(xp,yp,zp+linienlaenge,'k')
    % 1. Hauptachse
	[xp,yp,zp] = kegel(stepr,stepphi,rp,hoehe,1);
	plot3(xp+linienlaenge,yp,zp,'k')
    % 2. Hauptachse
	[xp,yp,zp] = kegel(stepr,stepphi,rp,hoehe,2);
	plot3(xp,yp+linienlaenge,zp,'k')
  % Bild speichern
    saveas(gcf,['..\',name],'psc')
