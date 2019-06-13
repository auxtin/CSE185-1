image = uint8(imread('01.jpg'));

%%  Shift 01.jpg by 25 pixels in the positive vertical direction
I2 = zeros(300, 400, 3, 'uint8');

I2(25:300, 1:400, :)= image(25:300, 1:400, :);

subplot(1,2,1);
imshow(I2);
subplot(1,2,2);
imshow(image);
imwrite(I2, 'translate.jpg')

%%  Rotate 01.jpg by 60 degree using forward warping
I3 = zeros(300, 400, 3, 'uint8');

theta = 60;
x0 = 400/2;
y0 = 300/2;
for y1 = 1 : 300 
    for x1 = 1 : 400
        x2 = round(cosd(theta)*(x1-x0) + sind(theta)*(y1 - y0) + x0);
        y2 = round(-sind(theta)*(x1-x0) + cosd(theta)*(y1-y0) + y0);
        
        if(x2 >= 1 && x2 <= 400 && y2 >= 1 && y2 <= 300)
            I3(y2,x2, :) = image(y1,x1, :);
        end
    end
end

subplot(1,2,1);
imshow(I3);
subplot(1,2,2);
imshow(image);
imwrite(I3, 'rotateF.jpg')

%% Rotate 01.jpg by 60 degree using backward warping
I4 = zeros(300, 400, 3, 'uint8');

theta = 60;
x0 = 400/2;
y0 = 300/2;
for y1 = 1 : 300 
    for x1 = 1 : 400
        x2 = round(cosd(theta)*(x1-x0) - sind(theta)*(y1 - y0) + x0);
        y2 = round(sind(theta)*(x1-x0) + cosd(theta)*(y1-y0) + y0);
        
        if(x2 >= 1 && x2 <= 400 && y2 >= 1 && y2 <= 300)
            I4(y1,x1, :) = image(y2,x2, :);
        end
    end
end

subplot(1,2,1);
imshow(I4);
subplot(1,2,2);
imshow(image);
imwrite(I4, 'rotateB.jpg')
%% Vertical flip 01.jpg

flipped = image([end:-1:1],:,:);
imshow(flipped)

imwrite(flipped, 'flip.jpg')

%% Down-sample 01.jpg by scale of 2

down = image(1:2:end,1:2:end,:);
subplot(1,2,1);
imshow(down);
subplot(1,2,2);
imshow(image);

imwrite(down, 'scale.png')
