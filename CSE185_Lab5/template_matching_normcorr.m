function [output, match] = template_matching_normcorr(img, template, threshold)
    
    output = img;
    %% your code here   
    shift_u = size(template,2);
    shift_v = size(template,1);
    
    for u = 1 + shift_u : size(img, 2) - shift_u 
        for v = 1 + shift_v : size(img, 1) - shift_v
           x1 = u - floor(shift_u/2);
           x2 = u + floor(shift_u/2);
           y1 = v - floor(shift_v/2); 
           y2 = v + floor(shift_v/2);
            
           patch = img(y1:y2, x1:x2); 
           
           patch2 = patch(:);
           template2 = template(:);
           
           patch2 = patch2 - mean(patch2);
           template2 = template2 - mean(template2);
          
           patch2 = patch2/norm(patch2);
           template2 = template2/norm(template2);
           
           normcorr = dot(patch2, template2);
           
           output(v, u) = normcorr;
        end
    end
    
    %% threshold
    match = (output > threshold);
    
end