% Automotive 12V Battery Simulation
% Project 001

clc;
clear;
close all;

% Battery specifications
battery_voltage = 12.6;        % Volts
internal_resistance = 0.030;   % Ohms

% Starter motor electrical load 
current = 150;                 % Amps

% Calculate voltage drop
voltage_drop = current * internal_resistance;

% Calculate terminal voltage
terminal_voltage = battery_voltage - voltage_drop;

% Display results
fprintf('Battery voltage: %.2f V\n', battery_voltage);
fprintf('Voltage drop: %.2f V\n', voltage_drop)
fprintf('Terminal voltage: %.2f V\n', terminal_voltage)


% Simulate different electrical loads

current_range = 0:10:200;

% Calculate voltage at each current value 
voltage_range = battery_voltage - ...
    (current_range * internal_resistance)

% Plot the results
figure;

plot(current_range, voltage_range, 'b', 'LineWidth', 2);

title('Automotive Battery Voltage Under Load');
xlabel('Current (Amps)');
ylabel('Terminal Voltage (Volts)');


grid on;


% Compare different battery conditions 

current_range = 0:10:200;


R1 = 0.010;
R2 = 0.020;
R3 = 0.030;


V1 = battery_voltage - current_range * R1;
V2 = battery_voltage - current_range * R2;
V3 = battery_voltage - current_range * R3;


figure;

plot(current_range, V1, 'g', 'LineWidth', 2);
hold on;

plot(current_range, V2, 'b', 'LineWidth', 2);


plot(current_range, V3, 'r', 'LineWidth', 2);


title('Comparison of Battery Internal Resistance');
xlabel('Current (A)');
ylabel('Terminal Voltage (V)');

legend('Low Resistance', 'Medium Resistance', 'High Resistance');

grid on;
hold off;


% Engineering analysis at 150 Amps


test_current = 150;


% Calculate voltage drops
drop1 = test_current * R1;
drop2 = test_current * R2;
drop3 = test_current * R3;

% Calculate terminal voltages
terminal1 = battery_voltage - drop1;
terminal2 = battery_voltage - drop2;
terminal3 = battery_voltage - drop3;


% Display comparison
fprintf('\n--- Battery Comparison at 150 A ---\n');

fprintf('Low resistance:    %.2f V\n', terminal1);
fprintf('Medium resistance: %.2f V\n', terminal2);
fprintf('High resistance:   %.2f V\n', terminal3);


% Experiment 2: Comparing initial battery voltages

current_range = 0:10:200;


% Different initial battery voltages
V_high = 12.6;
V_medium = 12.2;
V_low = 11.8;

% Keep internal resistance constant
R = 0.015;


% Calculate terminal voltage
voltage_high = V_high - current_range * R;
voltage_medium = V_medium - current_range * R;
voltage_low = V_low - current_range * R;

% Plot comparison
figure;

plot(current_range, voltage_high, 'g', 'LineWidth', 2)
hold on;

plot(current_range, voltage_medium, 'b', 'LineWidth', 2);


plot(current_range, voltage_low, 'r', 'LineWidth', 2);


title('Effect of Initial Battery Voltage');
xlabel('Current (Amps)');
ylabel('Terminal Voltage (Volts)')

legend('12.6 V', '12.2 V', '11.8 V');

grid on;
hold off;


% Experiment 3: Comparing different battery conditions

current_range = 0:10:200;

% Battery specifications
battery_A_voltage = 12.6;
battery_A_resistance = 0.010;

battery_B_voltage = 12.2;
battery_B_resistance = 0.020;

battery_C_voltage = 11.8;
battery_C_resistance = 0.030;

% Calculate terminal voltages
battery_A = battery_A_voltage - current_range * battery_A_resistance;
battery_B = battery_B_voltage - current_range * battery_B_resistance;
battery_C = battery_C_voltage - current_range * battery_C_resistance;


% Plot results
figure;

plot(current_range, battery_A, 'g', 'LineWidth', 2);
hold on;
plot(current_range,battery_B, 'b', 'LineWidth', 2);
plot(current_range, battery_C, 'r', 'LineWidth', 2);


title('Comparison of Three Battery Conditions');
xlabel('Current (Amps)');
ylabel('Terminal Voltage (Volts)');


legend('Battery A', 'Battery B', 'Battery C');
grid on;
hold off;


% Compare terminal voltage at 150 Amps

test_current = 150;

terminal_A = battery_A_voltage - test_current * battery_A_resistance;
terminal_B = battery_B_voltage - test_current * battery_B_resistance;
terminal_C = battery_C_voltage - test_current * battery_C_resistance;

fprintf('\n--- Battery Comparison at 150 A ---\n');

fprintf('Battery A: %.2f V\n', terminal_A);
fprintf('Battery B: %.2f V\n', terminal_B);
fprintf('Battery C: %.2f V\n', terminal_C);