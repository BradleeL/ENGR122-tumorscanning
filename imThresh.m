function threshIm = imThresh(imDiff,RowC,ColR)
threshIm = imDiff > 8;
figure
imshow(threshIm)
hold on 
plot(RowC, ColR, 'r')
hold off
end
