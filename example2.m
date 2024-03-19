% New Analysis
clc;clear all;close all;

% Excitation Characteristics
[times,accels] = read_at2('lomaprieta.AT2');
acc = @(t) interp1( times, accels, t);

% Critical Acceleration
ay1 = 0.1;
ay2 = -0.25;

% Solve differential equation
dt_int = 0.001;
t_max = 10;
time_span = 0:dt_int:t_max;
options = odeset('RelTol',1e-5,'AbsTol',1e-5);
[t_out,Y_out] = ode23(@sliding_block, time_span, [0,0,0,0], options, acc,ay1,ay2);

% Calculate time-histories
acc_base = acc(t_out);
acc_block = ([diff(Y_out(:,2));0]/9.81/dt_int);
vel_base = Y_out(:,1);
vel_block = Y_out(:,2);
disp_base = Y_out(:,3);
disp_block = Y_out(:,4);

% Plots
plots