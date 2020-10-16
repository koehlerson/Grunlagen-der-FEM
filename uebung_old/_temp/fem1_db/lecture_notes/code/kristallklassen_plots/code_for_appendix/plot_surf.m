function plot_surf(x,y,z,r,name)

figure(1)
  % plot surface
	surf(x,y,z,r,...
	'FaceColor','interp',...
	'EdgeColor','none',...
	'FaceLighting','gouraud');
	
	hold on
	material shiny;
	axis equal;
  % no grid
	grid off;
  % no Matlab standard axes
	axis off
  % choose color map
	colormap('autumn')
  % adjust angle of view
	az = 142.5000;
	el =  30;
	view(az, el);
  % adjust lighting
	camlight('left')
  % constitute principal axes
    linethickness = 1.5;
    linelength    = 1.2*max([max(max(x)),max(max(y)),max(max(z))]);   
	line([0 linelength],[0 0],[0 0],'color','k','linewidth',linethickness)
	line([0 0],[0 linelength],[0 0],'color','k','linewidth',linethickness)
	line([0 0],[0 0],[0 linelength],'color','k','linewidth',linethickness)
    axis([-inf linelength -inf linelength -inf linelength])
  % establish narrow heads
    stepr    = 20;
    stepphi  = 50;
    rp       = 0.04 * max([max(max(x)),max(max(y)),max(max(z))]);
    height   = 0.25 * max([max(max(x)),max(max(y)),max(max(z))]);
    % 3. principal axis
    [xp,yp,zp] = cone(stepr,stepphi,rp,height,3);
	plot3(xp,yp,zp+linelength,'k')
    % 1. principal axis
	[xp,yp,zp] = cone(stepr,stepphi,rp,height,1);
	plot3(xp+linelength,yp,zp,'k')
    % 2. principal axis
	[xp,yp,zp] = cone(stepr,stepphi,rp,height,2);
	plot3(xp,yp+linelength,zp,'k')
  % save plot
    saveas(gcf,[name],'psc') %'..\',
