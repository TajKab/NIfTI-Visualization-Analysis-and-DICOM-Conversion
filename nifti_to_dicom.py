import os
import nibabel as nib
import numpy as np
import pydicom
from pydicom.dataset import Dataset, FileDataset
from datetime import datetime

def nifti_to_dicom(input_folder, output_folder):
    """
    Convert all NIfTI files in a folder to DICOM format.

    Parameters:
        input_folder (str): Path to the folder containing NIfTI files.
        output_folder (str): Path to the folder to save DICOM files.
    """
    # Ensure the output folder exists
    os.makedirs(output_folder, exist_ok=True)

    # Get a list of all NIfTI files in the input folder
    nifti_files = [f for f in os.listdir(input_folder) if f.endswith(('.nii', '.nii.gz'))]

    if not nifti_files:
        print("No NIfTI files found in the input folder.")
        return

    print(f"Found {len(nifti_files)} NIfTI file(s). Converting to DICOM...")

    for nifti_file in nifti_files:
        nifti_path = os.path.join(input_folder, nifti_file)
        dicom_output_path = os.path.join(output_folder, os.path.splitext(nifti_file)[0])
        os.makedirs(dicom_output_path, exist_ok=True)

        # Load the NIfTI file
        nifti_img = nib.load(nifti_path)
        nifti_data = nifti_img.get_fdata()
        affine = nifti_img.affine
        num_slices = nifti_data.shape[2]

        # Iterate through slices and save as DICOM
        for slice_idx in range(num_slices):
            # Create a new DICOM dataset
            ds = Dataset()
            ds.PatientName = "Anonymous"
            ds.PatientID = "123456"
            ds.Modality = "MR"
            ds.SeriesInstanceUID = "1.2.3"
            ds.SOPInstanceUID = f"1.2.3.{slice_idx + 1}"
            ds.StudyDate = datetime.now().strftime("%Y%m%d")
            ds.StudyTime = datetime.now().strftime("%H%M%S")
            ds.Rows, ds.Columns = nifti_data.shape[:2]

            # Add pixel data
            ds.PixelData = nifti_data[:, :, slice_idx].astype(np.int16).tobytes()
            ds.BitsAllocated = 16
            ds.BitsStored = 16
            ds.HighBit = 15
            ds.PixelRepresentation = 1
            ds.SamplesPerPixel = 1
            ds.PhotometricInterpretation = "MONOCHROME2"

            # Save as DICOM file
            dicom_file_path = os.path.join(dicom_output_path, f"slice_{slice_idx:04d}.dcm")
            pydicom.filewriter.dcmwrite(dicom_file_path, ds)

        print(f"Converted {nifti_file} to DICOM. Saved in {dicom_output_path}")

    print("Conversion completed!")

# Usage example
input_folder = "path/to/nifti_folder"  # Replace with the path to your NIfTI folder
output_folder = "path/to/dicom_folder"  # Replace with the path to your output folder
nifti_to_dicom(input_folder, output_folder)
