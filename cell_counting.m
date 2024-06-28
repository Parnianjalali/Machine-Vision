function [num] = cell_counting(bw2,I)
I=rgb2gray(I);
I=adapthisteq(I);
I = imclearborder(I);
I = wiener2(I, [5 5]);

bw2 = imfill(bw2,'holes');
%subplot(1,2,2)
%imshow(bw2)
bw3 = imopen(bw2,strel('disk',2));
bw4 = bwareaopen(bw3, 100);

bw4_perim = bwperim(bw4);
overlay1 = imoverlay(I,bw4_perim, [1 .3 .3]);

maxs = imextendedmax(I, 5);
maxs = imclose(maxs, strel('disk',3));
maxs = imfill(maxs, 'holes');
maxs = bwareaopen(maxs, 2);
overlay2 = imoverlay(I, bw4_perim | maxs, [1 .3 .3]);

Jc = imcomplement(I);
I_mod = imimposemin(Jc, ~bw4 | maxs);

L = watershed(I_mod);
labeledImage = label2rgb(L);
[L, num] = bwlabel(L);

end

