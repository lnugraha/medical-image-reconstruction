clear all; clc;

% Load your sinogram
load("./raw_data/phantom_sinogram.mat");
pkg load image % enable imrotate module
% sinogram = ct_data; 
sinogram = phantom_data; % if using phantom_sinogram

% 1. Filtered Back Projection
fbp_revisited(sinogram);

% 2. Algebraic Reconstruction Technique 
% art_revisited(phantom_data);