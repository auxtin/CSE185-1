function img_filtered = median_filter(img, patch_size)

    % your code here
   img_filtered = zeros(size(img));
   shift_u = patch_size(2);
   shift_v = patch_size(1);
   
   for u = 1+shift_u: size(img, 2)-shift_u
       for v = 1+ shift_v: size(img, 1)-shift_v
           x1 = u - floor(shift_u/2);
           x2 = u + floor(shift_u/2);
           y1 = v - floor(shift_v/2); 
           y2 = v + floor(shift_v/2);
           
           patch = img(y1:y2, x1:x2); 
           
           patch = patch(:);
           value = median(patch);
         
           img_filtered(v, u) = value;
       end
   end
end