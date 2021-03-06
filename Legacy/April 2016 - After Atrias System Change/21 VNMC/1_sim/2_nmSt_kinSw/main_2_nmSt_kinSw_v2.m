clear all; clc; close all;

model   = 'atrias_boom_nmSt_kinSw_v2';


addpath('../../../../../')
addpath('../../../models/')
addpath('../../../scripts/')
addpath('../../../functions/')


% paramIC     = [1.3; 0; 120; 0.7; 60; 0.8];

param               = ones(51,1);
param(1)            = 0;            % CtrlPar_theta0
param(1+3+1+7)      = .8;           % St_FGain_VAS



%%% initial ATRIAS pose %%%
initial_r_leg_length    = 0.9;
initial_r_leg_angle     = 75*pi/180 + pi/2;
initial_l_leg_length    = 0.88;
initial_l_leg_angle     = 105*pi/180 + pi/2;
ankle_initial_r         = 25*pi/180;
ankle_initial_l         = 45*pi/180;
%%% initial ATRIAS pose %%%



%%% kinematic swing leg control %%%
kinSw_t_start     	= 0.5;              % [sec]
kinSw_alpha_start   = 105*pi/180;       % [rad]

kinSw_alpha_tgt     = 70*pi/180;        % [rad]
kinSw_len_tgt    	= 0.9;              % [m]

% kinSw_alpha_lclr  	= 85*pi/180;        % [rad]
kinSw_lclr          = 0.7;              % [m]
kinSw_tau           = 0.5;              % [sec]v_alpha
%%% kinematic swing leg control %%%



t_end   = 20;

tStart_boomCtrl     = 0.5;
% kp_boom_roll_Ctrl   = 1e10;
% kd_boom_roll_Ctrl   = .1*kp_boom_roll_Ctrl;
% kp_yaw_roll_Ctrl   = 1e10;
% kd_yaw_roll_Ctrl   = .1*kp_yaw_roll_Ctrl;
kp_boom_roll_Ctrl   = 0;
kd_boom_roll_Ctrl   = 0;

v_dTrunk_boom       = 1.3;              % [m/s]
dt_a_dTrunk_boom	= 5;                % [sec]
dt_fade_boomCtrl    = 2;
kp_boom_yaw_Ctrl    = 1e8;
kd_boom_yaw_Ctrl    = 0.1*kp_boom_yaw_Ctrl;

tEnd_boomCtrl       = tStart_boomCtrl+dt_a_dTrunk_boom+dt_fade_boomCtrl;





simulation_params;
mechanical_params;

daq_params_cmu;
model_params;
actuator_control_params;

set_control_params;


initial_boom_yaw    = 15*pi/180;




% map tunable NMCtrl params
tune_M1_G    = St_FGain_VAS*FmaxVAS;
tune_M3_0    = CtrlPar_theta0*180/pi;
tune_M3_P    = St_GainTh_HFL;
tune_M3_D    = St_GainDTh_HFL;

% map tunable kinSwCtrl params
tune_kinSw_alpha_start  = kinSw_alpha_start*180/pi;     % [deg]
tune_kinSw_alpha_tgt    = kinSw_alpha_tgt*180/pi;       % [deg]
tune_kinSw_len_tgt      = kinSw_len_tgt;                % [m]
tune_kinSw_len_min      = kinSw_lclr;                % [m]

% map tunable poser params
poser_RLegLen   = initial_r_leg_length;
poser_RLegAlp   = (initial_r_leg_angle -pi/2)*180/pi;
poser_LLegLen   = initial_l_leg_length;
poser_LLegAlp   = (initial_l_leg_angle -pi/2)*180/pi;

simout = sim(model);
