function [tumor,noTumor] = selectFile()
%folderName = uigetdir;
%file = fullfile(folderName,fileName);
uigetdir

tumor = imread('t.png');
noTumor = imread('not.png');

%% Display the color Images
figure 
imshow(tumor)
figure 
imshow(noTumor)
end


