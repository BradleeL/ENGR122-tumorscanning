function [maximumD,RowC,ColR,m,n] = imMax(imDiff)
maximumD = max(max(imDiff));
[RowC, ColR] = find(imDiff == maximumD);
[m,n]= size(imDiff);

imshow(imDiff)
hold on 
plot(RowC, ColR, 'r*')
end