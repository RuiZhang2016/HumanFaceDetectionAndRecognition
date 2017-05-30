% Use MTCNN for face detection
close all;
clear;
clc;

% Add paths
run startup.m
dataPath=fullfile(home,'data','anufaces');

% Minimum size of face
minsize=50;

% Three steps's threshold
threshold=[0.05 0.02 0.02]; % try [0.9 0.9 0.7], [0.2 0.2 0.4], [0 0 0],[0.05 0.05 0.05]

% Scale factor
factor=0.65;

% Read images
testFiles = dir(dataPath);
testFiles(1) = []; % Remove first two files
testFiles(1) = [];
% faces = cell(0);
% points = [];
% 
% for ii=1:length(testFiles)
%     img=imread(strcat(testFiles(ii).folder,'/',testFiles(ii).name));
%     img = cat(3,img,img,img);
%     [boundingBoxes point] = detectFace(img,minsize,PNet,RNet,ONet,LNet,threshold,false,factor);
%     boxes = int64(boundingBoxes);
%     boxes(boxes<=0) = 1;
%     boxes(boxes>256) = 256;
%     face = img(boxes(1,2):boxes(1,4),boxes(1,1):boxes(1,3));
%     faces{ii} = face;
%     features = [features face2features(face,net)];
%     points = [points point(:,1)];
% end
% 
% 
% save('../../data/croppedfaces/faces.mat','faces');
% save('../../data/croppedfaces/points.mat','points');

features =[];
for ii = 1:size(faces.faces,2)
    features = [features face2features(faces.faces{ii},net)];
end
save('../data/croppedfaces/features.mat','features');