\begin{verbatim}
function [xyz_new] = rotation_z(phi,xyz_old)
% Rotation of a point with the coordinates 'xyz'
% around the z-axis with angle 'phi'
%
% input:  phi     [1x1] ... angle
%         xyz_old [3x1] ... vector of coordinates
% output: xyz_new [3x1] ... vector of rotated coordinates

% Rotary matrix
R = [ cos(phi) -sin(phi) 0;
      sin(phi)  cos(phi) 0;
          0        0     1];
% Compute rotated coordinates
xyz_new = R * xyz_old;
\end{verbatim}
