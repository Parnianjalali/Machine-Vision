clear 
close all

%% HW3_1 Invoke function
path = './Q1_and_4';
names = dir([path '/*.jpeg']);
w = 5;
mode = {'range','entropy','std'};
k=1;
for i=1:3 
	for j=1:length(names)
		name = names(j).name;
		img = imread([path '/' name]);
        img=im2double(img);
 		ch_img = channel_selection(img);
 		tex_img(k,:,:) = extract_texture(ch_img,mode{i},w);
		k = k + 1;
	end
end	

d = zeros(4);
ind1 = 1;
ind2 = 1;
for i=1:length(names)
	for j=1:length(names)
		img1 = tex_img(i,:,:);
		img2 = tex_img(j,:,:);
		dist = 'Euclidean';
		d(ind1,ind2) = distance_function(img1(:),img2(:),dist);
		ind2 = ind2 + 1;
	end
	ind1 = ind1 + 1;
    ind2=1;
end	
c = select_class(d,mode{1});

i=i+1;
j=j+1;
ind1 =1; 
ind2 =1;
d = zeros(4);
for m=i:2*length(names)
	for n=j:2*length(names)
		img1 = tex_img(m,:,:);
		img2 = tex_img(n,:,:);
		dist = 'Euclidean';
		d(ind1,ind2) = distance_function(img1(:),img2(:),dist);
		ind2 = ind2 + 1;
	end
	ind1 = ind1 + 1;
    ind2=1;
end	
c = select_class(d,mode{2});

i=9;
j=9;
ind1 =1; 
ind2 =1;
d = zeros(4);
for p=i:3*length(names)
	for q=j:3*length(names)
		img1 = tex_img(p,:,:);
		img2 = tex_img(q,:,:);
		dist = 'Euclidean';
		d(ind1,ind2) = distance_function(img1(:),img2(:),dist);
		ind2 = ind2 + 1;
	end
	ind1 = ind1 + 1;
    ind2=1;
end	
c = select_class(d,mode{3});
%% HW3_2 Invoke Function
path = './Q2';
names = dir([path '/*.png']);
mode = {'SURF','Harris'};
name = names(1).name;
img1 = imread([path '/' name]);
name = names(2).name;
img2 = imread([path '/' name]);
reg_img1 =detect_rotation(img1,img2,mode{1});
reg_img2 =detect_rotation(img1,img2,mode{2});

%% HW3_3 Invoke Function
path = './Q3';
names = dir([path '/*.jpg']);
mode = {'SURF','Harris'};

name = names(1).name;
img1 = imread([path '/' name]);
name = names(2).name;
img2 = imread([path '/' name]);
dis_img1 = create_disp(img1,img2,mode{1});

name = names(2).name;
img1 = imread([path '/' name]);
name = names(3).name;
img2 = imread([path '/' name]);
dis_img2 = create_disp(img1,img2,mode{1});

name = names(1).name;
img1 = imread([path '/' name]);
name = names(2).name;
img2 = imread([path '/' name]);
dis_img3 = create_disp(img1,img2,mode{2});

name = names(2).name;
img1 = imread([path '/' name]);
name = names(3).name;
img2 = imread([path '/' name]);
dis_img4 = create_disp(img1,img2,mode{2});

%% HW3_4 Invoke Function
path = './Q1_and_4';
names = dir([path '/*.jpeg']);
w = 5;
mode = {'simple','adaptive','otsu','region','contours'};
k=1;
for i=1:3 
	for j=1:length(names)
		name = names(j).name;
		img = imread([path '/' name]);
 		seg_img(:,:,k) = segmentation(img,mode{i});
		cell_num(k) = cell_counting(seg_img(:,:,k));
		k = k + 1;
	end
end	