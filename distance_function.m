function [d] =distance_function(lbp_hist,lbp_hist_R,dist)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
image1hist=lbp_hist;
image2hist=lbp_hist_R;
%if dist=='Euclidean'
if strcmp(dist,'Euclidean')
d = sqrt(sum((image1hist - image2hist ).^2));
end
%print(d)
%end
%if dist=='cityblock'
if strcmp(dist,'City')
d=abs(sum(image1hist - image2hist ));
end
%end
%if dist=='chessboard'
if strcmp(dist,'Chess')
d=max(abs(image1hist - image2hist ));
end
%end
%print(Euclidean)
end

