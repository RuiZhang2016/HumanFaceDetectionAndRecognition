% Label data

close all;
clc;

% Add paths
%run startup.m

% Minimum size of face
minsize=50;

% Three steps's threshold
threshold=[0.8 0.8 0.7];

% Scale factor
factor=0.65;

% Read images
classFiles = dir(dataPath);

for ii=3:3
    img=imread(strcat(classFiles(ii).folder,'/',classFiles(ii).name));
    
%     
%     [boundingBoxes,facePoints]=detectFace(img,minsize,PNet,RNet,ONet,LNet,...
%         threshold,false,factor);
%     
    boundingBoxes = load(strcat('../res/detected_faces',num2str(ii),'/boundingboxes.mat'))
    boundingBoxes = boundingBoxes.boundingBoxes;
    nfaces = size(boundingBoxes,1);
    
%     BBCenters = [(boundingBoxes(:,1)+boundingBoxes(:,3))/2 ...
%         (boundingBoxes(:,2)+boundingBoxes(:,4))/2];
    
    labels = load(strcat('../res/detected_faces',num2str(ii),'/labels.mat'));
%     labels = zeros(nfaces,1);
    plotResult(img,boundingBoxes,labels.labels,false,'');
%     faceCenters2 = ginput(56-52+1);
%     
%     for jj = 52:56
%         dist = sum((faceCenters2(jj-52+1,:)-BBCenters).^2,2);
%         [A,inds] = sort(dist,1,'ascend');
%         if A(1)>1e6
%             continue
%         end
%         labels(inds(1)) = jj;
%     end
    
    %save(strcat('../res/detected_faces',num2str(ii),'/labels.mat'),'labels');
    
end
