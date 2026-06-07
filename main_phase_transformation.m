clc;
clear;
close all;

%% ===============================
% 1. PARAMETERS
%% ===============================
n = 2.5;              % Avrami exponent
k0 = 1e3;             % Pre-exponential factor
Q = 80000;            % Activation energy (J/mol)
R = 8.314;            % Gas constant

T = 800:50:1100;      % Temperature range (K)
t = linspace(0,100,200);  % Time array

%% ===============================
% 2. JMAK PHASE TRANSFORMATION
%% ===============================
figure;
hold on;

for i = 1:length(T)
    k = k0 * exp(-Q/(R*T(i)));   % temperature-dependent rate constant
    X = 1 - exp(-k * t.^n);      % JMAK equation

    plot(t, X, 'DisplayName', ['T = ' num2str(T(i)) 'K']);
end

xlabel('Time');
ylabel('Phase Fraction');
title('Phase Transformation Kinetics (JMAK)');
legend;
grid on

%% ===============================
% 2A. NUMERICAL ANALYSIS (JMAK)
%% ===============================

fprintf('\n--- Phase Transformation Values ---\n');

for i = 1:length(T)

    k = k0 * exp(-Q/(R*T(i)));
    X = 1 - exp(-k * t.^n);

    % t10, t50, t90
    t10 = t(find(X >= 0.1,1));
    t50 = t(find(X >= 0.5,1));
    t90 = t(find(X >= 0.9,1));

    % transformation rate
    dXdt = diff(X) ./ diff(t);
    max_rate = max(dXdt);

    % final phase fraction
    final_fraction = X(end);

    fprintf('T = %d K | t10 = %.2f | t50 = %.2f | t90 = %.2f | MaxRate = %.4f | Final = %.2f\n', ...
        T(i), t10, t50, t90, max_rate, final_fraction);
end

%% ===============================
% 3. TTT DIAGRAM (Approximate)
%% ===============================
t_start = zeros(size(T));
t_finish = zeros(size(T));

for i = 1:length(T)
    k = k0 * exp(-Q/(R*T(i)));

    % time for 1% and 99% transformation
    t_start(i) = ((-log(1-0.01))/k)^(1/n);
    t_finish(i) = ((-log(1-0.99))/k)^(1/n);
end

figure;
semilogx(t_start, T, 'b-o', 'LineWidth', 2);
hold on;
semilogx(t_finish, T, 'r-o', 'LineWidth', 2);

set(gca, 'YDir', 'reverse');
xlabel('Time (log scale)');
ylabel('Temperature (K)');
title('TTT Diagram (Approximate)');
legend('Start (1%)', 'Finish (99%)');
grid on

%% ===============================
% 4. 2D MICROSTRUCTURE SIMULATION
%% ===============================
N = 100;                         % grid size
micro_grid = zeros(N,N);               % 0 = austenite, 1 = transformed

% initial nuclei
num_nuclei = 10;
for k = 1:num_nuclei
    x = randi(N);
    y = randi(N);
    micro_grid(x,y) = 1;
end

figure;

steps = 50;
for step = 1:steps
    new_grid = micro_grid;

    for i = 2:N-1
        for j = 2:N-1

            if micro_grid(i,j) == 0
                neighbors = sum(sum(micro_grid(i-1:i+1, j-1:j+1)))- micro_grid(i, j);

                % growth probability
                prob = neighbors / 8;

                if rand < prob
                    new_grid(i,j) = 1;
                end
            end

        end
    end

    micro_grid = new_grid;

    imagesc(micro_grid);
    colormap(gray);
    title(['Microstructure Evolution - Step ' num2str(step)]);
    pause(0.1);
end

%% ===============================
% 4A. MICROSTRUCTURE FRACTION
%% ===============================

fraction_transformed = sum(micro_grid(:)) / numel(micro_grid);

fprintf('\n--- Microstructure Result ---\n');
fprintf('Transformed Phase Fraction = %.4f\n', fraction_transformed);

%% ===============================
% 5. COOLING CURVE
%% ===============================
t_cool = linspace(0,100,200);
T0 = 1200;
k_cool = 0.02;

T_cooling = T0 * exp(-k_cool * t_cool);

figure;
plot(t_cool, T_cooling, 'LineWidth', 2);
xlabel('Time');
ylabel('Temperature');
title('Cooling Curve');
grid on

%% ===============================
% 5A. COOLING RATE CALCULATION
%% ===============================

cooling_rate = abs(diff(T_cooling) ./ diff(t_cool));
avg_cooling_rate = mean(cooling_rate);
max_cooling_rate = max(cooling_rate);

fprintf('\n--- Cooling Rate ---\n');
fprintf('Average Cooling Rate = %.4f K/s\n', avg_cooling_rate);
fprintf('Maximum Cooling Rate = %.4f K/s\n', max_cooling_rate);
