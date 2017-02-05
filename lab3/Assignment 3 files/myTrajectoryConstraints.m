function [DD,EE,bb]=myTrajectoryConstraints(Dt,Et,bt,N)

% your code goes here
    I_N = eye(N);
    DD = kron(I_N, Dt);
    EE = kron(I_N, Et);
    bb = kron(ones(N, 1), bt);

end

