function [H,G] = myCostMatrices(Gamma,Phi,Q,R,P,N)
%% cost function matrices
% Gamma and Phi are the prediction matrices
% Q is the stage cost weight on the states, i.e. x'Qx
% R is the stage cost weight on the inputs, i.e. u'Ru
% P is the terminal weight on the final state

% your code here
GammaT = Gamma';

n = size(Q, 1);
I_N = eye( N );
I_N_1 = eye( (N-1) );

I_N_1_kron_Q = kron(I_N_1, Q);
O_1 = zeros((N-1)*n, n);
O_2 = O_1';

Q_bar = [I_N_1_kron_Q O_1; O_2 P];

R_bar = kron(I_N, R);

H= 2 * ( R_bar + GammaT * Q_bar * Gamma );
G= 2 * ( GammaT * Q_bar * Phi);
end