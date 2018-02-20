function [imDiff,thresh,seg_I,bTumor] = threshLength(imDiff)
%%imtool(diffreImg)
imDiff = mat2gray(imDiff);
thresh = multithresh(imDiff,2);
seg_I = imquantize(imDiff,thresh);

bTumor = seg_I == 3;
imagesc(bTumor)
end
