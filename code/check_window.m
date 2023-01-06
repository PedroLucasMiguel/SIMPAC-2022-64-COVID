function [ valid ] = check_window(img)
  
  % ---------------------
  % This function checks if a provided window is composed by, at leas
  % 98% of pixels that are not black (gray value 0).
  %
  % ---------------------

  h = size(img, 1); % Window height
  w = size(img, 2); % Window widht

  total = h * w; % Total os pixels
  
  black = 0; % Black pixels counter

  valid = true;

  for y = 1 : h
      for x = 1 : w
        if img(y, x) == 0
            black = black + 1;
        end
      end
  end

  if black >= total * 0.02 % Check if the image have at least 98% pixels that are not 0
      valid = false;
  end

end