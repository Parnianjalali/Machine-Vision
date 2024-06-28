function [dis_img] = create_disp(img1,img2,mode);
img1=rgb2gray(img1);
img2=rgb2gray(img2);
if strcmp(mode,'Harris')
    disparityRange = [-6 10];
disparityMap = disparity(img1,img2,'BlockSize',15,'DisparityRange',disparityRange);
%dis_img = disparity(img1,img2);
figure
imshow(disparityMap)
end
if strcmp(mode,'SURF')
dis_img = disparity(img1,img2);
figure
imshow(dis_img)
end
end

