\begin{verbatim}
% open figure window
figure(1)
% clear previous figures
clf
% t-values
t=0:pi/20:2*pi;
% plot sin, plotstyle: dashdot-red-stars
plot(t,sin(t),'-.r*')
% hold on necessary for multiple plots in one window
 hold on % leave out first and show what happens
% plot -sin, plotstyle: doubledash-magenta-circles
plot(t,(sin(t-pi/2)),'--mo')
% plot -cos, plotstyle: 
x_line = t;
y_line = zeros(size(t,1),size(t,2));
% x_line = [min(t) max(t)];
% y_line = [0 0]
line(x_line,y_line,'linestyle',':','color','b','marker','s')
% hold off necessary so that possible following plots appear in new window
 hold off % leave out first and show what happens
% plot(t,2*sin(t))
% close all
\end{verbatim}
