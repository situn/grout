clear all;
%=CONSTANTS=
pore = 0.4;
L = 1;
global gamma_w = 9.81;
global rho_caco3 = 2710;
global A = 0.037;
global B = 0.11374; % m / min
global C = 0.0054; % per min
global D = 0.01;
global E = 1440; % life span of bacteria = 1 days
%=PRESSURE BCs=
global p_in = 200; %kPa
global p_out = 100; %kPa
%=CONCENTRATION IC
global u_in = 1;
%=Spatial discritization
global N = 20; % points = N+1
global dx = L/N;
global dt = 0.01;
global w = 4*dx/dt;

%=INITIALLY=
UU = zeros(N+1,1); % initial condition
UU(1) = u_in; % BC
NN = repmat(pore, N+1,1);
KK = permeability(NN);
RR = reaction(UU,0);
PP = pressure(KK,NN,RR);
VV = velocity(KK,PP);
UC = zeros(N+1,1);

M = 120/dt;
for m = 1:M
	t = m*dt;
	[u,v,k,p,n,R] = fixedpoint(UU(:,end),RR(:,end),NN(:,end), VV(:,end),t);
  uc = caco3(n, NN(:,end), UC(:,end));
	UU = [UU u]; RR = [RR R]; 
  KK = [KK k]; PP = [PP p]; 
  NN = [NN n]; VV = [VV v];
  UC = [UC uc];
	t
end
%dlmwrite('uu.txt',UU);
%dlmwrite('kk.txt',KK);
%dlmwrite('uc.txt',UC);

