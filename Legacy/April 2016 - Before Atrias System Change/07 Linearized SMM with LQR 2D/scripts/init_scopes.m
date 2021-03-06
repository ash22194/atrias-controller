%% Create initial scopes
create_core_scopes;

% %% Setup additional target scopes
% number_of_tscopes = 1;
% scope_update_freq = 250; % Hz
% decimation = update_freq / scope_update_freq;
% num_samples = 250;
% tscopes = [];
% for i=1:number_of_tscopes
%     tscopes = [tscopes tg.addscope('target')];
% end
% 
% set(tscopes(1), ...
%     {'NumSamples', 'Decimation', 'TriggerMode', 'DisplayMode'}, ...
%     {num_samples,  decimation,  'FreeRun',     'Numerical'});
% 
% %% Add signals for target scopes
% 
% tscopes(1).addsignal(getsignalid(tg,'DAQ/EtherCAT Init/s1'));
% tscopes(1).addsignal(getsignalid(tg,'DAQ/EtherCAT Init/s2'));
% tscopes(1).addsignal(getsignalid(tg,'DAQ/EtherCAT Init/s3'));
% tscopes(1).addsignal(getsignalid(tg,'DAQ/EtherCAT Init/s4'));
% tscopes(1).addsignal(getsignalid(tg,'DAQ/EtherCAT Init/s5'));
% tscopes(1).addsignal(getsignalid(tg,'DAQ/EtherCAT Init/s6'));
% 
% tscopes.start();

%% Setup additional file scopes
decimation = update_freq / 250;
num_samples = 1000;
number_of_fscopes = 1;
fscopes = [];
for i=1:number_of_fscopes
    fscopes = [fscopes tg.addscope('file')];
end
set(fscopes(1:number_of_fscopes), ...
    {'NumSamples', 'Decimation', 'WriteMode', 'AutoRestart', 'DynamicFileName'}, ...
    {num_samples,  decimation,  'Lazy',      'on',          'on'});


