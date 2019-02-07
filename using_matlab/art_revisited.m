function reconstructed = art_revisited(sinogram)
    
    num_proj = size(sinogram,2);
    num_dets = size(sinogram,1);
    
    error = 1000;
    iteration = 0;
    % Initialize the reconstructed image as a 128 x 128 array of zeros.
    img_mat_current = zeros(num_dets, num_dets);
    %for each iteration check convergence criteria

    while(error > 0.01)
      %store the most recent image guess for comparison at end of iteration
      img_mat_prev = img_mat_current;
      %for each angle
      for(i=1:num_proj)
        % disp(i)
        phi = (i-1)*180/num_proj;       
        img_mat_current = imrotate(img_mat_current, phi,'bilinear','crop');
        % estimate projection from image guess
        predicted_projection = sum(img_mat_current,2);
        % calculate error between estimated and true projections
        error_count = predicted_projection - sinogram(:,i);
        % distribute the error across all the columns of each row
        error_matrix = repmat(error_count/num_dets, 1, num_dets);
        img_mat_current = img_mat_current - error_matrix;
                        
        % reverse rotation
        img_mat_current = imrotate(img_mat_current, -phi,'bilinear', 'crop');
                    
        iteration = iteration+1;
      end
    % after rotating all angles, check the convergence criteria
    error = mean(mean(abs(img_mat_prev - img_mat_current)));
    end

fprintf("Image Size      : %d \n", num_dets);
fprintf("Projection Slice: %d \n", num_proj);
fprintf("Iteration Number: %d \n", iteration);
imagesc(img_mat_current); colormap(gray); title('Algebraic Reconstruction Technique (ART)');

end