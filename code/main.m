% ---------------------
% This script calculates the SampEn signatures and metrics for a given image
%
% [1] Rozendo, G. B., Nascimento, M. Z., Roberto G. F., Faria, P. R., Silva, A. B., Tosta, T. A. A., Neves, L. A. (2022). Classification of Non-Hodgkin Lymphomas Based on Sample Entropy Signatures. Expert Systems with Applications.
% ---------------------

dataset_path = '../DataSet/';
dataset_dir = dir('../DataSet/');

for class_index = 1 : length(dataset_dir)
    % Filtering the '.' directories
    if not(endsWith(dataset_dir(class_index).name, '.'))
        class_name = dataset_dir(class_index).name; % Class under interaction
        class_path = strcat(dataset_path, class_name);
        class_dir = dir(class_path);
        
        for image_index = 1 : length(class_dir)
            if endsWith(class_dir(image_index).name, ".png")
                image_path = strcat(class_path, '/', class_dir(image_index).name);
                fprintf("Doing for: %s\n", image_path);
                % Starting the original algorithm :^)
                % Input image
                img = imread(image_path);
                
                % SampEn signatures (Section 3.2.1 in [1])
                sig = signatures(img);
                aux = zeros(4, 18);
                
                aux(1, :) = sig(1, 1:18); % signature for m = 1 
                aux(2, :) = sig(1, 19:36); % signature for m = 2
                aux(3, :) = sig(1, 37:54); % signature for m = 3
                aux(4, :) = sig(1, 55:72); % signature for m = 4
                
                disp(aux(1, :));

                % SampEn metrics (Section 3.2.2 in [1])
                met = zeros(4, 4);
                
                met(1, :) = metrics(aux(1, :)); % metrics for m = 1
                met(2, :) = metrics(aux(2, :)); % metrics for m = 2
                met(3, :) = metrics(aux(3, :)); % metrics for m = 3
                met(4, :) = metrics(aux(4, :)); % metrics for m = 4
                
                
                % Saving the results ----------------
                
                % Plot signatures
                % For m = 1
                plot(0.06:0.02:0.4, aux(1, :), 'b-s')
                xlabel('r', 'FontSize', 12, 'FontWeight','bold')
                ylabel('SampEn', 'FontSize', 12, 'FontWeight','bold')
                
                saveas(gcf, strcat('../results/', 'm1_', class_dir(image_index).name));

                % For m = 2
                plot(0.06:0.02:0.4, aux(2, :), 'b-s')
                xlabel('r', 'FontSize', 12, 'FontWeight','bold')
                ylabel('SampEn', 'FontSize', 12, 'FontWeight','bold')
                
                saveas(gcf, strcat('../results/', 'm2_', class_dir(image_index).name));
                
                % For m = 3
                plot(0.06:0.02:0.4, aux(3, :), 'b-s')
                xlabel('r', 'FontSize', 12, 'FontWeight','bold')
                ylabel('SampEn', 'FontSize', 12, 'FontWeight','bold')
                
                saveas(gcf, strcat('../results/', 'm3_', class_dir(image_index).name));
                
                % For m = 4
                plot(0.06:0.02:0.4, aux(4, :), 'b-s')
                xlabel('r', 'FontSize', 12, 'FontWeight','bold')
                ylabel('SampEn', 'FontSize', 12, 'FontWeight','bold')
                
                saveas(gcf, strcat('../results/', 'm4_', class_dir(image_index).name));
                  
                % Print metrics
                fprintf("\nSampEn signatures metrics:\n");
                display(met)

            end
        end

    end
end

