clear;
format long;
close all;

t_start = 0; % seconds
t_end = 30; % seconds
% Number of points in the simulation.
h = 0.001; % step
t_sim = 0:h:30;


% 1 periptosi
Fz= 9.81+ (4562/1000);
Tz= 0;
% 2 periptosi
Fz2= 9.81;
Tz2= -(4562/10000);

% Constants AM: 4562
z0= 4.562;
y0=0;
zz0=0;
yy0=0;
Cz= 2.0876;
Cy= 3.9124;
M= 1; %kg
Iz= 0.08; %kg m^2
g=9.81; % m/s^2
index = 0;
n=0;

% 1st DE 
f=@(t,a,b) (b);
g=@(t,a,b) (((Fz/M)-((g*M)/M)-((Cz*abs(b)*b)/M)));

% 2nd DE 
q=@(t,c,d) (d);
p=@(t,c,d) ((Tz/Iz)-((Cy*abs(d)*d)/Iz));

a(1)=4.562;
b(1)=0;
c(1)=0;
d(1)=0;

amod(1)=4.562;
bmod(1)=0;
cmod(1)=0;
dmod(1)=0;

for t= t_sim
  
  index = index + 1;
  n=n+1;
  
  % Euler Method
  a(n+1)= a(n)+h*f(t,a(n),b(n));
  b(n+1)= b(n)+h*g(t,a(n),b(n));
  c(n+1)= c(n)+h*q(t,c(n),d(n));
  d(n+1)= d(n)+h*p(t,c(n),d(n));
  
  % Stores values for output.
  b_out(index) = b(n+1);
  d_out(index) = d(n+1);
 
end  
result = struct('b', b_out, 'd', d_out, 't', t_sim);

n=0;
index=0;

for t= t_sim
  
  index = index + 1;
  n=n+1;
  
  % Modified Euler Method
  amod(n+1)= amod(n)+h*f(t+(h/2), amod(n)+(h/2)*f(t,amod(n),bmod(n)), bmod(n)+(h/2)*f(t,amod(n),bmod(n)));  
  bmod(n+1)= bmod(n)+h*g(t+(h/2), amod(n)+(h/2)*g(t,amod(n),bmod(n)), bmod(n)+(h/2)*g(t,amod(n),bmod(n)));
  cmod(n+1)= cmod(n)+h*q(t+(h/2), cmod(n)+(h/2)*q(t,cmod(n),dmod(n)), dmod(n)+(h/2)*q(t,cmod(n),dmod(n)));
  dmod(n+1)= dmod(n)+h*p(t+(h/2), cmod(n)+(h/2)*p(t,cmod(n),dmod(n)), dmod(n)+(h/2)*p(t,cmod(n),dmod(n)));
  
  % Stores values for output.
  bmod_out(index) = bmod(n+1);
  dmod_out(index) = dmod(n+1);
  
end  
result2 = struct('bmod', bmod_out, 'dmod', dmod_out, 't', t_sim);

% GIA TIS GRAFIKES TIS DEFTERIS PERIPTOSIS ALLAZO STIS DIAFORIKES PARAPANO TA Fz KAI Tz SE Fz2 KAI Tz2 

% EULER GRAPH Z
figure;
plot(result.t, result.b, "linewidth",2);
xlabel('Time (s)');ylabel('z');grid;
title('EULER GRAPH Z');

% EULER GRAPH Y
figure;
plot(result.t, result.d, "linewidth",2);
xlabel('Time (s)');ylabel('y');grid;
title('EULER GRAPH Y');

% MODIFIED EULER GRAPH Z
figure;
plot(result2.t, result2.bmod, "linewidth",2);
xlabel('Time (s)');ylabel('z');grid;
title('MODIFIED EULER GRAPH Z');

% MODIFIED EULER GRAPH Y
figure;
plot(result2.t, result2.dmod, "linewidth",2);
xlabel('Time (s)');ylabel('y');grid;
title('MODIFIED EULER GRAPH Y');