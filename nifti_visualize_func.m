function nifti_visualize_func(path_func, voxel_x, voxel_y, voxel_z)

    % Dfta retrieval - Anatomical image %

    Df = niftiread(path_func); % Load NifTI file(Df= Anatomical Dfta)
    Dfm = mean(Df, 4);


    % Compute global minimum and maximum values
    Dfmax = max(Dfm,[],'all'); % Maximum value in the whole scan
    Dfmin = min(Dfm,[],'all'); % Minimum value in the whole scan

    % Normalize the anatomical Dfta to [0, 1]
    Df_n = double(Dfm - Dfmin)./double(Dfmax - Dfmin);

    % Get the dimensions of the anatomical Dfta
    func_dims = size(Df_n);

    %
    disp(['Min value in anat_normalized: ', num2str(min(Df_n, [], 'all'))]);
    disp(['Max value in anat_normalized: ', num2str(max(Df_n, [], 'all'))]);

    % Visualization of Anatomical Dfta %%

    % 3D visualization %
    figure;
    alpha = (0:255)/256;
    alpha(1:100) = 0;
    volshow(Dfm,'Alphamap',alpha');

    % 2D Slices Visualization
    %x_slice = 40; y_slice = 35; z_slice = 32;
    % Define slicing indices
    x_slice = round(func_dims(1) / 2);
    y_slice = round(func_dims(2) / 2);
    z_slice = round(func_dims(3) / 2);
    % Extract slices for different views
    % frontal_view = Df_n(:, :, z_slice);
    % sagittal_view = squeeze(Df_n(x_slice, :, :));
    % horizontal_view = squeeze(Df_n(:, y_slice, :));

    frontal_view = Df_n(:,:,z_slice); % Frontal view
    sagittal_view = reshape(Df_n(x_slice,:,:),[func_dims(2) func_dims(3)]); % Sagittal view
    horizontal_view = reshape(Df_n(:,y_slice,:),[func_dims(1) func_dims(3)]); % Horizontal view


    % Display the slices
    figure;
    subplot(2, 2, 1); imshow(imrotate(frontal_view, 90)); title('Frontal View');
    subplot(2, 2, 2); imshow(imrotate(sagittal_view, 90)); title('Sagittal View');
    subplot(2, 2, 3); imshow(imrotate(horizontal_view,90)); title('Horizontal View');


    % Voxel BOLD Signal Extraction
    % Specify voxel coordinates (x, y, z)
    voxel_x = 40; % Example x-coordinate
    voxel_y = 30; % Example y-coordinate
    voxel_z = 25; % Example z-coordin
    % Extract the BOLD signal for the specified voxel
    voxel_signal = squeeze(Df(voxel_x, voxel_y, voxel_z, :));
    figure;
    plot(1:length(voxel_signal), voxel_signal, 'LineWidth', 1.5);
    title(['BOLD Signal at Voxel (' num2str(voxel_x) ',' num2str(voxel_y) ',' num2str(voxel_z) ')']);
    xlabel('Time (s)');
    ylabel('Signal Intensity (mV)');
    grid on;

end