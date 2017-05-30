% % Use MTCNN for face detection
% close all;
% clear;
% clc;
% 
% % Add paths
% run startup.m
% 
% % Minimum size of face
% minsize=50;
% 
% % Three steps's threshold
% threshold=[0.9 0.9 0.7];
% 
% % Scale factor
% factor=0.65;
% 
% % Read images
% testFiles = dir(dataPath);
% testFiles(1) = []; % Remove first two files
% testFiles(1) = [];
% faces = cell(0);
% 
% for ii=1:1
%     img=imread(strcat(testFiles(ii).folder,'/',testFiles(ii).name));
%     %img = cat(3,img,img,img);
%     tic
%     [boundingBoxes facePoints]=detectFace(img,minsize,PNet,RNet,ONet,LNet,...
%     threshold,false,factor);
%     toc
%     
%     nbox = size(boundingBoxes,1);
%     boxes = int64(boundingBoxes);
%     for jj=1:nbox
%         if sum(boxes(jj,:)>0)==5
%             face = img(boxes(jj,2):boxes(jj,4),boxes(jj,1):boxes(jj,3),:);
%         end
%     end
% end
