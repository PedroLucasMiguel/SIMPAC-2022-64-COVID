function parallel_execution(m)

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
                    sig = signatures(img, m);
                    aux = zeros(1, 18);
                    
                    aux(1, :) = sig(1, 1:18); % signature for m 
                    
                    disp(aux(1, :));
    
                    % SampEn metrics (Section 3.2.2 in [1])
                    met = zeros(1, 4);
                    
                    met(1, :) = metrics(aux(1, :)); % metrics for m
                    
                    % Saving the results ----------------
                    
                    % Plot signatures
                    % For m = 1
                    plot(0.06:0.02:0.4, aux(1, :), 'b-s')
                    xlabel('r', 'FontSize', 12, 'FontWeight','bold')
                    ylabel('SampEn', 'FontSize', 12, 'FontWeight','bold')
                    
                    saveas(gcf, strcat('../results/', strcat('m', string(m), '_'), class_dir(image_index).name));
                    
                    fprintf("\nSampEn signatures metrics:\n");
                    display(met)
                end
            end
    
        end
    end
