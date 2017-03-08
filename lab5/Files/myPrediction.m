function [Gamma,Phi] = myPrediction(A,B,N)
% MYPREDICTION  [Gamma,Phi] = myPrediction(A,B,N). 
% A and B are discrete-time state space matrices for x[k+1]=Ax[k]+Bu[k]
% N is the horizon length. 
% Your code is suppose to work for any linear system, not just the gantry crane. 

% your code here:
n = size(A, 1); 
Nn = N * n;

I_n = eye( n );
I_N_1 = eye( (N-1) );
I_N = eye(N);
I_Nn = kron( I_N, I_n );

I_kron_A = kron(I_N_1, A); 

O = zeros(n, Nn);
OT = zeros( (N-1) * n, n );

A_bar = I_Nn - [ O; I_kron_A OT ];
E = [ A; zeros((N-1)*n,n) ];

B_bar = kron( I_N, B );

Gamma = A_bar \ B_bar;
Phi =  A_bar \ E;

end

