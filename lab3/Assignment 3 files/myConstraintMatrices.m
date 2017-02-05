function [F,J,L]=myConstraintMatrices(DD,EE,Gamma,Phi,N)

% your code goes here
    n = size(Phi, 2);
    mn = size(Gamma, 2);
    In = eye(n);
    IO = [ eye(n*(N-1)) zeros(n*(N-1), n) ];
    
    Phit = [ In; IO * Phi ];
    Gammat = [ zeros(n, mn); IO * Gamma];
    
    F = DD * Gammat + EE;
    J = -DD * Phit;
    L = -J-DD*(kron(ones(N, 1), In));
    
end

