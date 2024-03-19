function dydt = sliding_block(t,y,acc,ay1,ay2)
% Differential equation for the dynamic response of a rigid sliding block
% using a given acceleration time-history that needs to be passed as a
% function of time, as well as yield acceleration values ay1 and ay2.
% - dydt: 4-column array with derivatives:
%    1. Base acceleration
%    2. Block acceleration
%    3. Base velocity
%    4. Block velocity
% - y: 4-column array with variables:
%    1. Base velocity
%    2. Block velocity
%    3. Base displacement
%    4. Block displacement
% - t: time used for the analysis
% - acc: input excitation as a function of time (in g)
% - ay1, ay2: positive and negative yield accelerations

% Tolerance
tol = 1e-5;

% Define dydt (to provide dimensions)
dydt = zeros(4,1);

% Row 1.
% - dydt: base acceleration
% - y: base velocity
dydt(1) = 9.81*acc(t);
ay1 = 9.81*ay1;
ay2 = 9.81*ay2;

% Row 2.
% - dydt: block acceleration
% - y: block velocity
if dydt(1) > ay1 || dydt(1) < ay2 || abs(y(2)-y(1)) > tol
    if y(1) > y(2)
        % Slip (positive)
        dydt(2) = ay1;
    else
        % Slip (negative)
        dydt(2) = ay2;
    end
else
    % Stick
    dydt(2) = dydt(1);
end

% Row 3.
% - dydt: base velocity
% - y: base displacement
dydt(3) = y(1);

% Row 4.
% - dydt: block velocity
% - y: block displacement
dydt(4) = y(2);

end