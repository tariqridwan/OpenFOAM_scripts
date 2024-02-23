% This program calculates the smallest cell size "dy", maximum time-step 
% size "dt", and Courant number "Co" for a "Graded mesh" created by
% blockMesh utility in OpenFOAM.
% The BlockMesh algorithm is from OpenFOAM tutorial guide v2212, p. 34.
%            -------
% written by Tariq Ridwan 👉 https://tariqridwan.github.io/
% Universitat Politècnica de Catalunya, Barcelona
clear
format long
%% Domain/grid configuration
l = 68.04;        % Length of the computational domain/block's edge
n = 35;           % Number of cells in the edge
Rr = 3.8;         % Ratio of length: Last/First cell
r = Rr^(1/(n-1)); % Cell stretching rate (ratio of two immedicate cells)
if Rr>1
    alpha = Rr;
else
    alpha = 1-r^(-n)+1/r;
end
%% CALCULATION of dy
dy = l*(r-1)/(alpha*r-1) % First (or smallest) cell's length
dy_largest = dy * Rr     % Last (or largest) cell's length
%% CALCULATION of dt
Co = 0.5;  U = 10; % Targetted Courant number (Co) for given velocity (U)
dt = Co*dy/U       % Maximum "allowable" dt based on specified Co & U
%% CALCULATION of Co
dt_new = 0.05; U_new = 10;  % Given time-step size (dt_new) and velocity (U_new)
Co_new = dt_new*U_new/dy    % Courant number based on specified dt_new & U_new
