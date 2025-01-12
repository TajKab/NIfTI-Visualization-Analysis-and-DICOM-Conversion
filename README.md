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
- Image Processing Toolbox.

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

---

## Usage

### MATLAB Scripts

#### Visualization and Analysis
1. Open the MATLAB script in your editor.
2. Set the `path_func` variable to the path of your NIfTI file.
3. Run the script to visualize the slices, render 3D views, and extract BOLD signals.

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
├── nifti_toolkit.m        # MATLAB script for visualization and analysis
├── nifti_to_dicom.py      # Python script for NIfTI to DICOM conversion
├── README.md              # Documentation
└── example_files/         # Example NIfTI files (optional)
```
---

## Contribution
Contributions are welcome! Feel free to open issues or submit pull requests for improvements and new features.

---

## Acknowledgments
- **MATLAB** for its powerful visualization and signal processing capabilities.
- **Nibabel** and **Pydicom** Python libraries for handling NIfTI and DICOM files.
- **Dataset**: https://openneuro.org/ is one of the best platforms for getting medical image data

