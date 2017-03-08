function [A,B,C,D] = myCraneODE(m,M,MR,r,g,Tx,Ty,Vm,Ts)
% Inputs:
% m = Pendulum mass (kg)
% M = Cart mass (kg)
% MR = Rail mass (kg)
% r = String length (m)
% g = gravitational acceleration (m*s^-2)
% Tx = Damping coefficient in X direction (N*s*m^-1)
% Ty = Damping coefficient in Y direction (N*s*m^-1)
% Vm = Input multiplier (scalar)
% Ts = Sample time of the discrete-time system (s)
% Outputs:
% A,B,C,D = State Space matrices of a discrete-time or continuous-time state space model

% The motors in use on the gantry crane are identical and therefore Vx=Vy=Vm.
Vx=Vm;
Vy=Vm;

% replace A,B,C,D with the correct values
sigma_1 = (1/r) - ((M + MR + m)/(m*r));
sigma_2 = (1/r) - ((M + m)/(m*r));

A=[ 0 1 zeros(1, 6); 
    0 (Tx)/(m*r*sigma_1) zeros(1, 2) -g/(r * sigma_1) zeros(1,3);
    zeros(1, 3) 1 zeros(1, 4);
    zeros(1, 3) Ty/(m*r*sigma_2) zeros(1, 2) -g/(r * sigma_2) 0;
    zeros(1, 5) 1 zeros(1, 2);
    0 -(Tx)/(m*(r^2)*sigma_1) zeros(1, 2) ((((g*m)/sigma_1)-g*m*r)/(m*r^2)) zeros(1, 3);
    zeros(1, 7) 1;
    zeros(1, 3) -Ty/(m*(r^2)*sigma_2) zeros(1, 2) -((g*m*r-((g*m)/sigma_2))/(m*r^2)) 0];
B= [ 0 -Vx/(m*r*sigma_1) zeros(1, 3) Vx/(m*(r^2)*sigma_1) zeros(1, 2);
    zeros(1, 3) -Vy/(m*r*sigma_2) zeros(1, 3) Vy/(m*(r^2)*sigma_2)]';
C=eye(size(A,1));
D=zeros(size(B,1),size(B,2));
sys = ss(A,B,C,D);
% if Ts>0 then sample the model with a zero-order hold (piecewise constant) input, otherwise return a continuous-time model 
if Ts>0
	sysd = c2d(sys, Ts);
    A = sysd.A;
    B = sysd.B;
    C = sysd.C;
    D = sysd.D;
end

end