function [magnitude, orientation] = sobel_feature(img)

    Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge
    Hx = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge
    
    %% Sobel filtering
  
    sobelH = imfilter(img,Hy);
    sobelV = imfilter(img,Hx);
    
    %% compute gradient magnitude and orientation
    magnitude = sqrt((sobelH.^2)+(sobelV.^2)); % change img to your gradient magnitude
    orientation = atan2(sobelH,sobelV); % change img to your gradient orientation
end

