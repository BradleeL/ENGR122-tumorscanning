function [tumor, noTumor] = getImages()
%% Read in Images 
tumor = imread('t.png');
noTumor = imread('not.png');

%% Display the color Images
figure 
imshow(tumor)
figure 
imshow(noTumor)