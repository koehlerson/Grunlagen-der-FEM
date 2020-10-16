  % Delete previous plot objects if necessary
  if istep > 1
      % Sphere
      delete(id_kugel)
      % cantilever arm
      delete(id_line)
  end
  %--- Using of new function frotation_z ---
  % Actual point of sphere's center
  P3 = P1 + P2 + frotation_z(phi(istep),P30);
  %--------------------------------------------
  % Plot of sphere
  id_kugel = surface(P3(1)+xk,P3(2)+yk,P3(3)+zk);