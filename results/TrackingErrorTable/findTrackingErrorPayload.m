function phi_error_bound = findTrackingErrorPayload(payloadState,planState,stateMin,stateMax,N)
%quadState: a vector containing the current state of quadcopter
%planState: a vector conatining the desired planner state in terms of
%positions
%stateMin: a vector containing the minimum state value the lookup-table contains
%stateMax: a vector containing the maximum state value the lookup-table contains
%N: a vector containing the number of grids for each state

if not(exist('dataPhi','var'))
    load('PayloadRotationErrorBound.mat');
phi_l = payloadState(1);
phi_q = payloadState(2);
omega_l = payloadState(3);
phi_p = planState;
phi_r = phi_l-phi_q;


phi_r_array = linspace(stateMin(1),stateMax(1),N(1));
phi_p_array = linspace(stateMin(2),stateMax(2),N(2));
phi_q_array = linspace(stateMin(3),stateMax(3),N(3));
omega_l_array = linspace(stateMin(4),stateMax(4),N(4));


[~,idx_phi_r] = min(abs(phi_r_array-phi_r));
[~,idx_phi_p] = min(abs(phi_p_array-phi_p));
[~,idx_phi_q] = min(abs(phi_q_array-phi_q));
[~,idx_omega_l] = min(abs(omega_l_array-omega_l));
phi_error_bound = sqrt(dataPhi(idx_phi_r,idx_phi_p,idx_phi_q,idx_omega_l));
end

