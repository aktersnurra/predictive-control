function [Hs,gs,Fs,bs,Js,Ls] = mySoftPadding(H,F,bb,J,L,S,rho,m)
% S = weight for quadratic cost of constraint violations
% rho = scalar weight for 1-norm of constraint violations
% m = number of inputs

% your code here
    n = size(J,2);
    Nm = size(H,1);
    c = size(S,1);
    N = Nm / m;
    Ic = eye(c);
    IN = eye(N);
    
    
    a = 2 * kron(IN, S);
    Hs = [H zeros(Nm,size(a,2));
          zeros(size(a,1), size(H,2)) a];
   
   It = [ -Ic;
          -Ic;
          zeros(m, size(Ic,2));
          zeros(m, size(Ic,2))];
   
   Ibar = kron(IN, It);
   
   Nc = N*c;
   INc = eye(Nc);
   
   gs = rho * ones(Nc, 1);
   
   Fs = [F Ibar;
         zeros(size(INc,1),size(F,2)) -INc];
     
   bs = [bb; zeros(Nc, size(bb,2))];
   
   Js = [J; zeros(Nc, n)];
   
   Ls = [L; zeros(Nc, n)];
  
end

