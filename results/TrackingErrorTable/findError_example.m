%Example of how to find error bound:

% For finding the quad error bound:
N = [51 51 ceil(51/8) ceil(51/5) 51 51];
stateMin = [-5; -5; -35*pi/180; -1 ; -5; -5];
stateMax = [ 5;  5;  35*pi/180; 1; 5; 5];
%quadState [x;vx;roll;roll_rate;z;vz]
quadState = [3;1;10*pi/180;0.1;3;0.2];
%planState [x;z]
planState = [2.9;2.8];
[x_error_bound,z_error_bound] = findTrackingErrorQuad(quadState,planState,stateMin,stateMax,N) %unit: m

% For finding the payload error bound:
N = [41 41 41 21];
stateMin =  [-15*pi/180; -15*pi/180; -15*pi/180; -10*pi/180];
stateMax = [15*pi/180; 15*pi/180; 15*pi/180; 10*pi/180];
%payloadState [payload_roll;quad_roll;payload_roll_rate]
payloadState = [10*pi/180; 5*pi/180; 5*pi/180];
%planState [x;z]
planState = [8*pi/180];
phi_error_bound = findTrackingErrorPayload(payloadState,planState,stateMin,stateMax,N) %unit: rad


