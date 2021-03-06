syms phi_r_e theta_p_e phi_r_i theta_p_i
R_p_e = [cos(theta_p_e), 0, sin(theta_p_e); ...
         0, 1, 0; ...
         -sin(theta_p_e), 0, cos(theta_p_e)];
R_p_i = [cos(theta_p_i), 0, sin(theta_p_i); ...
         0, 1, 0; ...
         -sin(theta_p_i), 0, cos(theta_p_i)];
R_r_e = [1, 0, 0; ...
         0, cos(phi_r_e), -sin(phi_r_e); ...
         0, sin(phi_r_e), cos(phi_r_e)];
R_r_i = [1, 0, 0; ...
         0, cos(phi_r_i), -sin(phi_r_i); ...
         0, sin(phi_r_i), cos(phi_r_i)]; 
     
% Extrinsic rotation (R_roll*R_pitch)
R_extrinsic = R_r_e * R_p_e;

% Intrinsic rotation (R_pitch*R_roll)
R_intrinsic = R_p_i * R_r_i;
 
solve(R_extrinsic == R_intrinsic, phi_r_i, theta_p_i)

% function R_yp = R_pitch(theta) % map from pitched to yawed
%   R_yp = [cos(theta), 0, sin(theta); ...
%           0, 1, 0; ...
%           -sin(theta), 0, cos(theta)];
% end
% function dR_yp = dR_pitch(theta,dtheta)
%   dR_yp = dtheta*[-sin(theta), 0, cos(theta); ...
%                   0, 0, 0; ... 
%                   -cos(theta), 0, -sin(theta)];
% end
% function ddR_yp = ddR_pitch(theta,dtheta,ddtheta)
%   ddR_yp = ddtheta*[-sin(theta), 0, cos(theta); ...
%                     0, 0, 0; ... 
%                     -cos(theta), 0, -sin(theta)] ...
%            + dtheta^2*[-cos(theta), 0, -sin(theta); ...
%                      0, 0, 0; ...
%                      sin(theta), 0, -cos(theta)];
% end
% function R_pr = R_roll(phi) % map from rolled to pitched
%   R_pr = [1, 0, 0; ...
%           0, cos(phi), -sin(phi); ...
%           0, sin(phi), cos(phi)]; 
% end
% function dR_pr = dR_roll(phi,dphi)
%   dR_pr = dphi*[0, 0, 0; ...
%                 0, -sin(phi), -cos(phi); ...
%                 0, cos(phi), -sin(phi)];
% end
% function ddR_pr = ddR_roll(phi, dphi, ddphi)
%   ddR_pr = ddphi*[0, 0, 0; ...
%                   0, -sin(phi), -cos(phi); ...
%                   0, cos(phi), -sin(phi)] ...
%            + dphi^2*[0, 0, 0; ...
%                    0, -cos(phi), sin(phi);...
%                    0, -sin(phi), -cos(phi)];
% end

