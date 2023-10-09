% This program calculates the smallest cell size: dx and maximum time-step 
% size dt for a Graded mesh created by blockMesh utility in OpenFOAM
% Algorithm taken from OpenFOAM tutorial guide v2212, p. 34.
%            -------
% written by Tariq Ridwan: 👉 https://tariqridwan.github.io/
% Universitat Politècnica de Catalunya, Barcelona
clear
format long
%% Domain/grid configuration
l = 0.1/2;        % entire length of the domain's edge
n = 40;           % number of cells
Rr = 2;           % Ratio of length, Last/First cell
r = Rr^(1/(n-1)); % Ratio between one cell and the next // stretching rate
if Rr>1
    alpha = Rr;
else
    alpha = 1-r^(-n)+1/r;
end
%% CALCULATION
dx = l*(r-1)/(alpha*r-1) % Calculate smallest cell size
% Co = dt*U/dx           % Courant number term
Co = 1;
U = 1;                   % velocity
dt = Co*dx/U             % Calculate Max time-step size for the given Co
