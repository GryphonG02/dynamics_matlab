clear; clc; close all;

global m c theta v0

m = 150;          
c = 2.5;           
theta = 30;        
v0 = 50;          
theta_rad = deg2rad(theta);
v0x = v0 * cos(theta_rad);
v0y = v0 * sin(theta_rad);
x0 = [0; v0x; 0; v0y];
tspan = [0 5];

[t, X] = ode45(@dragequ, tspan, x0)

x_pos = X(:,1);
y_pos = X(:,3);

figure;
plot(x_pos, y_pos, 'b', 'LineWidth', 2);
xlabel('x position (m)');
ylabel('y position (m)');
title(sprintf('Projectile Motion (m=%.1f kg, c=%.1f kg/s, \\theta=%d^\\circ, v_0=%.1f m/s)', m, c, theta, v0));
grid on;
xlim([0 max(x_pos)*1.1]);
ylim([0 max(y_pos)*1.1]);

[maxHeight, idx] = max(y_pos);
text(x_pos(idx), maxHeight, sprintf('Peak: (%.1f, %.1f)', x_pos(idx), maxHeight), ...
    'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');

final_x = x_pos(end);
final_y = y_pos(end);
text(final_x, final_y, sprintf('t=5s: (%.1f, %.1f)', final_x, final_y), ...
    'VerticalAlignment', 'top', 'HorizontalAlignment', 'right');

% Task 3 DQ: the maximum height of the projectile is 
