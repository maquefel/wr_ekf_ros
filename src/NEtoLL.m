function out = GKtoWGS84(x,y)
% y = 7415231.893;
% x = 6178580.784;
%% Taken from GOST

beta = x/6367558.4968;
B0 = beta+sin(2*beta)*(0.00252588685-0.00001491860*sin(beta)*sin(beta)+0.00000011904*(sin(beta))^4);
n = floor(y/1000000);
z0 = (y-(10*n+5)*10^5)/(6378245*cos(B0));
dB = -z0*z0*sin(2*B0)*(0.251684631-0.003369263*sin(B0)*sin(B0)+0.000011276*(sin(B0))^4-...
    z0*z0*(0.10500614-0.04559916*sin(B0)*sin(B0)+0.00228901*(sin(B0))^4-...
    0.00002987*(sin(B0))^6-z0*z0*(0.042858-0.025318*(sin(B0))^2+0.014346*(sin(B0))^4-...
    0.001264*(sin(B0))^6-z0*z0*(0.01672-0.00630*(sin(B0))^2+0.01188*(sin(B0))^4-...
    0.00328*(sin(B0))^6))));
l = z0*(1-0.0033467108*(sin(B0))^2-0.0000056002*(sin(B0))^4-0.0000000187*(sin(B0))^6-...
    z0*z0*(0.16778975+0.16273586*(sin(B0))^2-0.00052490*(sin(B0))^4-0.00000846*(sin(B0))^6-...
    z0*z0*(0.0420025+0.1487407*(sin(B0))^2+0.0059420*(sin(B0))^4-0.0000150*(sin(B0))^6-...
    z0*z0*(0.01225+0.09477*(sin(B0))^2+0.03282*(sin(B0))^4-0.00034*(sin(B0))^6-...
    z0*z0*(0.0038+0.0524*(sin(B0))^2+0.0482*(sin(B0))^4+0.0032*(sin(B0))^6)))));

B = B0 + dB;
L = 6*(n-0.5)/57.29577951+l;

B = B*180/pi;
L = L*180/pi;
out = [B,L];
end