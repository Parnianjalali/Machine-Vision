function [text_img] =extract_texture(ch_img,mode,w)
nhood=ones(w,w);
if strcmp(mode, 'range')
text_img= rangefilt(ch_img,nhood);
%imshow(text_img)
end
if strcmp(mode, 'entropy')
text_img= entropyfilt(ch_img,nhood);
%imshow(text_img)
end
if strcmp(mode, 'std')
text_img= stdfilt(ch_img,nhood);
end
end

