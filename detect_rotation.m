function [reg_img] =detect_rotation(I1,I2,mode)
I1=rgb2gray(I1);
I2=rgb2gray(I2);
%I1=adapthisteq(I1);
%I2=adapthisteq(I2);
if strcmp(mode, 'Harris')
    points1=detectHarrisFeatures(I1);
    points2=detectHarrisFeatures(I2);
    [features1,valid_points1]=extractFeatures(I1,points1,'BlockSize',13);
    [features2,valid_points2]=extractFeatures(I2,points2,'BlockSize',13);
    indexPairs = matchFeatures(features1,features2,'MaxRatio',0.8);
   %indexPairs = matchFeatures(features1,features2);
    matchedPoints1=valid_points1(indexPairs(:,1),:);
    matchedPoints2=valid_points2(indexPairs(:,2),:);
    figure; ax=axes;
    showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2,'montage','parent',ax);
    [tform, inlierIdx] = estimateGeometricTransform( matchedPoints2,matchedPoints1 , 'similarity');
    %inlierDistorted = matchedPoints2(inlierIdx, :);
    %inlierOriginal  = matchedPoints1(inlierIdx, :);
    Tinv  = tform.invert.T;

    ss = Tinv(2,1);
    sc = Tinv(1,1);
    scaleRecovered = sqrt(ss*ss + sc*sc)
    thetaRecovered = atan2(ss,sc)*180/pi
    I2new=imresize(imrotate(I2,thetaRecovered),scaleRecovered);
    reg_img=I2new;
    figure
    imshowpair(I1, I2new,'Scaling','joint')
    
end
    
if strcmp(mode, 'SURF')
    points1 = detectSURFFeatures(I1,'MetricThreshold',1500);
    points2 = detectSURFFeatures(I2,'MetricThreshold',1500);
    [f1,vpts1] = extractFeatures(I1,points1);
    [f2,vpts2] = extractFeatures(I2,points2); 
    indexPairs = matchFeatures(f1,f2,'MaxRatio',0.9) ;
    matchedPoints1 = vpts1(indexPairs(:,1));
    matchedPoints2 = vpts2(indexPairs(:,2));
    figure;
    showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);
    legend('matched points 1','matched points 2');
    [tform, inlierIdx] = estimateGeometricTransform( matchedPoints2,matchedPoints1 , 'similarity');
    %inlierDistorted = matchedPoints2(inlierIdx, :);
    %inlierOriginal  = matchedPoints1(inlierIdx, :);
    Tinv  = tform.invert.T;

    ss = Tinv(2,1);
    sc = Tinv(1,1);
    scaleRecovered = sqrt(ss*ss + sc*sc)
    thetaRecovered = atan2(ss,sc)*180/pi
    I2new=imresize(imrotate(I2,thetaRecovered),scaleRecovered);
    figure
    imshowpair(I1, I2new,'Scaling','joint')
    reg_img=I2new;
    
end
end

