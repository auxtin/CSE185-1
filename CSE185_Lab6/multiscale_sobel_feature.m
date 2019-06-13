function feature = multiscale_sobel_feature(img, scale)

    % initialize feature vector
    feature = [];
    
    for i = 1:scale
        
        % compute sobel feature
        
        [~, orientation] = sobel_feature(img); % change img to your sobel feature (magnitude or theta)
        
        % concatenate feature vector
        %feature = cat(1, feature, magnitude(:));
        feature = cat(1, feature, orientation(:));
        
        % down-sample image by 2
        img = imresize(img, 1/2);

    end
    
end