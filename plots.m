% Plots

figure(1);

ax1 = subplot(3,2,1);
plot(t_out,acc_base);
hold on;
plot(t_out,acc_block,"--");
hold off;
ylabel('Acceleration (m/s^2)')

ax3 = subplot(3,2,3);
plot(t_out,vel_base);
hold on;
plot(t_out,vel_block);
hold off;
ylabel('Velocity (m/s)')

ax5 = subplot(3,2,5);
plot(t_out,disp_base);
hold on;
plot(t_out,disp_block);
hold off;
ylabel('Displacement (m)')
xlabel('Time (sec)')
legend('Base','Block')


ax2 = subplot(3,2,2);
plot(t_out,acc_base-acc_block,"--");
ylabel('Relative Acc (m/s^2)')

ax4 = subplot(3,2,4);
plot(t_out,vel_base-vel_block);
ylabel('Relative Vel (m/s)')

ax6 = subplot(3,2,6);
plot(t_out,disp_base-disp_block)
ylabel('Relative Disp (m)')
xlabel('Time (sec)')

linkaxes([ax1,ax2])
linkaxes([ax3,ax4])
linkaxes([ax5,ax6])
