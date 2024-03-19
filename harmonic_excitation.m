function [acc] = harmonic_excitation(amax,T,N1,N2,N3,t)
% Returns a sinusoidal motion, with amplitude amax and period T.
% - amax: acceleration amplitude
% - T: period of excitation
% - N1: number of cycles during ramp-up phase
% - N2: number of cycles during main part of excitation
% - N3: number of cycles during ramp-down phase
% - t: input time
% - acc: output excitation

% Time limits (at the end of each phase)
t1=N1*T;
t2=t1+N2*T;
t3=t2+N3*T;

% Time segments (during each phase and after the end of excitation)
tA=t<t1;
tB=(t>=t1&t<t2);
tC=(t>=t2&t<t3);
tD=(t>=t3);

% Coefficient (for ramp-up and ramp-down)
coeff=NaN(size(t));
coeff(tA)=t(tA)/t1;
coeff(tB)=1;
coeff(tC)=(t3-t(tC))/(t3-t2);
coeff(tD)=0;

% Acceleration (final result)
acc=coeff.*amax.*sin(2*pi*t/T);

end