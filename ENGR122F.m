
%% Get Images
[tumor, noTumor] = getImages();


%% Converting from color to black and white
convertBW()

%% Showing Black and white images
showBW()

%% If images are different sizes, pad
noTumorBW = padarray(noTumorBW,[2,11]);
%write to find functions difference

%% Subtracting the images(changed diffreImg to imDiff)
imSubtract()

%% Finding Maximum Location or Difference
imMax()

%% Using imtool to determine the Threshold as well as the length 
imtool(imDiff)

%% Threshold of the Images
imThresh()
%% Filling in the Regions
fillImg= bwareopen(threshImg,  15);
figure
imshow(fillImg)

%% Overlap OG image
overlapImg=imoverlay(noTumor)

tumorHighlight = overlapImg;

%% Filtering out images smaller than 80
imFilter()

%% Naming the significance of the change

if isempty(finalImg)
    disp('No tumor')
else 
    disp('Tumor')
end 

%%would we need to create an entire new fucntion to define the function we
%%have now?
%%need help on thresholds

