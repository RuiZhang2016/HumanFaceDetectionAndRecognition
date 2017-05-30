% Use VGG net to extract features of faces, without face alignment.
close all;
clear;
clc;

% Add paths
run startup.m
index = 3;
dataPath=fullfile(home,'res',strcat('detected_faces',num2str(index)),'*.jpg');

% Read images
files = dir(dataPath);
facePoints = load('../res/detected_faces1/facePoints.mat');
facePoints2 = load(strcat('../res/detected_faces',num2str(index),'/facePoints.mat'));
boundingBoxes = load('../res/detected_faces1/boundingboxes.mat');
boundingBoxes2 = load(strcat('../res/detected_faces',num2str(index),'/boundingboxes.mat'));

move = [facePoints2.facePoints(1:5,:)'-boundingBoxes2.boundingBoxes(:,1) ...
    facePoints2.facePoints(6:10,:)'-boundingBoxes2.boundingBoxes(:,2)]; % [n,10]
reference = [facePoints.facePoints(1:5,:)'-boundingBoxes.boundingBoxes(:,1) ...
    facePoints.facePoints(6:10,:)'-boundingBoxes.boundingBoxes(:,2)];% [n,10]

% Align anu faces to detected faces and extract their
% features
nKnownFaces = size(boundingBoxes.boundingBoxes,1);
nUnknownFaces = size(boundingBoxes2.boundingBoxes,1);
nPoints = 2;
for unkwn = nUnknownFaces:nUnknownFaces
    features =[];
    img=imread(strcat(files(unkwn).folder,'/',files(unkwn).name));
    for kwn = 1:nKnownFaces-1
        [tform,inlierPtsDistorted,inlierPtsOriginal] =...
            estimateGeometricTransform([move(unkwn,1:nPoints)' move(unkwn,6:(6+nPoints-1))'],...
            [reference(kwn,1:nPoints)' reference(kwn,6:(6+nPoints-1))'],'similarity');
        outputView = imref2d(size(img));
        %Ir = imwarp(img,tform,'OutputView',outputView);
        Ir = imwarp(img,tform);
        features = [features face2features(Ir,net)];
    end
    save(strcat('../res/detected_faces',num2str(index),'/features',...
        num2str(unkwn),'.mat'),'features');
end

