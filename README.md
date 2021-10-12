## Medical Imaging Reconstruction Algorithm General Endpoint (M.I.R.A.G.E) ##

##  Introduction ##
Reconstructing medical images from raw data stored as DICOM format

## Visualization of Inverse Radon Transform Using Arithmetic Libraries (V.I.R.T.U.A.L) ##

##### Keywords: CT Scanners, Inverse Radon Transform, Sinogram, and Image Reconstruction #####
##### 關進     : CT掃描, 對偶雷登變換, 正弦圖, 圖像重建                                    #####
##### キーワード: CTスキャナ, 逆ラドン変換, 画像の再構成, サイノグラム                       #####

## Introduction ##

<ol>
  <li/> CT Inverse Radon Transformation </li>
    <ul>
      <li /> Algebraic Reconstruction Technique (<b>ART</b>) -- <b>Iterative Method</b> </li>
      <li /> Filtered Back Projection (<b>FBP</b>) </li>
    </ul>
  <li/> CT Reconstruction in 2D Domain </li>
  <li/> CT Reconstruction in 3D Domain </li>
</ol>

What will be a typical size of CT image slices? Are they always square-shaped? For most clinical applications, resolution of cross-sectional images are set to 512 x 512 pixels and 1024 x 1024 pixels or more for the state-of-the-art CT scanners (research purpose), see reference below. Therefore, it is safe to assume that a CT image slice will always come with a size of 512 x 512 pixels, as such size has been well enthrenced in the radiological community as a standard.

## Comparison between ART and FBP ##
The following table compares each reconstructed image with the original version. Each image has a size of 128 x 128 pixels.
<p align="center">
<table>
  <tr>
    <th>Original Image </th>
    <th>ART Reconstructed </th> 
    <th>FBP Reconstructed </th>
  </tr>
  <tr>
    <th> <image src="./reconstructed/shepp_logan_original.png" height="250" width="250"> </th>
    <th> <image src="./reconstructed/shepp_logan_ART.png" height="250" width="250"> </th>
    <th> <image src="./reconstructed/shepp_logan_FBP.png" height="250" width="250"> </th>
  </tr>
</table>
</p>

|   |**ART**|**FBP**|
|:----------|:----------:|:----------:|
| **Speed**      | Slow       | Fast       |
| **Resolution** | Poor       | Good       | 
| **Contrast**   | Good       | Poor       |
| **Noise**      | Low        | High       |


## CT Reconstruction in 2D Domain ##
<p align="center">
<image src="./reconstructed/pinnacle3-8.2g-phantom-chest.gif">
</p>

## CT Reconstruction in 3D Domain ##
<p align="center">
<image src="./reconstructed/pinnacle3-8.2g-phantom-chest.png">
</p>

## CT Window Filtering ##
<p align="center"> Coming Soon... </p>

<hr />

## References ##
1. Martin J. Willemink and Peter B. Noel. (2018). "The Evolution of Image Reconstruction for CT - from Filtered Back Projection to Artificial Intelligence". European Radiology [download](https://doi.org/10.1007/s00330-018-5810-7)
2. Avinash Kak and Malcolm Slaney. (1988). "Principles of Computerized Tomographic Imaging Chapter 3 and 7". IEEE PRESS. New York [download](http://www.mat.uniroma2.it/~picard/SMC/didattica/materiali_did/Anal.Armon./Principles_of_CT_Imaging/Kak&Slaney-CTI-reduced.pdf)
3. Jerrold T. Bushberg, J. Anthony Seibert, Edwin M. Leidholdt Jr., and John M. Boone. (2011). "The Essential Physics of Medical Imaging, Third Edition". LWW; Third, North American Edition [download](https://www.amazon.com/Essential-Physics-Medical-Imaging-Third/dp/0781780578)
