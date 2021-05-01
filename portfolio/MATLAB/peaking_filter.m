function [b,a] = peaking_filter(fc,GdB,fs)
%PEAKING_FILTER computes the filter coeficients for a digital peaking filter.
%   Computation based on Wickert's notes
wh = 2*pi/fs;Q = fc/((fc/sqrt(2)) - sqrt(2)*fc);
mu = 10^(GdB/20);wch = wh * fc;kq = 4/(1+mu)*tan(wch/2*Q);
b = ((1 + mu*kq)/(1 + kq))*[1, -2*cos(wch)/(1+kq*mu), (1 - kq*mu)/(1 + kq*mu)]
a = [1, -2*cos(wch)/(1 + kq) (1 - kq)/(1 + kq)]
end

