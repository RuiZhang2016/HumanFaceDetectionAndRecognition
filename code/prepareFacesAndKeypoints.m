% Use MTCNN for face detection and save detected faces as well as facial
% key points
close all;
clc;

% Add paths
%run startup.m
% Minimum size of face
minsize=50;

% Three steps's threshold
threshold=[0.8 0.8 0.7]; % [0.8,0.8,0.7]

% Scale factor
factor=0.65;

% Read images
testFiles = dir(dataPath);

for ii=1:1
    img=imread(strcat(testFiles(ii).folder,'/',testFiles(ii).name));
    %img = cat(3,img,img,img);
    tic
    [boundingBoxes facePoints]=detectFace(img,minsize,PNet,RNet,ONet,LNet,...
        threshold,false,factor);
    toc
    boxes = boundingBoxes;
    %save(strcat('../res/detected_faces',num2str(ii),'/facePoints.mat'),'facePoints')
    save(strcat('../res/detected_faces',num2str(ii),'/boundingboxes.mat'),'boundingBoxes')
    nbox=size(boundingBoxes,1);
    display(strcat('#present students: ',num2str(nbox)));
    boxes64 = int64(boundingBoxes);
    f=figure();
    imshow(img);
    hold on;
    color = ['r','g'];
    for jj=1:nbox
        if sum(boxes(jj,1:4)>0)==4
            face = img(boxes64(jj,2):boxes64(jj,4),boxes64(jj,1):boxes64(jj,3),:);
            rectangle('Position',[boxes(jj,1:2) boxes(jj,3:4)-boxes(jj,1:2)],...
                'Edgecolor','g','LineWidth',2);
            imwrite(face,strcat('../res/detected_faces',num2str(ii),'/',num2str(jj),'.jpg'));
        end
    end
end
