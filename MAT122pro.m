
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
imtool(diffreImg)

%% Threshold of the Images
threshImg = multithresh(diffreImg,2);
figure
imshow(threshImg)
hold on 
plot(RowC, ColR, '*r')
hold off

%% Filling in the Regions
fillImg= bwareopen(threshImg,  15);
figure
imshow(fillImg)

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

%%would we need to create an entire new fucntion to define the function we
%%have now?
%%need help on thresholds

