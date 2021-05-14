function [x_error_bound,z_error_bound] = findTrackingErrorQuad(quadState,planState,stateMin,stateMax,N)
%quadState: a vector containing the current state of quadcopter
%planState: a vector conatining the desired planner state in terms of
%positions
%stateMin: a vector containing the minimum state value the lookup-table contains
%stateMax: a vector containing the maximum state value the lookup-table contains
%N: a vector containing the number of grids for each state

if not(exist('dataX','var'))
    load('QuadErrorBound.mat');
x_q = quadState(1);
vx_q = quadState(2);
thetax_q = quadState(3);
omegax_q = quadState(4);
z_q = quadState(5);
vz_q = quadState(6);

x_p = planState(1);
z_p = planState(2);
x_r = x_q - x_p;
z_r = z_q - z_p;

x_array = linspace(stateMin(1),stateMax(1),N(1));
vx_array = linspace(stateMin(2),stateMax(2),N(2));
thetax_array = linspace(stateMin(3),stateMax(3),N(3));
omegax_array = linspace(stateMin(4),stateMax(4),N(4));
z_array = linspace(stateMin(5),stateMax(5),N(5));
vz_array = linspace(stateMin(6),stateMax(6),N(6));

[~,idx_x] = min(abs(x_array-x_r));
[~,idx_vx] = min(abs(vx_array-vx_q));
[~,idx_thetax] = min(abs(thetax_array-thetax_q));
[~,idx_omegax] = min(abs(omegax_array-omegax_q));
[~,idx_z] = min(abs(z_array-z_r));
[~,idx_vz] = min(abs(vz_array-vz_q));

x_error_bound = sqrt(dataX(idx_x,idx_vx,idx_thetax,idx_omegax));
z_error_bound = sqrt(dataZ(idx_z,idx_vz));
end

