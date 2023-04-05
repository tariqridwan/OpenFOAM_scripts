% This program calculates the smallest cell size: dx
% in a mesh created by blockMesh in OpenFOAM
% Algorithm taken from OpenFOAM tutorial guide v2212, p. 34.
%            -------
% written by Tariq Ridwan: https://tariqridwan.github.io/
% Universitat Politècnica de Catalunya
clear
format long
l = 0.1/2;          % entire length if the domain's edge
n = 40;             % number of cells
Rr = 2;             % Ratio of length, Last/First cell
r = Rr^(1/(n-1));   % Ratio between one cell and the next
if Rr>1
    alpha = Rr;
else
    alpha = 1-r^(-n)+1/r;
end
dx = l*(r-1)/(alpha*r-1)    % smallest cell size
% Co = dt*U/dx                % Courant number
Co = 1;
U = 1;                      % velocity
dt = Co*dx/U                % time-step size