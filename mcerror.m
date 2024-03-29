
close all
clear all;

nrange = [10,100,1000,10000];
ii = 0;
sigma = 0.25;
r = 0.1;
s0 = 14;
K = 15;
gamma = 1;
dt = 0.001;
T = 0.5;
rsol = bsexact(sigma,r,K,T,s0);

for nn = nrange
    ii = ii+1
    nn
    [err_s(ii),V(ii)] = mc_euler(sigma, r, s0, K, gamma, 1000, T, nn, rsol);
end

figure(1);
loglog(nrange,err_s) %plot

dtrange = [10,100,1000,5000];
ii = 0;
for nn = dtrange
    ii = ii+1
    nn
    [err_d(ii),V(ii)] = mc_euler(sigma, r, s0, K, gamma, nn, T, 100000, rsol);
end
figure(2);
plot(dtrange,err_d)

    