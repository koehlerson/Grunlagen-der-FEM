clear all
close all

A = [...
32.7 8.6 24.9 12.4 0.0 0.0
8.6 32.7 24.9 -12.4 0.0 0.0
24.9 24.9 72.2 0.0 0.0 0.0
12.4 -12.4 0.0 31.2 0.0 0.0
0.0 0.0 0.0 0.0 31.2 12.4
0.0 0.0 0.0 0.0 12.4 12.05];
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

zeichne_surf(x,y,z,r,[verzeichnis,'_Te']);
