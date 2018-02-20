function [statImg,lengthImg,filterImg,finalImg] = imFilter(fillImg)

statImg = regionprops(fillImg, 'MajorityAxisL');

lengthImg = [statImg.MajorityAxisL];

filterImg = lengthImg > 80;
finalImg = imageStats(filterImg);
disp(finalImg)
end
