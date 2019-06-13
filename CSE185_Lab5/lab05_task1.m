
img = im2double(imread('cameraman.jpg'));

sigma = 2.0;
hsize = 7;
scale = 5;


%% Gaussian Pyramid
I = img;

gauss = fspecial('gaussian', hsize, sigma);
for s = 1:scale
    
    % Gaussian filtering

     filter = imfilter(I, gauss);
     
     
    % Save or show image
    imwrite(I, sprintf('Gaussian_scale%d.jpg', s));

    % Down-sampling
     I = imresize(filter,1/2);
        
     imshow(img)
    
    
end


%% Laplacian Pyramid
I = img;
for s = 1:scale
    
    % Gaussian filtering
    filter = imfilter(I, gauss);

    % Laplacian filtering
    newImg = I - filter;
    
    % Save or show image
    imwrite(newImg + 0.5, sprintf('Laplacian_scale%d.jpg', s)); % change I to the output of Laplacian filter
    
    % Down-sampling
    I = imresize(filter,1/2);
                
   
     
end
