
img1 = im2double(imread('lena_noisy.jpg'));
img2 = im2double(imread('lena.jpg'));
% 
% 
%% Median filter
patch_size3 = [3, 3];
patch_size = [5, 5];

img_median= median_filter(img1, patch_size);
img_median3= median_filter(img1, patch_size3);


subplot(1,3,1);
imshow(img1);
subplot(1,3,2);
imshow(img_median);
subplot(1,3,3);
imshow(img_median3);

imwrite(img_median3, 'median_3.jpg');
imwrite(img_median, 'median_5.jpg');

%% Sobel filter
H = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge
V = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge

img_sobelH = sobel_filter(img2, H);
img_sobelV = sobel_filter(img2, V);

subplot(1,3,1);
imshow(img2);
subplot(1,3,2);
imshow(img_sobelH);
subplot(1,3,3);
imshow(img_sobelV);

imwrite(img_sobelH, 'sobel_h.jpg');
imwrite(img_sobelV, 'sobel_v.jpg');

%% Gaussian filter
hsize = 5; sigma = 2;
hsize2 = 9; sigma2 = 4;

gaussian5 = gaussian_filter(img2, hsize, sigma);
gaussian9 = gaussian_filter(img2, hsize2, sigma2);

subplot(1,3,1);
imshow(img2);
subplot(1,3,2);
imshow(gaussian5);
subplot(1,3,3);
imshow(gaussian9);

imwrite(gaussian5, 'gaussian_5.jpg');
imwrite(gaussian9, 'gaussian_9.jpg');