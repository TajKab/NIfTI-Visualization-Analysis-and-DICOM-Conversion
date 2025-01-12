% MEdical Image Analysis
% Main script to visualize NIfTI files
clear all;
close all;
% File paths for anatomical and functional images
path_anat = "sub-01_ses-1_T1w.nii.gz"; % Replace with the actual path to the anatomical file
path_func = "sub-01_ses-1_task-motor_run-10_bold.nii.gz"; % Replace with the actual path to the functional file

% Call the functions to visualize the images
disp('Visualizing Anatomical Image...');
nifti_visualization_anat(path_anat);

% Voxel coordinates for BOLD signal extraction (for functional visualization)
voxel_x = 40; % Example x-coordinate
voxel_y = 30; % Example y-coordinate
voxel_z = 25; % Example z-coordinate

disp('Visualizing Functional Image...');
nifti_visualize_func(path_func, voxel_x, voxel_y, voxel_z);
