function parallel_execution_singleclass(m)
    
    class_path = "../DataSet/Covid19/";
    class_dir = dir(class_path);
           
    for image_index = 1 : length(class_dir)
        if endsWith(class_dir(image_index).name, ".png")
           image_path = strcat(class_path, class_dir(image_index).name);
           fprintf("Doing for: %s\n",  class_dir(image_index).name);
           % Starting the original algorithm :^)
           % Input image
           img = imread(image_path);
     
           % SampEn signatures (Section 3.2.1 in [1])
           sig = signatures(img, m, class_dir(image_index).name);
           disp(sig);
           aux = zeros(1, 18);
                    
           aux(1, :) = sig(1, 1:18); % signature for m
    
           % SampEn metrics (Section 3.2.2 in [1])
           met = zeros(1, 4);
                    
           met(1, :) = metrics(aux(1, :)); % metrics for m
                    
           % Saving the results ----------------
                    
           % Plot signatures
           % For m = 1
           plot(0.06:0.02:0.4, aux(1, :), 'b-s')
           xlabel('r', 'FontSize', 12, 'FontWeight','bold')
           ylabel('SampEn', 'FontSize', 12, 'FontWeight','bold')
           
           folder_name = strcat(replace(class_dir(image_index).name, ".png", ""));
           folder_name = replace(folder_name, "(", "_");
           folder_name = replace(folder_name, ")", "");
           save_path = strcat('../results/Covid19/', folder_name);

           if ~exist(save_path, 'dir')
            mkdir(save_path);
           end

           saveas(gcf, strcat(save_path, strcat('/m', string(m), ".png")));
                    
           %fprintf("\nSampEn signatures metrics:\n");

           %display(met);
           
           jsonFieldName = replace(class_dir(image_index).name, ").png", "");
           jsonFieldName = replace(jsonFieldName, " (", "");

           toJson = struct(jsonFieldName, struct("m", m, "AUC", met(1, 1), "AreaRatio", met(1, 2), "Skewness", met(1, 3), "Pmax", met(1,4)));
           json = jsonencode(toJson);
           f = fopen(strcat(save_path, strcat("/metrics_", "m", string(m), ".json")), "wt");
           fprintf(f, json);
           fclose(f);
        end
    end    

