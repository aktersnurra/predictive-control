function [F,J,L]=myConstraintMatrices(DD,EE,Gamma,Phi,N)

% your code goes here
    n = size(Phi, 2);
    mn = size(Gamma, 2);
    In = eye(n);
    
    Phit = [ In; Phi(1:n*(N-1),:) ];
    Gammat = [ zeros(n, mn); Gamma(1:n*(N-1),:)];
    
    F = DD * Gammat + EE;
    J = -DD * Phit;
    L = -J-DD*(kron(ones(N, 1), In));
    
end

