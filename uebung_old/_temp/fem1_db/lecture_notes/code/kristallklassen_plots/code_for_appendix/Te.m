clear all
close all
% input elasticities
C = [...
32.7   8.6  24.9   0.0  12.4   0.0
8.6   32.7  24.9   0.0 -12.4   0.0
24.9  24.9  72.2   0.0   0.0   0.0
0.0    0.0   0.0  12.1   0.0  12.4
12.4 -12.4   0.0   0.0  31.2   0.0
0.0    0.0   0.0  12.4   0.0  31.2];
% compute inverse of elasticities inverseC
inverseC = inv(C);
% compute characteristic surface of Youngs's moduli
ii = 0;
jj = 0;
% spherical coordinates theta and phi
for theta = -pi:(pi/100):pi
    ii = ii + 1;
    jj = 0;
    for phi = -(pi/2):(pi/100):(pi/2)
        % compute tensile direction d(3)
        d(1) = cos(phi) * cos(theta);
        d(2) = cos(phi) * sin(theta);
        d(3) = sin(phi);
        % compute stresses in tensile direction
        stress(1) = d(1) * d(1);
        stress(2) = d(2) * d(2);
        stress(3) = d(3) * d(3);
        stress(4) = d(1) * d(2);
        stress(5) = d(2) * d(3);
        stress(6) = d(1) * d(3);
        for i = 1:6 
            strain(i) = 0.0;
            for j = 1:6
                strain(i) = strain(i) + inverseC(i,j) * stress(j);
            end
        end
        emodinv = 0.0;
        for j = 1:6
            emodinv = emodinv + stress(j) * strain(j);
        end
        jj = jj + 1;
        % Young's modulus r(ii,jj)
        r(ii,jj) = 1.0 / emodinv;
        x(ii,jj) = r(ii,jj) * cos(phi) * cos(theta); 
        y(ii,jj) = r(ii,jj) * cos(phi) * sin(theta);
        z(ii,jj) = r(ii,jj) * sin(phi);
    end
end
plot_surf(x,y,z,r,['surface_tellurium']);