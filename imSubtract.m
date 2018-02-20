function imDiff = imSubtract(tumorBW,noTumorBW)

noTumSize = size(noTumorBW);
tumSize = size(tumorBW);
if noTumSize ~= tumSize
    pad1 = noTumSize(1)-tumSize(1);
    pad2 = noTumSize(2)-tumSize(2);
end
tumorBW = padarray(tumorBW,[pad1/2,pad2/2]);
%only made to work currently will probably need to be changed    
imDiff = abs(tumorBW-noTumorBW);
figure
imshow(imDiff)
end