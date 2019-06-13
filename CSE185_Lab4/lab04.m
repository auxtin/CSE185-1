%% Task 1
img = im2double(imread('images/cameraman.jpg'));
ratio1 = 0.1;
ratio2 = 0.2;

[low_pass_img1, high_pass_img1] = separate_frequency(img, ratio1);
[low_pass_img2, high_pass_img2] = separate_frequency(img, ratio2);

subplot(2,2,1), imshow(low_pass_img1)
subplot(2,2,2), imshow(high_pass_img1 + 0.5)
subplot(2,2,3), imshow(low_pass_img2)
subplot(2,2,4), imshow(high_pass_img2 + 0.5)

imwrite(low_pass_img1, 'cameraman_low_0.1.jpg'); 
imwrite(high_pass_img1 + 0.5, 'cameraman_high_0.1.jpg');

imwrite(low_pass_img2, 'cameraman_low_0.2.jpg'); 
imwrite(high_pass_img2 + 0.5, 'cameraman_high_0.2.jpg');

%% Task 2: Hybrid Image name1 = 'images/cat.jpg';   name2 = 'images/dog.jpg';
img1 = im2double(imread('images/cat.jpg')); 
img2 = im2double(imread('images/dog.jpg'));

ratio = 0.09; 
catoggo = hybrid_image(img1, img2, ratio);
dogatto = hybrid_image(img2, img1, ratio);

subplot(1,2,1), imshow(catoggo);
subplot(1,2,2), imshow(dogatto);

imwrite(catoggo, 'hybrid_1.jpg');
imwrite(dogatto, 'hybrid_2.jpg');