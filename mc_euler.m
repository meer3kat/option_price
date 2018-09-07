function [err,V] = mc_euler(sigma, r, s0, K, gamma, np, T, n, rsol)
% dt = time interval size
% T = final time 
% n = time of monte carlo simulation 
% default we set to run 10 times of MC 
% rsol = real analytical solution

S(1) = s0;
dt = T/np;

range = linspace(0,T,np);


    
    for j = 1:n
        S(j) = s0;
        


        for i = 2:length(range)


            S(j) = S(j) + r*S(j)*dt + sigma*(S(j)^gamma)*randn()*sqrt(dt);

            
        end
        
        V(j) = max(S(j)-K, 0);

    end

    EqV = mean(V);

    V0 = exp(-r*T) * EqV;

    
    err = abs(rsol - V0);
    V=V0;

end
