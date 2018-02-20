function [tumorHighlight] = Segmentation_Fn()
%% Get Images
[tumor, noTumor] = getImages();


%% Converting from color to black and white
tumorBW = rgb2gray(tumor);
noTumorBW= rgb2gray(noTumor);

%% Showing Black and white images
figure 
imshow(tumorBW)
figure
imshow(noTumorBW)


%% If images are different sizes, pad
noTumorBW = padarray(noTumorBW,[2,11]);
%write to find functions difference

%% Subtracting the images
diffreImg = abs(tumorBW-noTumorBW);
figure
imshow(diffreImg)

%% Finding Maximum Location or Difference
maximumD= max(max(diffreImg));
[RowC, ColR] = find(diffreImg == maximumD);
[m,n]= size(diffreImg);

imshow(diffreImg)
hold on 
plot(RowC, ColR, 'r*')

%% Using imtool to determine the Threshold as well as the length 
%%imtool(diffreImg)
diffreImg = mat2gray(diffreImg);
thresh = multithresh(diffreImg,2);
seg_I = imquantize(diffreImg,thresh);

bTumor = seg_I == 3;
imagesc(bTumor)

%% Threshold of the Images
threshImg= diffreImg > 8;
figure
imshow(threshImg)
hold on 
plot(RowC, ColR, '*r')
hold off

%% Filling in the Regions
bTumor2 = bwareaopen(bTumor, 5000);
figure
imagesc(bTumor2)

bTumor3 = imopen(bTumor2,strel('disk',50));
imagesc([bTumor2,bTumor3])

bTumor4 = imreconstruct(bTumor3,bTumor2);
imagesc([bTumor2,bTumor4])


%% Overlap OG image
overlapImg=imoverlay(noTumor)

tumorHighlight = overlapImg;


%% Filtering out images smaller than 80

statImg= regionprops(fillImg, 'MajorityAxisL');

lengthImg = [statImg.MajorityAxisL];

filterImg = lengthImg > 80;
finalImg = imageStats(filterImg);
disp(finalImg)

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

