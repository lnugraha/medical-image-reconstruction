function reconstructed = fbp_revisited(sinogram)
    sinogram = sinogram';
    num_proj = size(sinogram,1);    % Projection Slices
    num_dets = size(sinogram,2);    % Image Size

    sinogram_zp   = zeros(num_proj, num_dets*2);
    reconstructed = zeros(num_dets,num_dets);
    sinogram_zp(1:num_proj, 1:num_dets) = sinogram;

    f_sinogram_zp = fft(sinogram_zp, [], 2);

    %%%%%%%%%%%%%%%%%%%%%% DESIGN RAMP FILTER %%%%%%%%%%%%%%%%%%%%%%%%%
    rho = zeros(1,2*num_dets);

    for(i = 1:num_dets-1)
      rho(i) = i-1;
    end

    rho(num_dets*2:-1:num_dets+2) = rho(2:num_dets);
    rho  = rho/num_proj;
    rhos = repmat(rho, num_proj, 1);

    %%%%%%%%%%%%%%%%%%%%%%%%% CONVOLUTION PART %%%%%%%%%%%%%%%%%%%%%%%%%
    f_filt_sinogram_zp = f_sinogram_zp .* rhos;   %%% WITH filter    %%%
    % f_filt_sinogram_zp = f_sinogram_zp;         %%% WITHOUT filter %%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    filt_sinogram_zp = ifft(f_filt_sinogram_zp, [], 2);
    filt_sinogram    = real(filt_sinogram_zp(:, 1:num_dets));

    zp_length = ceil(size(filt_sinogram,2)*sqrt(2));
    if (mod(zp_length,2)~=0)
      zp_length = zp_length+1;
    end

    filt_sinogram_zp2 = zeros(num_proj, zp_length);
    padding = (zp_length-size(filt_sinogram,2))/2;  % zero-padding 
    filt_sinogram_zp2(:, padding+1:padding+num_dets) = filt_sinogram;

    for(p=1:num_proj)
      proj_angle = (p-1)*pi/num_proj;
    
      y   = [-num_dets/2:(num_dets/2)-1]/(num_dets/2);
      x   = y';
      xy  = x*ones(1,num_dets) + j*ones(num_dets,1)*y;
        
      idx = real(xy*exp(j*proj_angle));
      fp  = filt_sinogram_zp2(p,:);
      idx                      = round(idx*num_dets/2+(zp_length+1)/2);
      idx(find(idx<1))         = 1;
      idx(find(idx>zp_length)) = num_dets;

      reconstructed = reconstructed+fp(idx);
    end

fprintf("Image Size      : %d \n", num_dets);
fprintf("Projection Slice: %d \n", num_proj);
colormap(gray); imagesc(reconstructed); title("Filtered Back Projection (FBP)");
end