# NIfTI Visualization, Analysis, and DICOM Conversion Toolkit

https://github.com/user-attachments/assets/0efe63d5-b68e-4a95-bd57-51f581bb8800



## Overview
This project provides a comprehensive toolkit for working with NIfTI files, focusing on visualization, signal analysis, and conversion to DICOM format. It is designed to assist researchers and developers in neuroimaging, medical image processing, and related fields.

### Features
- **3D and 2D Visualization**:
  - Visualize anatomical data slices (frontal, sagittal, horizontal views).
  - ![anatomical nitfi view](https://github.com/user-attachments/assets/0a5c2236-4255-4532-8d15-cecfa940b760)
  - Render 3D data with slice planes and record rotating views as videos.
- **Signal Extraction**:
  - Extract and plot voxel-specific BOLD signals over time.
- **NIfTI to DICOM Conversion**:
  - Batch conversion of NIfTI files to DICOM format.

---

## Prerequisites
Ensure you have the following dependencies installed:

### MATLAB Requirements:
- MATLAB R2020b or later.
- Image Processing Toolbox for volshow.

### Python Requirements:
- Python 3.7 or later.
- Libraries:
  ```bash
  pip install nibabel pydicom numpy
  ```

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/TajKab/NIfTI-Visualization-Analysis-and-DICOM-Conversion.git
   cd NIfTI-Visualization-Analysis-and-DICOM-Conversion
   ```
2. Ensure you have MATLAB and/or Python installed on your system.
3. NIfTI files (anat.nii.gz and func.nii.gz).[Anatomical and Functional NifTI files)



---

## Usage

### MATLAB Scripts

#### Visualization and Analysis
1. Open the MATLAB script in your editor.
2. Set the `path_func` variable to the path of your NIfTI file.
3. Run the script to visualize the slices, render 3D views, and extract BOLD signals.
4. Plot the BOLD signal for a specified voxel.

#### Generate Rotating 3D Videos
- Enable the video recording section in the MATLAB code.
- The video will be saved in the current MATLAB working directory.

### Python Scripts

#### NIfTI to DICOM Conversion
1. Set the `input_folder` and `output_folder` variables in the Python script:
   ```python
   input_folder = "path/to/nifti_folder"
   output_folder = "path/to/dicom_folder"
   ```
2. Run the Python script:
   ```bash
   python nifti_to_dicom.py
   ```
3. Converted DICOM files will be saved in the specified output folder.

---

## Folder Structure
```
project-folder/
├── main.m
├── visualize_anatomical.m        # MATLAB script for visualization and analysis
├── visualize_functional.m
├── nifti_to_dicom.py      # Python script for NIfTI to DICOM conversion
├── README.md              # Documentation
└── example_files/        # Example NIfTI files (optional)
```
---
Functions

visualize_anatomical.m

Purpose: Visualizes anatomical NIfTI images.

Input: Path to the anatomical NIfTI file.

Output: 3D visualization and 2D slice views.

Usage:

visualize_anatomical('anat.nii.gz');

visualize_functional.m

Purpose: Visualizes functional NIfTI images and plots the BOLD signal.

Input:

Path to the functional NIfTI file.

Voxel coordinates (x, y, z) for BOLD signal extraction.

Output: 3D visualization, 2D slice views, and BOLD signal plot.

Usage:
---
## Customization

**Voxel Coordinates** : You can specify voxel coordinates for BOLD signal extraction in the `main.m` script.

**Slice Numbers**: Default slice numbers are calculated as midpoints of the dimensions. Modify these in the visualization functions if needed.

---
## Troubleshooting
**Undefined Function Errors**: Ensure all `.m` files are in the same directory and added to the MATLAB path. 
**3D Visualization Issues**: Make sure the Image Processing Toolbox is installed

---

## Contribution
Contributions are welcome! Feel free to open issues or submit pull requests for improvements and new features.

---


## Acknowledgments
- **MATLAB** for its powerful visualization and signal processing capabilities.
- **Nibabel** and **Pydicom** Python libraries for handling NIfTI and DICOM files.
- **Dataset**: https://openneuro.org/ is one of the best platforms for getting medical image data

## Contact
For questions or support, contact tajbiul001@gmail.com

------------------------------

# NIfTI Image Visualization

This project provides a set of MATLAB scripts for visualizing and analyzing **NIfTI (Neuroimaging Informatics Technology Initiative)** files. It includes functionality for 3D and 2D visualization of anatomical and functional brain images, as well as plotting BOLD signals from functional MRI data.

---

## Features

- **3D Visualization**: Displays a 3D rendering of anatomical and functional brain images using `volshow`.
- **2D Visualization**: Extracts and visualizes slices (frontal, sagittal, horizontal) from NIfTI images.
- **BOLD Signal Plotting**: Extracts and plots the Blood Oxygen Level Dependent (BOLD) signal for a specific voxel in functional MRI data.
- Modular functions for anatomical and functional image visualization.

---

## File Structure

```
/ProjectFolder
    ├── anat.nii.gz                # Example anatomical NIfTI file
    ├── func.nii.gz                # Example functional NIfTI file
    ├── main.m                     # Main script to run the project
    ├── visualize_anatomical.m     # Function for anatomical image visualization
    ├── visualize_functional.m     # Function for functional image visualization
    ├── README.md                  # Project documentation
```

---

## Installation

1. **Prerequisites**:
   - MATLAB (R2020a or later recommended).
   - Image Processing Toolbox for `volshow`.
   - NIfTI files (`anat.nii.gz` and `func.nii.gz`).

2. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/nifti-visualization.git
   cd nifti-visualization
   ```

3. **Setup**:
   - Ensure your MATLAB environment is set up correctly with the necessary toolboxes.
   - Place your NIfTI files (`anat.nii.gz`, `func.nii.gz`, etc.) in the project directory.

---

## Usage

1. Open MATLAB and navigate to the project folder.
2. Run the main script:
   ```matlab
   main
   ```
3. The script will:
   - Visualize the anatomical image in 3D and 2D slices.
   - Visualize the functional image in 3D and 2D slices.
   - Plot the BOLD signal for a specified voxel.

---

## Functions

### `visualize_anatomical.m`
- **Purpose**: Visualizes anatomical NIfTI images.
- **Input**: Path to the anatomical NIfTI file.
- **Output**: 3D visualization and 2D slice views.
- **Usage**:
  ```matlab
  visualize_anatomical('anat.nii.gz');
  ```

### `visualize_functional.m`
- **Purpose**: Visualizes functional NIfTI images and plots the BOLD signal.
- **Input**:
  - Path to the functional NIfTI file.
  - Voxel coordinates (x, y, z) for BOLD signal extraction.
- **Output**: 3D visualization, 2D slice views, and BOLD signal plot.
- **Usage**:
  ```matlab
  visualize_functional('func.nii.gz', 40, 30, 25);
  ```

---

## Example Output

### Anatomical Image
- **3D Visualization**:
  ![Anatomical 3D](https://via.placeholder.com/600x400?text=Anatomical+3D+Visualization)
- **2D Slices**:
  ![Anatomical 2D](https://via.placeholder.com/600x400?text=Anatomical+2D+Slices)

### Functional Image
- **3D Visualization**:
  ![Functional 3D](https://via.placeholder.com/600x400?text=Functional+3D+Visualization)
- **BOLD Signal**:
  ![BOLD Signal](https://via.placeholder.com/600x400?text=BOLD+Signal+Plot)

---

## Customization

- **Voxel Coordinates**: You can specify voxel coordinates for BOLD signal extraction in the `main.m` script.
- **Slice Numbers**: Default slice numbers are calculated as midpoints of the dimensions. Modify these in the visualization functions if needed.

---

## Troubleshooting

- **Undefined Function Errors**: Ensure all `.m` files are in the same directory and added to the MATLAB path.
- **3D Visualization Issues**: Make sure the Image Processing Toolbox is installed.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Contributing

Contributions are welcome! Feel free to fork the repository, make changes, and submit a pull request.

---

## Contact

For questions or support, contact [your-email@example.com](mailto:your-email@example.com).



