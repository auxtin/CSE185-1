function img_filtered = sobel_filter(img, kernel)

    % your code here
   img_filtered = zeros(size(img));
   shift_u = size(kernel,2);
   shift_v = size(kernel,1);
   
   for u = 1+shift_u: size(img, 2)-shift_u
       for v = 1+ shift_v: size(img, 1)-shift_v
           x1 = u - floor(shift_u/2);
           x2 = u + floor(shift_u/2);
           y1 = v - floor(shift_v/2); 
           y2 = v + floor(shift_v/2);
           
           patch = img(y1:y2, x1:x2); 
           patch = patch .* kernel;
           patch = patch(:);
  
           value = sum(patch);
           value = sum(value);
         
           img_filtered(v, u) = value;
       end
   end
end