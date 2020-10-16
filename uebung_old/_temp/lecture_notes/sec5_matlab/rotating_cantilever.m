clear all; clc; close all;
%--- Geometrical Parameter ---
% Height of vertical rod
H = 10;
% Length of cantilever arm
L = 5;
% Radius of sphere
R = 1;
% Angle between vertical rod and cantilever arm
alpha = 90*pi/180;
% Series of angle of rotation
phi = linspace(0,2*pi,100);
%--- Basic Coordinates ---
% Uniform sphere (r=1)
[xk yk zk] = sphere;
% Scaling of sphere by R
xk = R.*xk;
yk = R.*yk;
zk = R.*zk;
% Points of veritcal rod's ends
P1 = [0 ; 0 ; 0];
P2 = P1 + [0 ; 0 ; H];
% Point of sphere's center in inital position
P30 = [ L * sin(alpha) ; 0 ; -L * cos(alpha)];
%--- Plot Procedure ---
% Create new figure with number 1
figure(1)
% Limits of axis
axis([-5  5 -5 5 0 15])
% Equal aspect ratio to all axis
axis equal
% Show grid
grid on
% Plot of vertical rod
line([P1(1) P2(1)],[P1(2) P2(2)],[P1(3) P2(3)] ,...
     'linewidth', 2 , 'color' , 'k');
%--- Begin of Animation ---
for istep = 1 : size(phi,2)
  % Delete previous plot objects if necessary
  if istep > 1
      % Sphere
      delete(id_kugel)
      % cantilever arm
      delete(id_line)
  end
  % Rotary matrix
  R = [ cos(phi(istep)) -sin(phi(istep)) 0;
        sin(phi(istep))  cos(phi(istep)) 0;
            0                  0         1];
  % Actual point of sphere's center
  P3 = P1 + P2 + R*P30;
  % Plot of sphere
  id_kugel = surface(P3(1)+xk,P3(2)+yk,P3(3)+zk);
  % Hold current graph
  hold on
  % Plot of cantilever arm
  id_line = line([P2(1) P3(1)],[P2(2) P3(2)],[P2(3) P3(3)] ,...
                 'linewidth', 2 , 'color' , 'k');
  % Update of screen
  drawnow
end