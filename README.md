# Machine Vision Repository

This repository contains various image processing and machine vision tasks, focusing on texture extraction, image registration, depth estimation, and segmentation. The following sections provide an overview of the implemented tasks and their objectives.

## Texture Extraction and Classification

**Task 1:**  
This task involves using the LBP algorithm for texture extraction and classification. Additionally, other texture extraction methods such as `entropyfilt`, `rangefilt`, and `stdfilt` are applied to images. The extracted textures are used to categorize images into different classes.

- **Functions:**
  - `channel_selection(img)`: Selects the color channel with the highest clarity.
  - `extract_texture(ch_img, mode, w)`: Extracts texture from the image using the specified method and window size.
  - `distance_function(tex_img)`: Computes distances between texture images to classify them.

## Image Registration

**Task 2:**  
This task focuses on aligning two MRI images to correct for unwanted movements. Methods like Harris and SURF are used to identify common points between images, allowing for image registration and alignment.

- **Function:**
  - `detect_rotation(img1, img2, mode)`: Registers two images by detecting rotation and aligning them.

## Depth Estimation

**Task 3:**  
This task involves creating disparity maps to estimate depth from pairs of endoscopic images. The depth estimation uses common points between images to compute the disparity.

- **Function:**
  - `create_disp(img1, img2, mode)`: Generates disparity maps from image pairs using specified methods.

## Image Segmentation

**Task 4:**  
This task involves segmenting histopathology images using various methods like simple thresholding, adaptive thresholding, Otsu's method, region growing, and contours. The segmented images are then used to count the number of cells.

- **Function:**
  - `segmentation(img, method)`: Segments the image using the specified method.
  - `cell_counting(seg_img)`: Counts the number of cells in the segmented image.

## Getting Started

### Prerequisites

- Python 3.x
- Libraries: `numpy`, `opencv-python`, `scikit-image`, `matplotlib`

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Parnianjalali/Machine-Vision.git
