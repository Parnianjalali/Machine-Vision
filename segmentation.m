function [bw] = segmentation(I,mode)
%I=imread('C:\Users\Dr Jalali\Desktop\Q1_and_4\colonca1.jpeg');
%figure
%subplot(1,2,1)
%imshow(I)
I=rgb2gray(I);
I=adapthisteq(I);
%I=imclearborder(I);
%I = wiener2(I, [5 5]);
%mode='simple'
if strcmp(mode,'simple')
  [m n]=size(I);
  for i=1:m
      for j=1:n
          if I(i,j)<100
              I(i,j)=255;
          else
              I(i,j)=0;
          end
      end
  end
  bw=I;
  %bw2 = imfill(bw,'holes');
  %subplot(1,2,2)
  %figure
  %imshow(bw)
  %title('Segmented Image using Simple thresholding')
end
if strcmp(mode,'adaptive')
T = adaptthresh(I,0.8);
bw= imbinarize(I,T);
bw=~bw;
%figure
%imshow(bw)
title('Segmented Image using Adaptive thresholding')
end
if strcmp(mode,'otsu')
    [counts,x] = imhist(I);
    %stem(x,counts)
    T = otsuthresh(counts);
   bw = imbinarize(I,T);
   bw=~bw;
    %figure
    %imshow(bw)
    title('Segmented Image using Otsu')
end
if strcmp(mode,'region')
    % read image
reg_maxdist = 0.2;
I = im2double(I);
subplot(1,2,1);
imshow(I);
% let the user pick one point
[x,y] = ginput(1);
% round to integer, required input by regiongrowing

x = round(x); y = round(y);
% plot point on original image
hold on;
plot(x,y,'xg','MarkerSize',20,'LineWidth',2);
hold off;
% get region from seed point
bw = regiongrowing(I,y,x,reg_maxdist);
bw=~bw;
% plot region
subplot(1,2,2);
imshow(bw);
title('Segmented Image using Region Growing')
end
if strcmp(mode,'contours')
    m=10;
    mask=zeros(size(I));
    mask(m:end-m,m:end-m)=1;
    bw=activecontour(I,mask,1500);
    %figure
    %imshow(bw)
    title('Segmented Image using active contours')
end
    
end

