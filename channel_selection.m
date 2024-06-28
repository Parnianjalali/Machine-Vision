function [ch_img] = channel_selection(img)
%figure
%subplot(1,5,1)
%imshow(img)
%subplot(1,5,2)
%imshow(img(:,:,1))
R=img(:,:,1);
s1=std(std(double(R)));
%subplot(1,5,3)
%imshow(img(:,:,2))
%subplot(1,5,4)
G=img(:,:,2);
s2=std(std(double(G)));
%imshow(img(:,:,3))
B=img(:,:,3);
s3=std(std(double(B)));
%subplot(1,5,5)
%imshow(rgb2gray(img))
Max=max([s1,s2,s3]);
if Max==s1
   ch_img=R;
end
if Max==s2
   ch_img=G;
end
if Max==s3
   ch_img=B; 
end

end

