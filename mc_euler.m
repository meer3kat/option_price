
function [err,V] = mc_euler(sigma, r, s0, K, gamma, dt, T, n, rsol)
% dt = time interval size
% T = final time 
% n = time of monte carlo simulation 
% default we set to run 10 times of MC 
% rsol = real analytical solution

S(1) = s0;

range = 0:dt:T;

for aa = 1:10 %not necessary
    
    for j = 1:n
        S(j) = s0;
        


        for i = 2:length(range)


            S(j) = S(j) + r*S(j)*dt + sigma*(S(j)^gamma)*randn()*sqrt(dt);

            
        end
        
        V(j) = max(S(j)-K, 0);

    end

    EqV = mean(V);

    V0(aa) = exp(-r*T) * EqV;

    
    err_d(aa) = abs(rsol - V0(aa));
end
err = mean(err_d);
V = mean(V0);
end
