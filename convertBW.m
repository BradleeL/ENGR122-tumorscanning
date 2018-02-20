function [tumorBW,noTumorBW] = convertBW(tumor,noTumor)

tumorBW = rgb2gray(tumor);
noTumorBW = rgb2gray(noTumor);
end
