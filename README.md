<h3> Visualization of Inverse Radon Transform Using Arithmetic Libraries (VIRTUAL) </h3> <hr />

##### Keywords: CT Scanners, Inverse Radon Transform, Sinogram, and Image Reconstruction  #####
##### 關進     : CT掃描, 對偶雷登變換, 正弦圖, 圖像重建                                        #####
##### キーワード: CTスキャナ, 逆ラドン変換, 画像の再構成, サイノグラム                            #####

### Introduction/簡介/紹介 ###

<p align="center">"<i>Seeing is believing</i>"; "百聽不如一見"</center>; "百聞は一見にしかず"</p> <br />

<p align="justify">All idioms above describe how important an image is compared with hundreds of words. We would like reconstruct CT images from their respective sinogram (raw data). Assuming readers are already familiar with <b>Radon Transform</b>, this repository attempts to reconstruct a CT sinogram using the following two popular methods:</p>

<ol>
  <li /> Algebraic Reconstruction Technique (<b>ART</b>) </li>
  <li /> Filtered Back Projection (<b>FBP</b>) </li>
</ol>

### Comparison between ART and FBP ###

<table>
  <tr>
    <th>Original Image </th>
    <th>ART Reconstructed </th> 
    <th>FBP Reconstructed </th>
  </tr>
  <tr>
    <td> <image src="./reconstructed/shepp_logan_original.png" height="300" width="300"> </td>
    <td> <image src="./reconstructed/shepp_logan_ART.png" height="300" width="300"> </td>
    <td> <image src="./reconstructed/shepp_logan_FBP.png" height="300" width="300"> </td>
  </tr>
</table>

|   |**ART**|**FBP**|
|:----------|:----------:|:----------:|
| **Speed**      | Slow       | Fast       |
| **Resolution** | Poor       | Good       | 
| **Contrast**   | Good       | Poor       |
| **Noise**      | Low        | High       |

<hr />

### Progress Line ###
- [ ] Algebraic Reconstruction Technique (**ART**)
- [ ] Filtered Back Projection (**FBP**) -- using ramp filter 

### TO DO ###
- [ ] Walkthrough with Jupyter Notebook
- [ ] Documentation using DoxygenPy
- [ ] Build modules and packages (pip)

