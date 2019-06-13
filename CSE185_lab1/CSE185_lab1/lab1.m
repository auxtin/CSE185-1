image1 = imread('01.jpg');
image2 = imread('02.jpg');
image3 = imread('03.jpg');
image4 = imread('04.jpg');
flip4 = imread('flip.jpg');

%% Set red channel of image 1 to 0
% image1(:, :, 1) = 0;
% imshow(image1)
% imwrite(image1, 'red.jpg')

%% Convert 02.jpg from RGB to gray scale
% Formula: ? = 0.299 × ? + 0.587 × ? + 0.114 × B

% gray = 0.299*image2(:, :, 1) + 0.587*image2(:, :, 2) + 0.114*image2(:, :, 3); 
% imshow(gray)
% imwrite(gray, 'gray.jpg')

%% Rotate 03.jpg by 90 degree
% rotate = imrotate(image3, 90);
% imshow(rotate)
% imwrite(rotate, 'rotate.jpg')

%% Crop 04.jpg by 30 pixels from all sides
% crop = image4(30:269, 30:369, :);
% subplot(1,2,1);
% imshow(crop);
% size(crop)
% subplot(1,2,2);
% imshow(image4);
% size(image4)
% 
% imwrite(crop, 'crop.jpg')


%% Vertically flip 04.jpg
% flipped = flip(image4);
% imshow(flipped)
% imwrite(flipped, 'flip.jpg')

%% Combine 01-04.jpg in one image with 15 pixel separation
% canvas = zeros(300 * 2 + 15, 400 * 2 + 15, 3, 'uint8'); 
% canvas(1:300, 1:400, :) = image1;
% canvas(316:615, 1:400, :) = image2;
% canvas(1:300, 416:815, :) = image3;
% canvas(316:615, 416:815, :) = image4;
% 
% imshow(canvas)
% imwrite(canvas, 'combine.jpg')

%% Convert 04.jpg and flip.jpg to vectors, average them, convert vector back to image
% vector1 = image4(:);
% vector2 = flip4(:);
% 
% average = (vector1 + vector2) * 0.5;
% 
% I = reshape(average, 300, 400, 3);
% imshow(I)
% 
% imwrite(I, 'average.jpg')