
path_func = "sub-01_ses-1_task-motor_run-10_bold.nii.gz"
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
% figure;
% alpha = (0:255)/256;
% alpha(1:100) = 0;
% hVol = volshow(Dfm, 'Alphamap', alpha');

% 3D Visualization with Slice Planes
figure;
hold on;
x_slice = round(func_dims(1) / 2);
y_slice = round(func_dims(2) / 2);
z_slice = round(func_dims(3) / 2);

% Slice visualization
hSliceX = slice(Df_n, x_slice, [], []);
hSliceY = slice(Df_n, [], y_slice, []);
hSliceZ = slice(Df_n, [], [], z_slice);

set([hSliceX, hSliceY, hSliceZ], 'EdgeColor', 'none');

colormap('jet');
colorbar;
axis equal tight;
xlabel('X'); ylabel('Y'); zlabel('Z');
view(3);

% Initialize VideoWriter for recording the 3D visualization
videoName = '3D_visualization_slices.mp4';
video = VideoWriter(videoName, 'MPEG-4');
video.FrameRate = 30; % Frames per second
open(video);

% Rotate and Capture Frames
disp('Recording 3D visualization...');
for angle = 0:360
    view(angle, 30); % Rotate the view
    frame = getframe(gcf); % Capture the current figure
    writeVideo(video, frame); % Write the frame to the video
end

close(video);
disp(['3D visualization saved as ' videoName]);

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
subplot(2, 2, 3); imshow(imrotate(horizontal_view, 90)); title('Horizontal View');


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