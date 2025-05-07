clc;
clear;
epsilon_0 = 8.854e-12;
charge_density = 2e-6;
point_location = [0 0 1];
electric_field = zeros(1,3);
num_rho_steps = 100;
num_phi_steps = 100;
phi_min = 0;
phi_max = 2*pi;
rho_min = 0;
rho_max = 1;
delta_rho = (rho_max - rho_min) / num_rho_steps;
delta_phi = (phi_max - phi_min) / num_phi_steps;

for phi_idx = 1:num_phi_steps
    for rho_idx = 1:num_rho_steps
        rho_val = rho_min + 0.5 * delta_rho + (rho_idx - 1) * delta_rho;
        phi_val = phi_min + 0.5 * delta_phi + (phi_idx - 1) * delta_phi;
        distance_vector = point_location - [rho_val * cos(phi_val), rho_val * sin(phi_val), 0];
        distance_magnitude = norm(distance_vector);
        
        if distance_magnitude > 0
            area_element = rho_val * delta_rho * delta_phi;
            charge_element = charge_density * area_element;
            electric_field = electric_field + (charge_element / (4 * pi * epsilon_0 * distance_magnitude^3)) * distance_vector;
        end
    end
end

disp('Electric Field:');
disp(electric_field);
