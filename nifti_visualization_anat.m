
%Visualization


function nifti_visualization_anat(path_anat)

% Data retrieval - Anatomical image %

    Da = niftiread(path_anat); % Load NifTI file(Da= Anatomical Data)

    % Compute global minimum and maximum values
    Dmax = max(Da,[],'all'); % Maximum value in the whole scan
    Dmin = min(Da,[],'all'); % Minimum value in the whole scan

    % Normalize the anatomical data to [0, 1]
    Da_n = double(Da - Dmin)./double(Dmax - Dmin);

    % Get the dimensions of the anatomical data
    anat_dims = size(Da_n);

    %
    disp(['Min value in anat_normalized: ', num2str(min(Da_n, [], 'all'))]);
    disp(['Max value in anat_normalized: ', num2str(max(Da_n, [], 'all'))]);

    % Visualization of Anatomical Data %%
    % 3D Visualization
    figure('Name', '3D Visualization - Anatomical Image');
    volshow(Da_n);
    %
    % 2D Slices Visualization
    x_slice = 100; y_slice = 100; z_slice = 100;

    % Extract slices for different views
    % frontal_view = Da_n(:, :, z_slice);
    % sagittal_view = squeeze(Da_n(x_slice, :, :));
    % horizontal_view = squeeze(Da_n(:, y_slice, :));

    frontal_view = Da_n(:,:,z_slice); % Frontal view
    sagittal_view = reshape(Da_n(x_slice,:,:),[anat_dims(2) anat_dims(3)]); % Sagittal view
    horizontal_view = reshape(Da_n(:,y_slice,:),[anat_dims(1) anat_dims(3)]); % Horizontal view


    % Display the slices
    figure('Name', '2D Slices - Anatomical Image');
    subplot(2, 2, 1); imshow(imrotate(frontal_view, 90)); title('Frontal View');
    subplot(2, 2, 2); imshow(imrotate(sagittal_view, 90)); title('Sagittal View');
    subplot(2, 2, 3); imshow(imrotate(horizontal_view, 90)); title('Horizontal View');

end 