%##########################################################################
%####################### CV Final Project Demo ############################
%####################### (with face alignment) ############################
%####################### Rui Zhang  u5963436   ############################
%##########################################################################

% Use MTCNN for face detection
close all;
clc;

% Add paths
run startup.m

% Minimum size of face
minsize=50;

% Three steps's threshold
threshold=[0.8 0.8 0.7];

% Scale factor
factor=0.65;

% Read images
trainingFeatures = load('../res/detected_faces1/features.mat');
knownFaceFiles = dir('../res/detected_faces1/*.jpg');
knownLabels = load('../res/detected_faces1/labels.mat');

% Get the indices of bounding boxes, which are used to get labels
fileIds = [];
for F = 1:size(knownFaceFiles,1)-1
    fileIds = [fileIds str2num(knownFaceFiles(F).name(1:end-4))];
end

classFiles = dir(dataPath);

for ii=3:3
    img=imread(strcat(classFiles(ii).folder,'/',classFiles(ii).name));

    tic
    [boundingBoxes,facePoints]=detectFace(img,minsize,PNet,RNet,ONet,LNet,...
        threshold,false,factor);
    toc
    
    unknownFaceFiles = dir(strcat('../res/detected_faces',num2str(ii),'/*.jpg'));
    unknownLabels = load(strcat('../res/detected_faces',num2str(ii),'/labels.mat'));
    nFaces = size(unknownFaceFiles,1)-1;
    
    % Get the indices of bounding boxes, which are used to get labels
    fileIds2 = [];
    for F = 1:size(unknownFaceFiles,1)-1
        fileIds2 = [fileIds2 str2double(unknownFaceFiles(F).name(1:end-4))];
    end
    
    thresholds = [0.93, 0.91, 0.88, 0.86 0.7];
    faceIds = 1:nFaces;
    res = zeros(nFaces,1);
    predictedLabels = zeros(nFaces,1);
    
    for kk = 1:size(thresholds,2)
        for jj = faceIds
            testFeatures = load(strcat('../res/detected_faces',num2str(ii),...
                '/features',num2str(jj),'.mat')); %[4096 n]
            cosSim = diag(testFeatures.features'*trainingFeatures.features)';
            [sortCosSim, inds] = sort(cosSim,2,'descend');
            if sortCosSim(1)<thresholds(kk)
                continue
            end
%             showTwoImages(unknownFaceFiles(jj),knownFaceFiles(inds(1)));
%             title(sortCosSim(1));
            predictedLabels(fileIds2(jj)) = knownLabels.labels(fileIds(inds(1)));
            if unknownLabels.labels(fileIds2(jj)) == ...
                    knownLabels.labels(fileIds(inds(1)))
                res(fileIds2(jj)) = 1;
            end
            trainingFeatures.features(:,inds(1)) = 0;
            faceIds(faceIds == jj) = [];
            %pause;
        end
    end
    plotResult(img,boundingBoxes,predictedLabels,res,false,'');
end
