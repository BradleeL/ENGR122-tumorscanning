function [tumorHighlight] = Segmentation_Fn()
%% Get Images
%[tumor, noTumor] = getImages();
[tumor,noTumor] = selectFile();

%% Converting from color to black and white
[tumorBW,noTumorBW] = convertBW(tumor,noTumor);

%% Showing Black and white images
showBW(tumorBW,noTumorBW);

%% If images are different sizes, pad
%noTumorBW = imPad(noTumorBW);

%% Subtracting the images
imDiff = imSubtract(tumorBW,noTumorBW);

%% Finding Maximum Location or Difference
[maximumD,RowC,ColR,m,n] = imMax(imDiff);

%% Using imtool to determine the Threshold as well as the length 
[imDiff,thresh,seg_I,bTumor] = threshLength(imDiff);

%% Threshold of the Images
threshIm = imThresh(imDiff,RowC,ColR);

%% Filling in the Regions
[bTumor2,bTumor3,bTumor4] = fillRegions(bTumor)

%% Overlap OG image
%overlapImg=imoverlay();
%tumorHighlight = overlapImg;

%got to figure out what this does
%% Filtering out images smaller than 80
%[statImg,lengthImg,filterImg,finalImg] = imFilter(fillImg)
%IDK what this does
%% Naming the significance of the change

if isempty(finalImg)
    disp('No tumor')
else 
    disp('Tumor')
end 
end 

%%would we need to create an entire new fucntion to define the function we
%%have now?
%%need help on thresholds