%% Add signals to file scopes
% Controller Data
set(fscopes(1),'FileName','E:\CONT_<%%%>.dat');
% ATRIAS State Machine (1 to 7)
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/system_state/s1')); % TouchDown
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/system_state/s2')); % LockedContact
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/system_state/s3')); % Unloading
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/system_state/s4')); % Takeoff
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/system_state/s5')); % Flight
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/right_left/s1')); % Right/Left Primary
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/vertical_grf/s1')); % Estimated vertical force
% COM position and velocity (8 to 23)
% Using boom:
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/State Estimation/com_state_from_boom/s1')); % horizontal COM position
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/State Estimation/com_state_from_boom/s2')); % horizontal COM velocity
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/State Estimation/com_state_from_boom/s3')); % vertical COM position
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/State Estimation/com_state_from_boom/s4')); % vertical COM velocity
% Using robot geometry:
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/State Estimation/com_state_from_robot/s1')); % horizontal COM position
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/State Estimation/com_state_from_robot/s2')); % horizontal COM velocity
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/State Estimation/com_state_from_robot/s3')); % lateral COM position
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/State Estimation/com_state_from_robot/s4')); % lateral COM velocity
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/State Estimation/com_state_from_robot/s5')); % vertical COM position
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/State Estimation/com_state_from_robot/s6')); % vertical COM velocity
% Using Kalman filter:
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/State Estimation/kalman_dx_z_dz/s1')); % horizontal COM velocity
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/State Estimation/kalman_dx_z_dz/s2')); % vertical COM position
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/State Estimation/kalman_dx_z_dz/s3')); % vertical COM velocity
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/State Estimation/kalman_uncertainty/s1'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/State Estimation/kalman_uncertainty/s2'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/State Estimation/kalman_uncertainty/s3'));
% Active controller (24,25)
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/hopping/s1'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/deadbeat/s1'));
% Inverse dynamics (26 to 31)
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Stance/Inverse Dynamics 2D/desired_forward_GRF/s1'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Stance/Inverse Dynamics 2D/desired_vertical_GRF/s1'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/right_leg_grfs/s1'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/right_leg_grfs/s2'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/left_leg_grfs/s1'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/left_leg_grfs/s2'));
% Flight (32 to 37)
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Flight/fourbar_desired_position/s1')); % back desired position
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Flight/fourbar_desired_position/s2')); % front desired position
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Flight/fourbar_desired_velocity/s1')); % back desired velocity
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Flight/fourbar_desired_velocity/s2')); % front desired velocity
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Flight/fourbar_desired_acceleration/s1')); % back desired acceleration
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Flight/fourbar_desired_acceleration/s2')); % front desired acceleration
% Gear position kalman filter (38 to 53)
fscopes(1).addsignal(getsignalid(tg,'Fourbar Gearside Kalman Filter/kalman_filtered_position/s1'));
fscopes(1).addsignal(getsignalid(tg,'Fourbar Gearside Kalman Filter/kalman_filtered_position/s2'));
fscopes(1).addsignal(getsignalid(tg,'Fourbar Gearside Kalman Filter/kalman_filtered_position/s3'));
fscopes(1).addsignal(getsignalid(tg,'Fourbar Gearside Kalman Filter/kalman_filtered_position/s4'));
fscopes(1).addsignal(getsignalid(tg,'Fourbar Gearside Kalman Filter/kalman_filtered_velocity/s1'));
fscopes(1).addsignal(getsignalid(tg,'Fourbar Gearside Kalman Filter/kalman_filtered_velocity/s2'));
fscopes(1).addsignal(getsignalid(tg,'Fourbar Gearside Kalman Filter/kalman_filtered_velocity/s3'));
fscopes(1).addsignal(getsignalid(tg,'Fourbar Gearside Kalman Filter/kalman_filtered_velocity/s4'));
fscopes(1).addsignal(getsignalid(tg,'Fourbar Gearside Kalman Filter/kalman_uncertainty/s1'));
fscopes(1).addsignal(getsignalid(tg,'Fourbar Gearside Kalman Filter/kalman_uncertainty/s2'));
fscopes(1).addsignal(getsignalid(tg,'Fourbar Gearside Kalman Filter/kalman_uncertainty/s3'));
fscopes(1).addsignal(getsignalid(tg,'Fourbar Gearside Kalman Filter/kalman_uncertainty/s4'));
fscopes(1).addsignal(getsignalid(tg,'Fourbar Gearside Kalman Filter/kalman_uncertainty/s5'));
fscopes(1).addsignal(getsignalid(tg,'Fourbar Gearside Kalman Filter/kalman_uncertainty/s6'));
fscopes(1).addsignal(getsignalid(tg,'Fourbar Gearside Kalman Filter/kalman_uncertainty/s7'));
fscopes(1).addsignal(getsignalid(tg,'Fourbar Gearside Kalman Filter/kalman_uncertainty/s8'));
% Deadbeat (54 to 69)
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Stance/z_reference/s1'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Stance/z_reference/s2'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Stance/z_reference/s3'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Stance/x_reference/s1'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Stance/x_reference/s2'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Flight/x_touchdown/s1'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Flight/y_touchdown/s1'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Flight/current_desired_foot_position/s1'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Flight/current_desired_foot_position/s2'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Flight/current_desired_foot_position/s3'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Flight/current_desired_foot_position/s4'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Flight/current_desired_foot_position/s5'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Flight/current_desired_foot_position/s6'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Flight/current_desired_foot_position/s7'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Flight/current_desired_foot_position/s8'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Flight/current_desired_foot_position/s9'));
% Target leg rolls (70 to 72)
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/deadbeat_target_leg_roll/s1'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/deadbeat_target_leg_roll/s2'));
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/deadbeat_target_leg_roll/s3'));
% Closed loop feedback (73)
fscopes(1).addsignal(getsignalid(tg,'Control/Behavior Control/Primary Leg Behavior/Running/Closed Loop Compensation/x_foot_correction/s1'));


fscopes.start();

%%
msgbox('Scopes Initialized!');