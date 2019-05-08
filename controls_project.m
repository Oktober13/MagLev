function controls_project()
m = 0.1; % kg. Estimation of mass of electromagnet
l = 1; % m. Estimation of length of coil in electromagnet
R = 0.0254; % m. radius of magnet
A = pi * (R^2); % m. area of magnet
mu = 4 * pi * (10^-7); % T. magnetic permeability constant.
C = (A * (l+(R^2)) * l) / (pi * (mu^2));

Yo = 0.05; % m. 5 cm
Io = 1; % A?'
Kp = 100;
Ki = 100;
Kd = 100;

sys_num = [10*C*Io*Yo];
sys_denom = [(Yo^3)*m 0 -2*C*(Io^2) 0];
sys = tf(sys_num,sys_denom)
figure;
pzmap(sys);

pi_ol_num = [10*C*Io*Yo*Kp 10*C*Io*Yo*Ki];
pi_ol_denom = [(Yo^3)*m 0 -2*C*(Io^2) 0 0];
pi_ol = tf(pi_ol_num, pi_ol_denom)
figure;
rlocus(pi_ol);

pd_ol_num = [10*C*Io*Yo*Kd 10*C*Io*Yo*Kp];
pd_ol_denom = [(Yo^3)*m 0 -2*C*(Io^2) 0];
pd_ol = tf(pd_ol_num, pd_ol_denom)
figure;
rlocus(pd_ol);

pid_ol_num = [10*C*Io*Yo*Kd 10*C*Io*Yo*Kp 10*C*Io*Yo*Ki];
pid_ol_denom = [(Yo^3)*m 0 -2*C*(Io^2) 0 0];
pid_ol = tf(pid_ol_num, pid_ol_denom)
figure;
rlocus(pid_ol);

% % % figure;
% % % pzmap(sys);
% % % figure;
% % % pzmap(PI);
% % % figure;
% % % pzmap(PD);
% % figure;
% % pzmap(PID);
end