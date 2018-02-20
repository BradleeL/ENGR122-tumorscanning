function [bTumor2,bTumor3,bTumor4] = fillRegions(bTumor)
bTumor2 = bwareaopen(bTumor, 5000);
figure
imagesc(bTumor2)

bTumor3 = imopen(bTumor2,strel('disk',100));
imagesc([bTumor2,bTumor3])

bTumor4 = imreconstruct(bTumor3,bTumor2);
imagesc([bTumor2,bTumor4])
end